package com.hysoft.process.database.target.model;

import com.hysoft.process.database.DatabaseSql;

public class TCdeGrade implements DatabaseSql{

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		return "select count(1) from t_cde_grade";
	}

	public String deleteSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String isExistSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String updateSql() {
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

	public String getCount() {
		String sql = "";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		// TODO Auto-generated method stub
		
	}

}
