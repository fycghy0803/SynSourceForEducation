package com.hysoft.process.database.source.sqlserver2000.model;

import com.hysoft.process.database.DatabaseSql;

public class CategoryType implements DatabaseSql {
    private String WT_TYPE;
    private String WT_NAME;
    private String WT_ORDER;
    private String WT_TABLE;
    private String WT_PROP;
    private String WT_PROP_SUB;
    
	public String getWT_TYPE() {
		return WT_TYPE;
	}

	public void setWT_TYPE(String wt_type) {
		WT_TYPE = wt_type;
	}

	public String getWT_NAME() {
		return WT_NAME;
	}

	public void setWT_NAME(String wt_name) {
		WT_NAME = wt_name;
	}

	public String getWT_ORDER() {
		return WT_ORDER;
	}

	public void setWT_ORDER(String wt_order) {
		WT_ORDER = wt_order;
	}

	public String getWT_TABLE() {
		return WT_TABLE;
	}

	public void setWT_TABLE(String wt_table) {
		WT_TABLE = wt_table;
	}

	public String getWT_PROP() {
		return WT_PROP;
	}

	public void setWT_PROP(String wt_prop) {
		WT_PROP = wt_prop;
	}

	public String getWT_PROP_SUB() {
		return WT_PROP_SUB;
	}

	public void setWT_PROP_SUB(String wt_prop_sub) {
		WT_PROP_SUB = wt_prop_sub;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		return "select WT_TYPE, WT_NAME, WT_ORDER, WT_TABLE, WT_PROP, WT_PROP_SUB from CATEGORY_TYPE";
	}

	public String deleteSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String isExistByDatabaseFormSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String isExistByKeyIdSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String updateSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getCount() {
		String sql = "select count(1) from CATEGORY_TYPE";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		// TODO Auto-generated method stub
		
	}
}
