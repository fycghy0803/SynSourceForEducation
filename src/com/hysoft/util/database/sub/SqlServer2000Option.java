package com.hysoft.util.database.sub;

import java.sql.Connection;
import java.sql.DriverManager;

import org.apache.log4j.Logger;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.util.database.DatabaseOption;
import com.hysoft.util.forms.DatabaseForm;

public class SqlServer2000Option implements DatabaseOption {
	private DatabaseForm dbForm;
    private Connection conn = null;
    private Logger loger = Logger.getRootLogger();
    private DatabaseSql databaseSql;
    private SourceDao dao;
    
	public Connection getConnection() throws Exception{
		if( conn == null || conn.isClosed() ) this.setConnection();
		return conn;
	}
	
	public void closeConnection() {
		try{
			if(this.conn != null) {
				this.conn.close();
				this.conn = null;
			}
		}catch(Exception e) {
			
		}
	}

	public void setConnection() throws Exception{
		String driver = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
		//URL指向要访问的数据库名
		String url = "jdbc:microsoft:sqlserver://" + dbForm.getDatabaseAddress() + ":" + dbForm.getPort() + ";DatabaseName=" + dbForm.getDatabaseName();
		loger.warn("Sql server 2000 :" + url);
		Class.forName(driver); //加载驱动程序
		//连续数据库
		conn = DriverManager.getConnection(url,dbForm.getLoginName(),dbForm.getPwd());
	}
	
	public DatabaseForm getDbForm() {
		return dbForm;
	}

	public void setDbForm(DatabaseForm dbForm) {
		this.dbForm = dbForm;
	}

	public DatabaseSql getCurrentSql() {
		
		return databaseSql;
	}

	public void setCurrentSql(DatabaseSql databaseSql) {
		this.databaseSql = databaseSql;
	}

	public void setSourceDao(SourceDao dao) {
      this.dao = dao;
	}

	public SourceDao getSourceDao() {
		return dao;
	}
}
