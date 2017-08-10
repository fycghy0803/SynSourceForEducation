package com.hysoft.process.database.source.mysql.model;

import com.hysoft.process.database.DatabaseSql;

public class FzMathmlImg implements DatabaseSql{
    private String hash;
    private String documentid;
    private String filepath;
    private String remote;
   
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	public String getDocumentid() {
		return documentid;
	}
	public void setDocumentid(String documentid) {
		this.documentid = documentid;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getRemote() {
		return remote;
	}
	public void setRemote(String remote) {
		this.remote = remote;
	}
	
	public String getSql() {
	   String sql = "select hash,documentid,filepath,remote from fz_mathml_img limit ?," + DatabaseSql.PAGE_COUNT;
	   return sql;
	}
	public String getImgPath(String sourcePath) {
		return sourcePath;
	}
	
	public String getImgColumnName() {
		return "filepath";
	}
	public String deleteSql() {
		return null;
	}
	public String isExistByDatabaseFormSql() {
		return null;
	}
	public String isExistByKeyIdSql() {
		return null;
	}
	public String updateSql() {
		return null;
	}
	public String getCount() {
		String sql = "select count(1) from fz_mathml_img";
		return sql;
	}
	public void setCurrentPage(int pageNumber) {
		// TODO Auto-generated method stub
		
	}	
}
