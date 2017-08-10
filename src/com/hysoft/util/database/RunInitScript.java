package com.hysoft.util.database;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;

import com.hysoft.util.database.sub.MySqlDatabaseOption;
import com.hysoft.util.forms.DatabaseForm;
import com.hysoft.util.forms.TargetServerForm;
import com.hysoft.util.xml.ServerForXML;
import com.hysoft.util.xml.TargetServerForXml;
import com.ibatis.common.jdbc.ScriptRunner;

public class RunInitScript {
	private String initFile = "Config/zhtk.sql";
	private Logger loger = Logger.getRootLogger();
	private final String charSet = "UTF-8";
	
    private void runScript(DatabaseForm db) throws Exception {
    	//判断当前数据库是否存在
    	boolean existDb = validDatabaseExist(db);
    	if(!existDb) {
    		this.createNewDatabse(db);
    	}
    	
    	//判断当前数据是否存在表结构
    	boolean existTables = this.validTablesExist(db);
    	if( !existTables) {
    	    this.createTables(db);	
    	}
    	
    	loger.info(" init already done.");
    }
    
    private Connection getTargetConn(DatabaseForm db) throws Exception {
    	MySqlDatabaseOption opt = new MySqlDatabaseOption();
		opt.setDbForm(db);
		Connection conn = null;
		opt.setConnection(db);
		conn = opt.getConnection();
		conn.setAutoCommit(false);
		return conn;
    }
    
    private void processInit(DatabaseForm db) {
    	
		try {
			runScript(db);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
    }
    
    public void closeConn(Connection conn) {
    	if (null != conn) try{ conn.close();}catch(Exception e) {}
    }
    
    public void initTargets() {
    	TargetServerForXml tXml = TargetServerForXml.getInstance();
    	List<TargetServerForm> tsForms = tXml.getTargetServers();
    	loger.info("target server count :" + tsForms.size());
    	for(TargetServerForm form : tsForms ) {
    		DatabaseForm dbForm = form.getDatabaseForm();
    		processInit(dbForm);
    	}
    }
    
    private void createTables(DatabaseForm db) throws Exception{
    	Connection conn = null;
		InputStreamReader fr = null;
		
		try {
    		conn = getTargetConn(db);
	    	ServerForXML sfXml = new ServerForXML();
	    	String fileName = sfXml.getConfigPath() + initFile;
	    	ScriptRunner sRun = new ScriptRunner(conn,false,false);
	    	fr = new InputStreamReader(new FileInputStream(fileName),charSet);
	    	sRun.runScript(fr);
		} catch(Exception e) { 
		    e.printStackTrace();	
		} finally {
			if(null != fr) fr.close();
			closeConn(conn);
		}
    }
    
    public void createNewDatabse(DatabaseForm db) {
      	MySqlDatabaseOption opt = new MySqlDatabaseOption();
    	String dbName = db.getDatabaseName();
    	db.setDatabaseName("information_schema");
    	opt.setDbForm(db);
    	Connection conn = null;
    	
    	try {
    		opt.setConnection(db);
			conn = opt.getConnection();
			Statement  ps = conn.createStatement();
			ps.execute("create database " + dbName + " CHARACTER SET '" + db.getDatabaseCharSet() + "'");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.setDatabaseName(dbName);
			closeConn(conn);
		}
    }
    
    public boolean validDatabaseExist(DatabaseForm db) {
    	boolean lb = false;
    	MySqlDatabaseOption opt = new MySqlDatabaseOption();
    	String dbName = db.getDatabaseName();
    	db.setDatabaseName("information_schema");
    	opt.setDbForm(db);

    	Connection conn = null;
    	
    	try {
        	opt.setConnection(db);
			conn = opt.getConnection();
			PreparedStatement  ps = conn.prepareStatement("select 1 from schemata sn where sn.schema_name = ?");
			ps.setString(1, dbName);
		    ResultSet rs = ps.executeQuery();
		    lb =  rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.setDatabaseName(dbName);
			closeConn(conn);
		}
    	
    	return lb;
    }
    
    private boolean validTablesExist(DatabaseForm db) {
    	boolean lb = false;
    	MySqlDatabaseOption opt = new MySqlDatabaseOption();
    	String dbName = db.getDatabaseName();
    	db.setDatabaseName("information_schema");
    	opt.setDbForm(db);
    	Connection conn = null;
    	
    	try {
    		opt.setConnection(db);
			conn = opt.getConnection();
			PreparedStatement  ps = conn.prepareStatement("select 1 from tables sn where sn.table_name = 't_cde_grade' and sn.table_schema = ?");
			ps.setString(1, dbName);
		    ResultSet rs = ps.executeQuery();
		    lb =  rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.setDatabaseName(dbName);
			closeConn(conn);
		}
    	
    	return lb;
    }
    
    public void backAndRestoreDatabase(DatabaseForm toForm,DatabaseForm fromForm) throws Exception {
    	if( ! this.validDatabaseExist(toForm) ) {
    		this.createNewDatabse(toForm);
    	}
    	
    	String cmd = toForm.getMysqlBinPath()+ "\\mysqldump -h" + fromForm.getDatabaseAddress() + " -P" + fromForm.getPort();
    	cmd += " -u" + fromForm.getLoginName() + " -p" + fromForm.getPwd() +  " " + fromForm.getDatabaseName();
    	
    	loger.error("cmd dump = " + cmd);
    	Runtime runTime = Runtime.getRuntime();
    	Process proc = runTime.exec(cmd);
    	InputStream is = proc.getInputStream();
    	InputStreamReader br = new InputStreamReader(is,charSet);
    	String tempFile = fromForm.getDatabaseName() + ".sql";
    	FileOutputStream fos = new FileOutputStream(tempFile);
    	OutputStreamWriter pw = new OutputStreamWriter(fos,charSet);
    	char[] retStr = new char[1024 * 2];
    	int readInt = 0;
    	while(( readInt = br.read(retStr) ) != -1) {
    		pw.write(retStr,0,readInt);
    		pw.flush();
    	}
    	
    	br.close();
    	pw.close();
    	proc.destroy();
    	
    	cmd =  toForm.getMysqlBinPath() + "\\mysql -h" + toForm.getDatabaseAddress() + " -P" + toForm.getPort() + " -u" + toForm.getLoginName();
    	cmd += " -p" + toForm.getPwd() + " " + toForm.getDatabaseName();
    	proc = runTime.exec(cmd);
    	BufferedReader bReader = new BufferedReader(new InputStreamReader(new FileInputStream(tempFile),charSet));
    	String readStr;
    	pw = new OutputStreamWriter(proc.getOutputStream(),charSet);
    	while( ( readStr = bReader.readLine()) != null ) {
    		pw.write(readStr + "\r\n");
    		pw.flush();
    	}
    	
    	bReader.close();
    	pw.close();
    	proc.destroy();
    }
}
