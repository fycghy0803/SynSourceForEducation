package com.hysoft.process.database.source.sqlserver2000.dao;

import java.sql.ResultSet;
import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.CategoryOther;

public class CategoryOtherDao extends Sqlserver2000Dao {

	@Override
	public void setDatabaseSql() throws Exception {
	    this.databaseSql = new CategoryOther();	
	}

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		CategoryOther cOtherForm = new CategoryOther();
		cOtherForm.setCHILD_COUNT(rs.getString("CHILD_COUNT"));
		cOtherForm.setENTRY_CASCADE_ID(rs.getString("ENTRY_CASCADE_ID"));
		cOtherForm.setENTRY_CASCADE_NAME(rs.getString("ENTRY_CASCADE_NAME"));
		cOtherForm.setENTRY_CODE(rs.getString("ENTRY_CODE"));
		cOtherForm.setENTRY_DELETE_FLAG(rs.getString("ENTRY_DELETE_FLAG"));
		cOtherForm.setENTRY_DISP_ORDER(rs.getString("ENTRY_DISP_ORDER"));
		cOtherForm.setENTRY_ID(rs.getString("ENTRY_ID"));
		cOtherForm.setENTRY_LEVEL(rs.getString("ENTRY_LEVEL"));
		cOtherForm.setENTRY_LINKID(rs.getString("ENTRY_LINKID"));
		cOtherForm.setENTRY_LINKTABLE(rs.getString("ENTRY_LINKTABLE"));
		cOtherForm.setENTRY_LINKTYPE(rs.getString("ENTRY_LINKTYPE"));
		cOtherForm.setENTRY_MEMO(rs.getString("ENTRY_MEMO"));
		cOtherForm.setENTRY_NAME(rs.getString("ENTRY_NAME"));
		cOtherForm.setENTRY_PUB_LEVEL(rs.getString("ENTRY_PUB_LEVEL"));
		cOtherForm.setENTRY_PUBLISH(rs.getString("ENTRY_PUBLISH"));
		cOtherForm.setENTRY_SAME(rs.getString("ENTRY_SAME"));
		cOtherForm.setIS_REFRENCE(rs.getString("IS_REFRENCE"));
		cOtherForm.setLAST_MODI_DATE(rs.getString("LAST_MODI_DATE"));
		cOtherForm.setLAST_MODI_MAN(rs.getString("LAST_MODI_MAN"));
		cOtherForm.setPARENT_ID(rs.getString("PARENT_ID"));
		cOtherForm.setREFRENCE_ID(rs.getString("REFRENCE_ID"));
		cOtherForm.setREFRENCE_TABLE(rs.getString("REFRENCE_TABLE"));
		cOtherForm.setREFRENCE_TYPE(rs.getString("REFRENCE_TYPE"));
		cOtherForm.setWT_TYPE(rs.getString("WT_TYPE"));
		return cOtherForm;
	}

	public boolean isSplitPage() {
		return false;
	}
}
