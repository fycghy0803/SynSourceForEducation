package com.hysoft.process.database.target.model;

import com.hysoft.process.database.DatabaseSql;

/**
 * {@link} 与对应原中教网的表fz_type对应
 * 两表“标签”字段值的对应关系为：
 * ATTR_SUBJECT_ID subjectid
 * ATTR_GRADE_ID nianji
 * ATTR_EDITION_ID banben
 * ATTR_PROVINCE_ID class
 * ATTR_PAPERKIND_ID diqv
 * ATTR_SOURCE_ID s
 * @author Administrator
 */
public class TResPaperAttr implements DatabaseSql {
    private String ATTR_ID;
    private String PARENT_ID;
    private String ATTR_LEVEL;
    private String ATTR_NAME; 
    private String ATTR_TYPE_TAB; 
    private String GRADE_LEVEL;
    
    public String getATTR_ID() {
		return ATTR_ID;
	}

	public void setATTR_ID(String attr_id) {
		ATTR_ID = attr_id;
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

	public String getATTR_TYPE_TAB() {
		return ATTR_TYPE_TAB;
	}

	public void setATTR_TYPE_TAB(String attr_type_tab) {
		ATTR_TYPE_TAB = attr_type_tab;
	}

	public String getGRADE_LEVEL() {
		return GRADE_LEVEL;
	}

	public void setGRADE_LEVEL(String grade_level) {
		GRADE_LEVEL = grade_level;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = "insert into T_RES_PAPER_ATTR(ATTR_ID," +
										"PARENT_ID," +
										"ATTR_LEVEL," +
										"ATTR_NAME," +
										"ATTR_TYPE_TAB," +
										"GRADE_LEVEL) values(?,?,?,?,?,?)";
		return sql;
	}

	public String deleteSql() {
		String sql = "delete from T_RES_PAPER_ATTR where ATTR_ID = ?";
		return sql;
	}

	public String updateSql() {
		return null;
	}

	public String isExistByDatabaseFormSql() {
		String sql = "select 1 from T_RES_PAPER_ATTR " +
				"             where ATTR_ID = ? " +
				"               and PARENT_ID =? " +
				"               and ATTR_LEVEL = ?" +
				"               and ATTR_NAME = ?" +
				"               and ATTR_TYPE_TAB = ? " +
				"               and GRADE_LEVEL = ?";
		return sql;
	}

	public String isExistByKeyIdSql() {
		String sql = "select 1 from T_RES_PAPER_ATTR where ATTR_ID = ?";
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
