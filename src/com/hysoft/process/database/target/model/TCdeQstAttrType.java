package com.hysoft.process.database.target.model;

import com.hysoft.process.database.DatabaseSql;

/**
 * {@link} 方正的表CATEGORY_TYPE
 * @author Administrator
 */
public class TCdeQstAttrType implements DatabaseSql,TargetOptionSql {
    private String ATTR_TYPE_ID;
    private String ATTR_TYPE_NAME;
    private String ORDER_NUM;
    
	public String getATTR_TYPE_ID() {
		return ATTR_TYPE_ID;
	}

	public void setATTR_TYPE_ID(String attr_type_id) {
		ATTR_TYPE_ID = attr_type_id;
	}

	public String getATTR_TYPE_NAME() {
		return ATTR_TYPE_NAME;
	}

	public void setATTR_TYPE_NAME(String attr_type_name) {
		ATTR_TYPE_NAME = attr_type_name;
	}

	public String getORDER_NUM() {
		return ORDER_NUM;
	}

	public void setORDER_NUM(String order_num) {
		ORDER_NUM = order_num;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = "insert into T_CDE_RES_ORIGINAL_ATTR_TYPE(ATTR_TYPE_ID ,ATTR_TYPE_NAME, ORDER_NUM) values (?,?,?)";
		return sql;
	}

	public String deleteSql() {
		String sql = "delete from T_CDE_RES_ORIGINAL_ATTR_TYPE where ATTR_TYPE_ID = ?";
		return sql;
	}

	public String updateSql() {
		String sql = "update T_CDE_RES_ORIGINAL_ATTR_TYPE  set ATTR_TYPE_NAME = ?,ORDER_NUM = ? where ATTR_TYPE_ID = ?";
		return sql;
	}

	public String isExistByDatabaseFormSql() {
		String sql = "select 1 from T_CDE_RES_ORIGINAL_ATTR_TYPE where ATTR_TYPE_ID = ? and ATTR_TYPE_NAME = ? and ORDER_NUM = ?";
		return sql;
	}

	public String isExistByKeyIdSql() {
		String sql = "select 1 from T_CDE_RES_ORIGINAL_ATTR_TYPE t where t.ATTR_TYPE_ID = ?";
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
