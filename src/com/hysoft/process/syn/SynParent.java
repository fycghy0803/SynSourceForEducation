package com.hysoft.process.syn;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.quartz.CronTrigger;
import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.util.conn.ConnsPool;
import com.hysoft.util.forms.DatabaseForm;
import com.hysoft.util.forms.TargetServerForm;
import com.hysoft.util.xml.SourceServerForXML;
import com.hysoft.util.xml.TargetServerForXml;

public abstract class SynParent {
    private Logger loger = Logger.getRootLogger();
	public SourceServerForXML ssForXml = SourceServerForXML.getInstance();
    public TargetServerForXml tsForXml = TargetServerForXml.getInstance();
    protected int[] retMsgMySql = new int[2];
    protected int[] retMsgSqlServer = new int[2];
    protected Connection conn;
    protected Connection connAn;
    protected ConnsPool connsPool;
    protected  int currentPage;
    protected SelectDao sDao;
    public static Date startDate;
    
    public void init() {
    	try {
			sDao = this.getSourceDao();
		} catch (Exception e) {
			e.printStackTrace();
		}    	
    }
    
    public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public ConnsPool getConnsPool() {
		return connsPool;
	}

	public void setConnsPool(ConnsPool connsPool) {
		this.connsPool = connsPool;
	}

	public Connection getConnSqlServer2000() throws Exception {
		conn = connsPool.getSourceSqlServer2000();
		return conn;
    }
    
    public Connection getConnMySql() throws Exception {
    	conn = connsPool.getSourceMysql();
		return conn;
    }
    
    protected List<DatabaseForm> getTargetDatabases(){
    	tsForXml.init();
    	List<TargetServerForm> targets = tsForXml.getTargetServers();
    	List<DatabaseForm> dforms = new ArrayList<DatabaseForm>(targets.size());
		
		for(TargetServerForm tsForm : targets) {
			//判断是否已到当前目标的同步时间
			boolean lb = isTimeCome(tsForm.getSynInterval(),tsForm.getServerId());
			if(lb) {
				DatabaseForm db = tsForm.getDatabaseForm();
				db.setServerId(tsForm.getServerId());
				dforms.add(db);
			}
		}
		
		return dforms;
    }
    
    
    public boolean isTimeCome(String expr,String name){
    	boolean ret = false;
    	
    	try{
	    	CronTrigger ct = new CronTrigger(name, "g", name, "g", startDate , null, expr);
	    	Calendar tt = Calendar.getInstance();
	    	tt.set(Calendar.MINUTE,00);
	    	tt.set(Calendar.SECOND,00);
	    	ret = ct.willFireOn(tt);
    	}catch(Exception e){
    		loger.error(e);
    		e.printStackTrace();
    	}
    	
    	return ret;
    }
    
	public SynParent() throws Exception {
		ssForXml.setSourceForms();
	}
	
	public int[] getRetMsgMySql() {
		return retMsgMySql;
	}
	
	public void setRetMsgMySql(int[] retMsgMySql) {
		this.retMsgMySql = retMsgMySql;
	}
	public int[] getRetMsgSqlServer() {
		return retMsgSqlServer;
	}
	public void setRetMsgSqlServer(int[] retMsgSqlServer) {
		this.retMsgSqlServer = retMsgSqlServer;
	}
    
	public int getPageCount() {
		int pageCount = 0;
		//get Data from source server
		try {
			int count = sDao.getCount();
			loger.info("current process total Count :" + count);
			
			if(sDao.isSplitPage()) {
				pageCount = (int) Math.round(Math.ceil(count / (float)DatabaseSql.PAGE_COUNT));
			}else {
	            pageCount = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return pageCount;
	}
	
	public void synRun(int type) throws Exception {
		loger.info(" current process page:" + (currentPage+1));
		sDao.setCurrentPage(this.currentPage);
		
		//insert data to target Server
		List<DatabaseForm> dbForms = this.getTargetDatabases();
		SourceDao ttDao = getTargetDao();
		
		List sourceData = sDao.getSourceData(); //得到源数据列表
		if(null == sourceData || (sourceData.size() == 0) ) {
			this.init();
			sourceData = sDao.getSourceData(); //再次获取一次源数据列表
		}
		
		ttDao.setSourceData(sourceData);
		
		for(DatabaseForm df : dbForms) { //得到目标数据库列表
			if( !allowSynFlag(df)) { //是否允许给当前目标库同步该类数据
		    	continue;
		    }
		    
			boolean opt = insertData(df,ttDao);
			if(!opt) {
			   insertData(df,ttDao);
			}
		}
	}
	
	private boolean insertData(DatabaseForm df,SourceDao ttDao) {
		boolean insRet = false;
		Connection connTemp = null;
		
		try {
			String serverId = df.getServerId();
			connTemp = connsPool.getTargetDatabaseConns(serverId);
			ttDao.setConnection(connTemp);
			ttDao.insertDataBySource();
			insRet = true;
		}catch (Exception e) {
			loger.error(e);
			e.printStackTrace();
		}finally {
			try{
				if(null != connTemp && (!connTemp.isClosed()) ){
					if(insRet) {
						connTemp.commit();
					}else {
						connTemp.rollback();
						connTemp.close();
						connTemp = null;
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
				loger.error(e);
			}
		}
		
		return insRet;
	}
	
	public abstract SelectDao getSourceDao() throws Exception;
	public abstract SourceDao getTargetDao() throws Exception;
	
	protected boolean allowSynFlag(DatabaseForm df){
		return true;
	}
	
	public Connection getConnAn() {
		return connAn;
	}

	public void setConnAn(Connection connAn) {
		this.connAn = connAn;
	}

	public SelectDao getSDao() {
		return sDao;
	}

	public void setSDao(SelectDao dao) {
		sDao = dao;
	}
}
