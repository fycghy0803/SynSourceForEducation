package com.hysoft.process.database.source.sqlserver2000.model;

import com.hysoft.process.database.DatabaseSql;

public class SysSubjectModel implements DatabaseSql {
    private String ID;
    private String NAME;
    private String WORD;
    private String SUB_CREATED;
    private String SUB_LASTMODIFIED;
    private String SUB_TEXT;
    
	public String getID() {
		return ID;
	}

	public void setID(String id) {
		ID = id;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String name) {
		NAME = name;
	}

	public String getWORD() {
		return WORD;
	}

	public void setWORD(String word) {
		WORD = word;
	}

	public String getSUB_CREATED() {
		return SUB_CREATED;
	}

	public void setSUB_CREATED(String sub_created) {
		SUB_CREATED = sub_created;
	}

	public String getSUB_LASTMODIFIED() {
		return SUB_LASTMODIFIED;
	}

	public void setSUB_LASTMODIFIED(String sub_lastmodified) {
		SUB_LASTMODIFIED = sub_lastmodified;
	}

	public String getSUB_TEXT() {
		return SUB_TEXT;
	}

	public void setSUB_TEXT(String sub_text) {
		SUB_TEXT = sub_text;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		return "SELECT ID,NAME,WORD,SUB_CREATED,SUB_LASTMODIFIED,SUB_TEXT FROM SYS_SUBJECT;";
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
		String sql = "select count(1) from SYS_SUBJECT";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		// TODO Auto-generated method stub
		
	}
}
