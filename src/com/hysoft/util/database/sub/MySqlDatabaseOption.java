package com.hysoft.util.database.sub;

import java.sql.Connection;
import java.sql.DriverManager;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.util.database.DatabaseOption;
import com.hysoft.util.forms.DatabaseForm;

public class MySqlDatabaseOption implements DatabaseOption {
	private DatabaseForm dbForm;
    private Connection conn = null;
    private DatabaseSql databaseSql;
    private SourceDao dao;
    
	public Connection getConnection() throws Exception{
		if(conn == null || conn.isClosed() ) {
			this.setConnection(dbForm);
		}
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
	
	public DatabaseForm getDbForm() {
		return dbForm;
	}

	public void setDbForm(DatabaseForm dbForm) {
		this.dbForm = dbForm;
	}

	public void setConnection(DatabaseForm dbForm) throws Exception{
		String driver = "com.mysql.jdbc.Driver";
		//URL指向要访问的数据库名
		String url = "jdbc:mysql://" + dbForm.getDatabaseAddress() + ":" + dbForm.getPort() + "/" + dbForm.getDatabaseName() + "?";
		url += "user=" + dbForm.getLoginName() + "&password=" + dbForm.getPwd() + "&autoReconnectForPools=true&autoReconnect=true&reconnectAtTxEnd=true&characterEncoding=" + dbForm.getDatabaseCharSet();
		System.out.println("my sql url:" + url);
		Class.forName(driver); //加载驱动程序
		// 连接数据库
		conn = DriverManager.getConnection(url);
		conn.setAutoCommit(false);
	}
	
	public DatabaseSql getCurrentSql() {
		return this.databaseSql;
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
