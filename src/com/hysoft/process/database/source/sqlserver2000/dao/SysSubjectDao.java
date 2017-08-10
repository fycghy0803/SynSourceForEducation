package com.hysoft.process.database.source.sqlserver2000.dao;

import java.sql.ResultSet;
import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.SysSubjectModel;

public class SysSubjectDao extends Sqlserver2000Dao{
	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new SysSubjectModel();
	}

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		SysSubjectModel cateTypeTmp = new SysSubjectModel();
		cateTypeTmp.setID(rs.getString("ID"));
		cateTypeTmp.setNAME(rs.getString("NAME"));
		cateTypeTmp.setWORD(rs.getString("WORD"));
		cateTypeTmp.setSUB_CREATED(rs.getString("SUB_CREATED"));
		cateTypeTmp.setSUB_LASTMODIFIED(rs.getString("SUB_LASTMODIFIED"));
		cateTypeTmp.setSUB_TEXT(rs.getString("SUB_TEXT"));
		return cateTypeTmp;
	}

	public boolean isSplitPage() {
		return false;
	}
}
