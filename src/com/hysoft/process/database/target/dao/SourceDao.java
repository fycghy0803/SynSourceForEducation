package com.hysoft.process.database.target.dao;

import java.sql.Connection;
import java.util.List;

import com.hysoft.process.database.DatabaseSql;

public interface SourceDao {
	public void insertDataBySource() throws Exception;
	public void setDataByRS(DatabaseSql rs) throws Exception;
	public void setConnection(Connection conn);
	public Connection getConnection();
	public List getSourceData() throws Exception;
	public void setSourceData(List dataList);
	public int getSynSuccCount();
	public int getSynFailCount();
	public int getCount();
	public int getCurrentPage();
	public void setCurrentPage(int page);
}
