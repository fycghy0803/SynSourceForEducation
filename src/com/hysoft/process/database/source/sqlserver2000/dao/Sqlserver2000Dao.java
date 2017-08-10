package com.hysoft.process.database.source.sqlserver2000.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.SourceParentDao;

public abstract class Sqlserver2000Dao extends SourceParentDao {
	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		return null;
	}

	@Override
	public void setDatabaseSql() throws Exception {
		
	}
	
	public void getRs() throws Exception {
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		if(null == databaseSql ) {
			setDatabaseSql();
		}else {
			databaseSql.setCurrentPage(this.getCurrentPage());
		}
		
		try{
		    ps = conn.prepareStatement(databaseSql.getSql());
		    rs = ps.executeQuery();
		    setDataByRS(rs);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			if(null != ps) {
				rs.close();
				ps.close();
				rs = null;
				ps = null;
			}
		}
	}
}