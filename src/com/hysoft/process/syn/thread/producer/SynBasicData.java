package com.hysoft.process.syn.thread.producer;

import java.sql.Connection;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.syn.SynParent;
import com.hysoft.process.syn.business.SynCategoryOtherData;
import com.hysoft.process.syn.business.SynCategoryTypeData;
import com.hysoft.process.syn.business.SynFzTypeData;
import com.hysoft.process.syn.business.SynTCdeSubjectData;
import com.hysoft.util.conn.ConnsPool;
import com.hysoft.util.database.DatabaseOption;
import com.hysoft.util.database.sub.MySqlDatabaseOption;
import com.hysoft.util.database.sub.SqlServer2000Option;
import com.hysoft.util.xml.SourceServerForXML;

public class SynBasicData extends DataProducerParent{
	private String type = "";
	private SourceServerForXML ssForXml = SourceServerForXML.getInstance();
	private Connection connMySql;
    private Connection connSql2000;
    
    public SynBasicData(String type) {
    	this.type = type;
    	try {
			ssForXml.setSourceForms();
		} catch (Exception e) {
			loger.error(e);
		}
    }
	
	@Override
	public void startThread() {
		
	}

	@Override
	public void run() {
		while(true) {
			
			try{
				runSyn();
			}catch(Exception e) {
				loger.error(e);
			}finally {
				if(null != connSql2000) try{connSql2000.close();}catch(Exception e){}
				if(null != connMySql) try{connMySql.close();}catch(Exception e){}
			}
			
			try {
				Thread.sleep(THREAD_SLEEP_TIME);
			} catch (InterruptedException e) {
			    loger.error(e);
			}
		}
	}
	
	public void runSyn() throws Exception {
		connSql2000 = getConnSqlServer2000();
		connMySql = getConnMySql();
		
		SynParent synData = null;
		//同步category type
		if(null == type || "1".equals(type)) {
		   loger.info("syn start SynCategoryTypeData.....");
		   synData = new SynCategoryTypeData(connSql2000);
		   synData.setConnsPool(new ConnsPool());
		   synData.init();
		   synData.synRun(DatabaseSql.TYPE_OPT_2000);
		   loger.info("syn end SynCategoryTypeData.....");
		}
		
		//同步category_other 
		if(null == type || "2".equals(type)) {
			loger.info("syn start SynCategoryOtherData.....");
			synData = new SynCategoryOtherData(connSql2000);
			synData.setConnsPool(new ConnsPool());
			synData.init();
			synData.synRun(DatabaseSql.TYPE_OPT_2000);
			loger.info("syn end SynCategoryOtherData.....");
		}
		
		//同步 sys_subject
		if(null == type || "2".equals(type)) {
			loger.info("syn start SynTCdeSubjectData.....");
			synData = new SynTCdeSubjectData(connSql2000);
			synData.setConnsPool(new ConnsPool());
			synData.init();
			synData.synRun(DatabaseSql.TYPE_OPT_2000);
			loger.info("syn end SynTCdeSubjectData.....");
		}
		
		//同步my sql fz_type
		if(null == type || "3".equals(type)) {
			loger.info("syn start SynFzTypeData.....");
			synData = new SynFzTypeData(connMySql);
			synData.setConnsPool(new ConnsPool());
			synData.init();
			synData.synRun(DatabaseSql.TYPE_OPT_MYSQL);
			loger.info("syn end SynFzTypeData.....");
		}
		
	}
	
	public Connection getConnSqlServer2000() throws Exception {
    	DatabaseOption mydata = new SqlServer2000Option();
		mydata.setDbForm(ssForXml.getSqlServerForm());
		connSql2000 = mydata.getConnection();
		return connSql2000;
    }
    
    public Connection getConnMySql() throws Exception {
    	DatabaseOption mydata = new MySqlDatabaseOption();
		mydata.setDbForm(ssForXml.getMySqlForm());
		connMySql = mydata.getConnection();
		return connMySql;
    }
}
