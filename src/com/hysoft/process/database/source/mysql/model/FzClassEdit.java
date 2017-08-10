package com.hysoft.process.database.source.mysql.model;

import com.hysoft.process.database.DatabaseSql;

public class FzClassEdit implements DatabaseSql {
	private String  id;
	private String  name;
	private String  pid;
	private String  num;
	private String  high_score;
	private String  high_score_uid;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getHigh_score() {
		return high_score;
	}

	public void setHigh_score(String high_score) {
		this.high_score = high_score;
	}

	public String getHigh_score_uid() {
		return high_score_uid;
	}

	public void setHigh_score_uid(String high_score_uid) {
		this.high_score_uid = high_score_uid;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = 
			"select  id,\n" +
			"   name,\n" + 
			"   pid,\n" + 
			"   num,\n" + 
			"   high_score,\n" + 
			"   high_score_uid from fz_classedit limit ?," + DatabaseSql.PAGE_COUNT;
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
	    String sql = "select count(1) from FzClassEdit";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		// TODO Auto-generated method stub
		
	}
}
