package com.hysoft.process.database.target.model;

import com.hysoft.process.database.DatabaseSql;

/**
 * {@link} 方正的表sys_subject
 * @author Administrator
 */
public class TCdeSubject implements DatabaseSql,TargetOptionSql {
    private String SUBJECT_ID;
    private String SUBJECT_NAME;
    
	public String getSUBJECT_ID() {
		return SUBJECT_ID;
	}

	public void setSUBJECT_ID(String subject_id) {
		SUBJECT_ID = subject_id;
	}

	public String getSUBJECT_NAME() {
		return SUBJECT_NAME;
	}

	public void setSUBJECT_NAME(String subject_name) {
		SUBJECT_NAME = subject_name;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = "insert into T_CDE_SUBJECT(SUBJECT_ID ,SUBJECT_NAME) values (?,?)";
		return sql;
	}

	public String deleteSql() {
		String sql = "delete from T_CDE_SUBJECT where SUBJECT_ID = ?";
		return sql;
	}

	public String updateSql() {
		String sql = "update T_CDE_SUBJECT  set SUBJECT_NAME = ? where SUBJECT_ID = ?";
		return sql;
	}

	public String isExistByDatabaseFormSql() {
		String sql = "select 1 from T_CDE_SUBJECT where SUBJECT_ID = ? and SUBJECT_NAME = ?";
		return sql;
	}

	public String isExistByKeyIdSql() {
		String sql = "select 1 from T_CDE_SUBJECT t where t.SUBJECT_ID = ?";
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
