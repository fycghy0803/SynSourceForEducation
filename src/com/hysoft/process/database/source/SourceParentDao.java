package com.hysoft.process.database.source;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import org.apache.log4j.Logger;
import com.hysoft.process.database.DatabaseSql;

public abstract class SourceParentDao implements SelectDao {
    protected DatabaseSql databaseSql;
    protected List cateTypes = new CopyOnWriteArrayList();
	protected Connection conn;
    protected Logger loger = Logger.getRootLogger();
    protected Connection connAn;
    protected int currentPage = 0;
    
    public SourceParentDao() {
    	try {
			this.setDatabaseSql();
		} catch (Exception e) {
		}
    }
    
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Connection getConnection() {
		return conn;
	}

	public void insertDataBySource() throws Exception {

	}

	public void setConnection(Connection conn) {
       this.conn = conn;
	}
    
	public abstract void setDatabaseSql() throws Exception;
	public abstract DatabaseSql getRsData(ResultSet rs) throws Exception;
	
	public int getCount() {
		int count = 0;
		String sql = this.databaseSql.getCount();
		ResultSet rt = null;
		try {
			Statement st = conn.createStatement();
			rt = st.executeQuery(sql);
			if(rt.next()) {
				count = rt.getInt(1);	
			}
			
		} catch (SQLException e) {
			loger.error(e);
		}finally {
			if(null != rt) try{rt.close();}catch(Exception e){}
		}
		
		return count;
	}
	
	public void setDataByRS(ResultSet rs) throws Exception {
		cateTypes.clear();
		while(rs.next()) {
			cateTypes.add(getRsData(rs));
		}
	}
	
	public void setDataByRS(DatabaseSql rs) throws Exception {
		
	}
	
	protected void getRs() throws Exception {
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		if(null == databaseSql ) {
			setDatabaseSql();
		}
		
		try{
		    ps = conn.prepareStatement(databaseSql.getSql());
		    ps.setInt(1, currentPage * DatabaseSql.PAGE_COUNT);
		    rs = ps.executeQuery();
		    setDataByRS(rs);
		} catch(Exception e) {
			loger.error(e);
			throw e;
		}finally {
			if(null != ps) {
				rs.close();
				ps.close();
				rs = null;
				ps = null;
				conn.close();
			}
		}
	} 
	
	public List getSourceData() {
	
    	try {
			getRs();
		} catch (Exception e) {
			loger.error(e);
		} 	
		return cateTypes;
	}
	
	public void setSourceData(List dataList) {
	}
	
	public void clearList() {
		cateTypes.clear();
	}

	public Connection getConnAn() {
		return connAn;
	}

	public void setConnAn(Connection connAn) {
		this.connAn = connAn;
	}
	
	public int getSynFailCount(){
	   return 0;
	}
	
	public int getSynSuccCount() {
		return 0;
	}
}
