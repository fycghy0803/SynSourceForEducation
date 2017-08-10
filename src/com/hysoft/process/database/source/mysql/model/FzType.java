package com.hysoft.process.database.source.mysql.model;

import com.hysoft.process.database.DatabaseSql;

public class FzType implements DatabaseSql {
    private String id;
    private String upid;
    private String type;
    private String name;
    private String tab;
    private String stat;
    
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUpid() {
		return upid;
	}

	public void setUpid(String upid) {
		this.upid = upid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTab() {
		return tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = " select ft.id," +
				"             ft.upid," +
				"             ft.type," +
				"             ft.name," +
				"             ft.tab," +
				"             ft.stat " +
				"        from fz_type ft limit ?," + DatabaseSql.PAGE_COUNT;
		return sql;
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
        String sql = "select count(1) from fz_type";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		// TODO Auto-generated method stub
		
	}

}
