package com.hysoft.process.database.target.model;

import com.hysoft.process.database.DatabaseSql;

public class TresQstRelTeach implements DatabaseSql {
	private String QST_ID; 
	private String QST_SUBJECT ;
	private String QST_SUBJECTID; 
	private String QST_TEACHID ;
	private String QST_KEYID ;
	private String QST_DIFICULTYID ;
	private String QST_TYPEID ;
	private String QST_LEVELID ;
	private String QST_QUALITYID; 
	private String CLASS_1 ;
	private String CLASS_2 ;
	private String CLASS_3 ;
	private String CLASS_4 ;
	private String CLASS_5 ;
	private String CLASS_6 ;
	private String CLASS_7 ;
	private String CLASS_8 ;
	private String CLASS_9 ;
	private String CLASS_10 ;
	private String QST_TEACH_CASCADEID ;
	private String QST_KEY_CASCADEID ;
	private String GRADE ;
	private String GRADEID; 
	private String CREATE_TIME ;
	private String MODIFY_TIME;
	
	public String getQST_ID() {
		return QST_ID;
	}

	public void setQST_ID(String qst_id) {
		QST_ID = qst_id;
	}

	public String getQST_SUBJECT() {
		return QST_SUBJECT;
	}

	public void setQST_SUBJECT(String qst_subject) {
		QST_SUBJECT = qst_subject;
	}

	public String getQST_SUBJECTID() {
		return QST_SUBJECTID;
	}

	public void setQST_SUBJECTID(String qst_subjectid) {
		QST_SUBJECTID = qst_subjectid;
	}

	public String getQST_TEACHID() {
		return QST_TEACHID;
	}

	public void setQST_TEACHID(String qst_teachid) {
		QST_TEACHID = qst_teachid;
	}

	public String getQST_KEYID() {
		return QST_KEYID;
	}

	public void setQST_KEYID(String qst_keyid) {
		QST_KEYID = qst_keyid;
	}

	public String getQST_DIFICULTYID() {
		return QST_DIFICULTYID;
	}

	public void setQST_DIFICULTYID(String qst_dificultyid) {
		QST_DIFICULTYID = qst_dificultyid;
	}

	public String getQST_TYPEID() {
		return QST_TYPEID;
	}

	public void setQST_TYPEID(String qst_typeid) {
		QST_TYPEID = qst_typeid;
	}

	public String getQST_LEVELID() {
		return QST_LEVELID;
	}

	public void setQST_LEVELID(String qst_levelid) {
		QST_LEVELID = qst_levelid;
	}

	public String getQST_QUALITYID() {
		return QST_QUALITYID;
	}

	public void setQST_QUALITYID(String qst_qualityid) {
		QST_QUALITYID = qst_qualityid;
	}

	public String getCLASS_1() {
		return CLASS_1;
	}

	public void setCLASS_1(String class_1) {
		CLASS_1 = class_1;
	}

	public String getCLASS_2() {
		return CLASS_2;
	}

	public void setCLASS_2(String class_2) {
		CLASS_2 = class_2;
	}

	public String getCLASS_3() {
		return CLASS_3;
	}

	public void setCLASS_3(String class_3) {
		CLASS_3 = class_3;
	}

	public String getCLASS_4() {
		return CLASS_4;
	}

	public void setCLASS_4(String class_4) {
		CLASS_4 = class_4;
	}

	public String getCLASS_5() {
		return CLASS_5;
	}

	public void setCLASS_5(String class_5) {
		CLASS_5 = class_5;
	}

	public String getCLASS_6() {
		return CLASS_6;
	}

	public void setCLASS_6(String class_6) {
		CLASS_6 = class_6;
	}

	public String getCLASS_7() {
		return CLASS_7;
	}

	public void setCLASS_7(String class_7) {
		CLASS_7 = class_7;
	}

	public String getCLASS_8() {
		return CLASS_8;
	}

	public void setCLASS_8(String class_8) {
		CLASS_8 = class_8;
	}

	public String getCLASS_9() {
		return CLASS_9;
	}

	public void setCLASS_9(String class_9) {
		CLASS_9 = class_9;
	}

	public String getCLASS_10() {
		return CLASS_10;
	}

	public void setCLASS_10(String class_10) {
		CLASS_10 = class_10;
	}

	public String getQST_TEACH_CASCADEID() {
		return QST_TEACH_CASCADEID;
	}

	public void setQST_TEACH_CASCADEID(String qst_teach_cascadeid) {
		QST_TEACH_CASCADEID = qst_teach_cascadeid;
	}

	public String getQST_KEY_CASCADEID() {
		return QST_KEY_CASCADEID;
	}

	public void setQST_KEY_CASCADEID(String qst_key_cascadeid) {
		QST_KEY_CASCADEID = qst_key_cascadeid;
	}

	public String getGRADE() {
		return GRADE;
	}

	public void setGRADE(String grade) {
		GRADE = grade;
	}

	public String getGRADEID() {
		return GRADEID;
	}

	public void setGRADEID(String gradeid) {
		GRADEID = gradeid;
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

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = "insert into T_RES_QST_REL_TEACH (QST_ID,\n" +
							"QST_SUBJECT ,\n" + 
							"QST_SUBJECTID,\n" + 
							"QST_TEACHID ,\n" + 
							"QST_KEYID ,\n" + 
							"QST_DIFICULTYID ,\n" + 
							"QST_TYPEID ,\n" + 
							"QST_LEVELID ,\n" + 
							"QST_QUALITYID,\n" + 
							"CLASS_1 ,\n" + 
							"CLASS_2 ,\n" + 
							"CLASS_3 ,\n" + 
							"CLASS_4 ,\n" + 
							"CLASS_5 ,\n" + 
							"CLASS_6 ,\n" + 
							"CLASS_7 ,\n" + 
							"CLASS_8 ,\n" + 
							"CLASS_9 ,\n" + 
							"CLASS_10 ,\n" + 
							"QST_TEACH_CASCADEID ,\n" + 
							"QST_KEY_CASCADEID ,\n" + 
							"GRADE ,\n" + 
							"GRADEID,\n" + 
							"CREATE_TIME ,\n" + 
							"MODIFY_TIME) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		return sql;
	}

	public String deleteSql() {
		String sql = "delete from T_RES_QST_REL_TEACH where QST_ID = ?";
		return sql;
	}

	public String updateSql() {
		return null;
	}

	public String isExistByDatabaseFormSql() {
		String sql = "select 1 from T_RES_QST_REL_TEACH where QST_ID = ? and date_format(MODIFY_TIME,'%Y-%m-%d %H:%i:%s') = ?";
		return sql;
	}

	public String isExistByKeyIdSql() {
		String sql = "select 1 from T_RES_QST_REL_TEACH where QST_ID = ?";
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
