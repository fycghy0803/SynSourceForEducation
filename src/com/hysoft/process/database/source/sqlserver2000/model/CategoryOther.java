package com.hysoft.process.database.source.sqlserver2000.model;

import com.hysoft.process.database.DatabaseSql;

public class CategoryOther implements DatabaseSql {
	private String CHILD_COUNT;
	private String ENTRY_CASCADE_ID;
	private String ENTRY_CASCADE_NAME;
	private String ENTRY_CODE;
	private String ENTRY_DELETE_FLAG;
	private String ENTRY_DISP_ORDER;
	private String ENTRY_ID;
	private String ENTRY_LEVEL;
	private String ENTRY_LINKID;
	private String ENTRY_LINKTABLE;
	private String ENTRY_LINKTYPE;
	private String ENTRY_MEMO;
	private String ENTRY_NAME;
	private String ENTRY_PUB_LEVEL;
	private String ENTRY_PUBLISH;
	private String ENTRY_SAME;
	private String IS_REFRENCE;
	private String LAST_MODI_DATE;
	private String LAST_MODI_MAN;
	private String PARENT_ID;
	private String REFRENCE_ID;
	private String REFRENCE_TABLE;
	private String REFRENCE_TYPE;
	private String WT_TYPE;
	private int currentPage; 
	
	public String getCHILD_COUNT() {
		return CHILD_COUNT;
	}

	public void setCHILD_COUNT(String child_count) {
		CHILD_COUNT = child_count;
	}

	public String getENTRY_CASCADE_ID() {
		return ENTRY_CASCADE_ID;
	}

	public void setENTRY_CASCADE_ID(String entry_cascade_id) {
		ENTRY_CASCADE_ID = entry_cascade_id;
	}

	public String getENTRY_CASCADE_NAME() {
		return ENTRY_CASCADE_NAME;
	}

	public void setENTRY_CASCADE_NAME(String entry_cascade_name) {
		ENTRY_CASCADE_NAME = entry_cascade_name;
	}

	public String getENTRY_CODE() {
		return ENTRY_CODE;
	}

	public void setENTRY_CODE(String entry_code) {
		ENTRY_CODE = entry_code;
	}

	public String getENTRY_DELETE_FLAG() {
		return ENTRY_DELETE_FLAG;
	}

	public void setENTRY_DELETE_FLAG(String entry_delete_flag) {
		ENTRY_DELETE_FLAG = entry_delete_flag;
	}

	public String getENTRY_DISP_ORDER() {
		return ENTRY_DISP_ORDER;
	}

	public void setENTRY_DISP_ORDER(String entry_disp_order) {
		ENTRY_DISP_ORDER = entry_disp_order;
	}

	public String getENTRY_ID() {
		return ENTRY_ID;
	}

	public void setENTRY_ID(String entry_id) {
		ENTRY_ID = entry_id;
	}

	public String getENTRY_LEVEL() {
		return ENTRY_LEVEL;
	}

	public void setENTRY_LEVEL(String entry_level) {
		ENTRY_LEVEL = entry_level;
	}

	public String getENTRY_LINKID() {
		return ENTRY_LINKID;
	}

	public void setENTRY_LINKID(String entry_linkid) {
		ENTRY_LINKID = entry_linkid;
	}

	public String getENTRY_LINKTABLE() {
		return ENTRY_LINKTABLE;
	}

	public void setENTRY_LINKTABLE(String entry_linktable) {
		ENTRY_LINKTABLE = entry_linktable;
	}

	public String getENTRY_LINKTYPE() {
		return ENTRY_LINKTYPE;
	}

	public void setENTRY_LINKTYPE(String entry_linktype) {
		ENTRY_LINKTYPE = entry_linktype;
	}

	public String getENTRY_MEMO() {
		return ENTRY_MEMO;
	}

	public void setENTRY_MEMO(String entry_memo) {
		ENTRY_MEMO = entry_memo;
	}

	public String getENTRY_NAME() {
		return ENTRY_NAME;
	}

	public void setENTRY_NAME(String entry_name) {
		ENTRY_NAME = entry_name;
	}

	public String getENTRY_PUB_LEVEL() {
		return ENTRY_PUB_LEVEL;
	}

	public void setENTRY_PUB_LEVEL(String entry_pub_level) {
		ENTRY_PUB_LEVEL = entry_pub_level;
	}

	public String getENTRY_PUBLISH() {
		return ENTRY_PUBLISH;
	}

	public void setENTRY_PUBLISH(String entry_publish) {
		ENTRY_PUBLISH = entry_publish;
	}

	public String getENTRY_SAME() {
		return ENTRY_SAME;
	}

	public void setENTRY_SAME(String entry_same) {
		ENTRY_SAME = entry_same;
	}

	public String getIS_REFRENCE() {
		return IS_REFRENCE;
	}

	public void setIS_REFRENCE(String is_refrence) {
		IS_REFRENCE = is_refrence;
	}

	public String getLAST_MODI_DATE() {
		return LAST_MODI_DATE;
	}

	public void setLAST_MODI_DATE(String last_modi_date) {
		LAST_MODI_DATE = last_modi_date;
	}

	public String getLAST_MODI_MAN() {
		return LAST_MODI_MAN;
	}

	public void setLAST_MODI_MAN(String last_modi_man) {
		LAST_MODI_MAN = last_modi_man;
	}

	public String getPARENT_ID() {
		return PARENT_ID;
	}

	public void setPARENT_ID(String parent_id) {
		PARENT_ID = parent_id;
	}

	public String getREFRENCE_ID() {
		return REFRENCE_ID;
	}

	public void setREFRENCE_ID(String refrence_id) {
		REFRENCE_ID = refrence_id;
	}

	public String getREFRENCE_TABLE() {
		return REFRENCE_TABLE;
	}

	public void setREFRENCE_TABLE(String refrence_table) {
		REFRENCE_TABLE = refrence_table;
	}

	public String getREFRENCE_TYPE() {
		return REFRENCE_TYPE;
	}

	public void setREFRENCE_TYPE(String refrence_type) {
		REFRENCE_TYPE = refrence_type;
	}

	public String getWT_TYPE() {
		return WT_TYPE;
	}

	public void setWT_TYPE(String wt_type) {
		WT_TYPE = wt_type;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = 
			"select CHILD_COUNT,\n" +
			"ENTRY_CASCADE_ID,\n" + 
			"ENTRY_CASCADE_NAME,\n" + 
			"ENTRY_CODE,\n" + 
			"ENTRY_DELETE_FLAG,\n" + 
			"ENTRY_DISP_ORDER,\n" + 
			"ENTRY_ID,\n" + 
			"ENTRY_LEVEL,\n" + 
			"ENTRY_LINKID,\n" + 
			"ENTRY_LINKTABLE,\n" + 
			"ENTRY_LINKTYPE,\n" + 
			"ENTRY_MEMO,\n" + 
			"ENTRY_NAME,\n" + 
			"ENTRY_PUB_LEVEL,\n" + 
			"ENTRY_PUBLISH,\n" + 
			"ENTRY_SAME,\n" + 
			"IS_REFRENCE,\n" + 
			"LAST_MODI_DATE,\n" + 
			"LAST_MODI_MAN,\n" + 
			"PARENT_ID,\n" + 
			"REFRENCE_ID,\n" + 
			"REFRENCE_TABLE,\n" + 
			"REFRENCE_TYPE,\n" + 
			"WT_TYPE from category_other co";
		return sql;
	}

	public String deleteSql() {
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
        String sql = "select count(1) from category_other";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		this.currentPage = pageNumber;
	}
}
