package com.hysoft.process.database.target.model;

import com.hysoft.process.database.DatabaseSql;

public class TresQuestion implements DatabaseSql {
	private String QST_ID ;
	private String QST_CONTENT ;
	private String QST_TEXT ;
	private String QST_TITLE ;
	private String QST_RESULT ;
	private String QST_ANALYSIS; 
	private String QST_QUALITYID; 
	private String QST_DIFICULTYID;
	private String QST_YAER ;
	private String QST_SUBJECT_ID ;
	private String QST_TEACH_ID ;
	private String QST_TEACH_CASCADEID ;
	private String QST_KEYID ;
	private String QST_KEY_CASCADEID ;
	private String DEL_STATUS ;
	private String CREATE_TIME ;
	private String MODIFY_TIME ;
	private String RELEASE_TIME;
	private String QST_TYPEID;
	
	public String getQST_ID() {
		return QST_ID;
	}

	public void setQST_ID(String qst_id) {
		QST_ID = qst_id;
	}

	public String getQST_CONTENT() {
		return QST_CONTENT;
	}

	public void setQST_CONTENT(String qst_content) {
		QST_CONTENT = qst_content;
	}

	public String getQST_TEXT() {
		return QST_TEXT;
	}

	public void setQST_TEXT(String qst_text) {
		QST_TEXT = qst_text;
	}

	public String getQST_TITLE() {
		return QST_TITLE;
	}

	public void setQST_TITLE(String qst_title) {
		QST_TITLE = qst_title;
	}

	public String getQST_RESULT() {
		return QST_RESULT;
	}

	public void setQST_RESULT(String qst_result) {
		QST_RESULT = qst_result;
	}

	public String getQST_ANALYSIS() {
		return QST_ANALYSIS;
	}

	public void setQST_ANALYSIS(String qst_analysis) {
		QST_ANALYSIS = qst_analysis;
	}

	public String getQST_QUALITYID() {
		return QST_QUALITYID;
	}

	public void setQST_QUALITYID(String qst_qualityid) {
		QST_QUALITYID = qst_qualityid;
	}

	public String getQST_DIFICULTYID() {
		return QST_DIFICULTYID;
	}

	public void setQST_DIFICULTYID(String qst_dificultyid) {
		QST_DIFICULTYID = qst_dificultyid;
	}

	public String getQST_YAER() {
		return QST_YAER;
	}

	public void setQST_YAER(String qst_yaer) {
		QST_YAER = qst_yaer;
	}

	public String getQST_SUBJECT_ID() {
		return QST_SUBJECT_ID;
	}

	public void setQST_SUBJECT_ID(String qst_subject_id) {
		QST_SUBJECT_ID = qst_subject_id;
	}

	public String getQST_TEACH_ID() {
		return QST_TEACH_ID;
	}

	public void setQST_TEACH_ID(String qst_teach_id) {
		QST_TEACH_ID = qst_teach_id;
	}

	public String getQST_TEACH_CASCADEID() {
		return QST_TEACH_CASCADEID;
	}

	public void setQST_TEACH_CASCADEID(String qst_teach_cascadeid) {
		QST_TEACH_CASCADEID = qst_teach_cascadeid;
	}

	public String getQST_KEYID() {
		return QST_KEYID;
	}

	public void setQST_KEYID(String qst_keyid) {
		QST_KEYID = qst_keyid;
	}

	public String getQST_KEY_CASCADEID() {
		return QST_KEY_CASCADEID;
	}

	public void setQST_KEY_CASCADEID(String qst_key_cascadeid) {
		QST_KEY_CASCADEID = qst_key_cascadeid;
	}

	public String getDEL_STATUS() {
		return DEL_STATUS;
	}

	public void setDEL_STATUS(String del_status) {
		DEL_STATUS = del_status;
	}

	public String getCREATE_TIME() {
		return CREATE_TIME;
	}

	public void setCREATE_TIME(String create_time) {
		CREATE_TIME = create_time;
	}

	public String getMODIFY_TIME() {
		return MODIFY_TIME;
	}

	public void setMODIFY_TIME(String modify_time) {
		MODIFY_TIME = modify_time;
	}

	public String getRELEASE_TIME() {
		return RELEASE_TIME;
	}

	public void setRELEASE_TIME(String release_time) {
		RELEASE_TIME = release_time;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = "insert into T_RES_QUESTION (QST_ID ,\n" +
		"QST_CONTENT ,\n" + 
		"QST_TEXT ,\n" + 
		"QST_TITLE ,\n" + 
		"QST_RESULT ,\n" + 
		"QST_ANALYSIS,\n" + 
		"QST_QUALITYID,\n" + 
		"QST_DIFICULTYID ,\n" + 
		"QST_YAER ,\n" + 
		"QST_SUBJECT_ID ,\n" + 
		"QST_TEACH_ID ,\n" + 
		"QST_TEACH_CASCADEID ,\n" + 
		"QST_KEYID ,\n" + 
		"QST_KEY_CASCADEID ,\n" + 
		"DEL_STATUS ,\n" + 
		"CREATE_TIME ,\n" + 
		"MODIFY_TIME,\n" + 
		"RELEASE_TIME," +
		"FZ_DOC_ID," +
		"QST_TYPEID) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		return sql;
	}

	public String deleteSql() {
        String sql = "delete from T_RES_QUESTION where QST_ID = ?";
        return sql;
	}
		
	public String isExistByDatabaseFormSql() {
		 String sql = "select 1 from T_RES_QUESTION where QST_ID = ? and date_format(MODIFY_TIME,'%Y-%m-%d %H:%i:%s') = ?";
	     return sql;
	}

	public String isExistByKeyIdSql() {
		String sql = "select 1 from T_RES_QUESTION where QST_ID = ?";
	     return sql;
	}

	public String updateSql() {
		return null;
	}

	public String getCount() {
		String sql = "";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		
	}

	public String getQST_TYPEID() {
		return QST_TYPEID;
	}

	public void setQST_TYPEID(String qst_typeid) {
		QST_TYPEID = qst_typeid;
	}
}
