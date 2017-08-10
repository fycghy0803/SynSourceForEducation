package com.hysoft.process.database.source.sqlserver2000.dao;

import java.sql.ResultSet;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.CategoryRegion;

public class CategoryRegionDao extends Sqlserver2000Dao {

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		CategoryRegion cr = new CategoryRegion();
		cr.setCHILD_COUNT(rs.getString("CHILD_COUNT"));
		cr.setENTRY_CASCADE_ID(rs.getString("ENTRY_CASCADE_ID"));
		cr.setENTRY_CASCADE_NAME(rs.getString("ENTRY_CASCADE_NAME"));
		cr.setENTRY_CODE(rs.getString("ENTRY_CODE"));
		cr.setENTRY_DELETE_FLAG(rs.getString("ENTRY_DELETE_FLAG"));
		cr.setENTRY_DISP_ORDER(rs.getString("ENTRY_DISP_ORDER"));
		cr.setENTRY_ID(rs.getString("ENTRY_ID"));
		cr.setENTRY_LEVEL(rs.getString("ENTRY_LEVEL"));
		cr.setENTRY_LINKID(rs.getString("ENTRY_LINKID"));
		cr.setENTRY_LINKTABLE(rs.getString("ENTRY_LINKTABLE"));
		cr.setENTRY_LINKTYPE(rs.getString("ENTRY_LINKTYPE"));
		cr.setENTRY_MEMO(rs.getString("ENTRY_MEMO"));
		cr.setENTRY_NAME(rs.getString("ENTRY_NAME"));
		cr.setENTRY_PUB_LEVEL(rs.getString("ENTRY_PUB_LEVEL"));
		cr.setENTRY_PUBLISH(rs.getString("ENTRY_PUBLISH"));
		cr.setENTRY_SAME(rs.getString("ENTRY_SAME"));
		cr.setIS_REFRENCE(rs.getString("IS_REFRENCE"));
		cr.setLAST_MODI_DATE(rs.getString("LAST_MODI_DATE"));
		cr.setLAST_MODI_MAN(rs.getString("LAST_MODI_MAN"));
		cr.setPARENT_ID(rs.getString("PARENT_ID"));
		cr.setREFRENCE_ID(rs.getString("REFRENCE_ID"));
		cr.setREFRENCE_TABLE(rs.getString("REFRENCE_TABLE"));
		cr.setREFRENCE_TYPE(rs.getString("REFRENCE_TYPE"));
		cr.setWT_TYPE(rs.getString("WT_TYPE"));		
		return cr;
	}

	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new CategoryRegion();
	}

	public boolean isSplitPage() {
		return false;
	}
}
