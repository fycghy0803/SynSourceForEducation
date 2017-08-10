package com.hysoft.process.database.source.sqlserver2000.dao;

import java.sql.ResultSet;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.CategoryType;

public class CategoryTypeDao extends Sqlserver2000Dao{
	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new CategoryType();
	}

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		CategoryType cateTypeTmp = new CategoryType();
		cateTypeTmp.setWT_TYPE(rs.getString("WT_TYPE"));
		cateTypeTmp.setWT_NAME(rs.getString("WT_NAME"));
		cateTypeTmp.setWT_ORDER(rs.getString("WT_ORDER"));
		cateTypeTmp.setWT_TABLE(rs.getString("WT_TABLE"));
		cateTypeTmp.setWT_PROP(rs.getString("WT_PROP"));
		cateTypeTmp.setWT_PROP_SUB(rs.getString("WT_PROP_SUB"));
		return cateTypeTmp;
		
	}

	public boolean isSplitPage() {
		return false;
	}
}
