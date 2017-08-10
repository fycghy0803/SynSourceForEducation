package com.hysoft.util.conn;

import java.sql.Connection;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;

import com.hysoft.util.database.sub.MySqlDatabaseOption;
import com.hysoft.util.database.sub.SqlServer2000Option;
import com.hysoft.util.forms.TargetServerForm;
import com.hysoft.util.ftp.FtpClientUtil;
import com.hysoft.util.xml.SourceServerForXML;
import com.hysoft.util.xml.TargetServerForXml;

public class ConnsPool {
	private Logger loger = Logger.getRootLogger();
    private HashMap<String,MySqlDatabaseOption> targetDatabaseConns = new HashMap<String,MySqlDatabaseOption>();
    private HashMap<String, FtpClientUtil> targetFtpConns = new HashMap<String,FtpClientUtil>();
    private FtpClientUtil ftpNormal;
    private FtpClientUtil ftpFormula;
    private MySqlDatabaseOption msSourceOption;
    private SqlServer2000Option sql2000Option;
    private TargetServerForXml tXml = TargetServerForXml.getInstance();
    private List<TargetServerForm> tServerForms;
    
    public FtpClientUtil getTargetFtpConns(String serverId) {
    	return targetFtpConns.get(serverId);
    }
    
    public Connection getTargetDatabaseConns(String serverId) {
    	MySqlDatabaseOption msOption = targetDatabaseConns.get(serverId);
    	Connection conn = null;
		try {
			conn = msOption.getConnection();
			if(conn == null || conn.isClosed()) {
				msOption.setConnection(msOption.getDbForm());
				conn = msOption.getConnection();
			}
		} catch (Exception e) {
			loger.error(e);
			msOption.closeConnection();
			loger.error(e +";" + msOption.getDbForm().getDatabaseAddress());
		}
		
    	return conn;
    }
    
    public FtpClientUtil getFtpNormal() {
		return ftpNormal;
	}

	public void setFtpNormal(FtpClientUtil ftpNormal) {
		this.ftpNormal = ftpNormal;
	}

	public FtpClientUtil getFtpFormula() {
		return ftpFormula;
	}

	public void setFtpFormula(FtpClientUtil ftpFormula) {
		this.ftpFormula = ftpFormula;
	}

	public Connection getSourceMysql() {
		Connection conn = null;
		try {
			conn = msSourceOption.getConnection();
			if(conn == null || conn.isClosed()) {
				msSourceOption.setConnection(msSourceOption.getDbForm());
				conn = msSourceOption.getConnection();
			}
		} catch (Exception e) {
			loger.error(e);
			msSourceOption.closeConnection();
		}
		
		return conn;
	}

	public Connection getSourceSqlServer2000() {
		Connection conn = null;
		try {
			conn = sql2000Option.getConnection();
			if(conn == null || conn.isClosed()) {
				sql2000Option.setConnection();
				conn = sql2000Option.getConnection();
			}
		} catch (Exception e) {
			loger.error(e);
			sql2000Option.closeConnection();
		}
		
		return conn;
	}

	public ConnsPool() {
		tXml.init();
    	tServerForms = tXml.getTargetServers();
		try {
			init();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void init() throws Exception {
		SourceServerForXML sXml = SourceServerForXML.getInstance();
    	sXml.setSourceForms();
    	//初始化源Mysql数据连接
    	msSourceOption = new MySqlDatabaseOption();
    	msSourceOption.setDbForm(sXml.getMySqlForm());
    	
    	//初始化源sql server 2000数据连接
    	sql2000Option = new SqlServer2000Option(); 
    	sql2000Option.setDbForm(sXml.getSqlServerForm());
    	
    	ftpNormal = new FtpClientUtil();
    	ftpNormal.setFtpForm(sXml.getSourceFtpServerNormal());
    	ftpNormal.connect();
    	
    	ftpFormula = new FtpClientUtil();
    	ftpFormula.setFtpForm(sXml.getSourceFtpServerFormula());
    	ftpFormula.connect();
	
    	MySqlDatabaseOption moption;
    	FtpClientUtil tempFtp;
    	
    	for(TargetServerForm tForm : tServerForms) {
    		moption = new MySqlDatabaseOption();
    		tempFtp = new FtpClientUtil();
    		try{
	    		moption.setDbForm(tForm.getDatabaseForm());
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    		
    		try{
	    		tempFtp.setFtpForm(tForm.getFtpForm());
	            tempFtp.connect();
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    		
    		targetDatabaseConns.put(tForm.getServerId(), moption);
    		targetFtpConns.put(tForm.getServerId(), tempFtp);
    	}
    }
    
    public void closeAllConns(){
    	try{sql2000Option.getConnection().close();}catch(Exception e){}
    	try{msSourceOption.getConnection().close();}catch(Exception e){}
    	
    	try{ftpNormal.closeConnect();}catch(Exception e){}
    	try{ftpFormula.closeConnect();}catch(Exception e){}
    	
    	Collection<MySqlDatabaseOption> iter = targetDatabaseConns.values();
    	Iterator<MySqlDatabaseOption> cIter = iter.iterator();
    	
    	while(cIter.hasNext()) {
    		MySqlDatabaseOption msOption = cIter.next();
    		try{
    			msOption.getConnection().close();
    		}catch(Exception e) {
    			loger.error(e);
    		}
    	}
    	
    	Collection<FtpClientUtil> iterFtp = targetFtpConns.values();
    	Iterator<FtpClientUtil> cIterFtp = iterFtp.iterator();
    	
    	while(cIterFtp.hasNext()) {
    		FtpClientUtil conn = cIterFtp.next();
    		try{
    			conn.closeConnect();
    		}catch(Exception e) {}
    	}
    }
    
}
