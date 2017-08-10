package com.hysoft.process.database.target.model;

import com.hysoft.process.database.DatabaseSql;

/**
 * {@link} 与表方正的表CATEGORY_OTHER对应
 */
public class TResOriginalAttr implements DatabaseSql {
	private String ATTR_ID;
	private String ATTR_TYPE_ID; 
	private String PARENT_ID; 
	private String ATTR_LEVEL; 
	private String ATTR_NAME;
	private String ATTR_CASCADE_ID; 
	private String ATTR_CASCADE_NAME; 
	private String ORDER_NUM;
	private String DEL_STATUS;
	
	public String getATTR_TYPE_ID() {
		return ATTR_TYPE_ID;
	}

	public void setATTR_TYPE_ID(String attr_type_id) {
		ATTR_TYPE_ID = attr_type_id;
	}

	public String getPARENT_ID() {
		return PARENT_ID;
	}

	public void setPARENT_ID(String parent_id) {
		PARENT_ID = parent_id;
	}

	public String getATTR_LEVEL() {
		return ATTR_LEVEL;
	}

	public void setATTR_LEVEL(String attr_level) {
		ATTR_LEVEL = attr_level;
	}

	public String getATTR_NAME() {
		return ATTR_NAME;
	}

	public void setATTR_NAME(String attr_name) {
		ATTR_NAME = attr_name;
	}

	public String getATTR_CASCADE_ID() {
		return ATTR_CASCADE_ID;
	}

	public void setATTR_CASCADE_ID(String attr_cascade_id) {
		ATTR_CASCADE_ID = attr_cascade_id;
	}

	public String getATTR_CASCADE_NAME() {
		return ATTR_CASCADE_NAME;
	}

	public void setATTR_CASCADE_NAME(String attr_cascade_name) {
		ATTR_CASCADE_NAME = attr_cascade_name;
	}

	public String getORDER_NUM() {
		return ORDER_NUM;
	}

	public void setORDER_NUM(String order_num) {
		ORDER_NUM = order_num;
	}

	public String getDEL_STATUS() {
		return DEL_STATUS;
	}

	public void setDEL_STATUS(String del_status) {
		DEL_STATUS = del_status;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = "insert into t_res_original_attr (ATTR_ID," +
				                 "ATTR_TYPE_ID ,\n" +
								"PARENT_ID ,\n" + 
								"ATTR_LEVEL ,\n" + 
								"ATTR_NAME ,\n" + 
								"ATTR_CASCADE_ID ,\n" + 
								"ATTR_CASCADE_NAME,\n" + 
								"ORDER_NUM ,\n" + 
								"DEL_STATUS," +
								"MODIFY_TIME) values(?,?,?,?,?,?,?,?,?,?)";
		return sql;
	}

	public String getATTR_ID() {
		return ATTR_ID;
	}

	public void setATTR_ID(String attr_id) {
		ATTR_ID = attr_id;
	}

	public String deleteSql() {
		String sql = "delete from t_res_original_attr where ATTR_ID = ?";
		return sql;
	}

	public String updateSql() {
		return null;
	}

	public String isExistByDatabaseFormSql() {
		String sql = "select 1 from t_res_original_attr t " +
				"             where t.ATTR_ID = ? " +
				"               and t.ATTR_TYPE_ID = ?" +
				"               and t.PARENT_ID = ? " +
				"               and t.ATTR_LEVEL = ?" +
				"               and t.ATTR_NAME = ? " +
				"               and t.ATTR_CASCADE_ID = ?" +
				"               and t.ATTR_CASCADE_NAME = ?" +
				"               and t.ORDER_NUM = ?" +
				"               and t.DEL_STATUS = ?";
		return sql;
	}

	public String isExistByKeyIdSql() {
		String sql = "select 1 from t_res_original_attr t where t.ATTR_ID = ?";
		return sql;
	}

	public String getCount() {
		String sql = "";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		// TODO Auto-generated method stub
		
	}
}
