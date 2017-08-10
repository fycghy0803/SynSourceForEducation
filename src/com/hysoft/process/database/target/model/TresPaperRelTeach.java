package com.hysoft.process.database.target.model;

import com.hysoft.process.database.DatabaseSql;

public class TresPaperRelTeach implements DatabaseSql {
	private String PAPER_ID;
	private String PAPER_TEACH_ID;
	private String PAPER_KEY_ID;
	private String CLASS_1;
	private String CLASS_2;
	private String CLASS_3;
	private String CLASS_4;
	private String CLASS_5;
	private String CLASS_6;
	private String CLASS_7;
	private String CLASS_8;
	private String CLASS_9;
	private String CLASS_10;
	private String PAPER_TEACH_CASCADEID;
	private String PAPER_KEY_CASCADEID;
	
	public String deleteSql() {
		String sql = "delete from T_RES_PAPER_REL_TEACH  where PAPER_ID = ?";
		return sql;
	}

	public String getCount() {
		return "";
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = "insert into T_RES_PAPER_REL_TEACH(PAPER_ID,PAPER_TEACH_ID," +
		"CLASS_1," +
		"CLASS_2," +
		"CLASS_3," +
		"CLASS_4," +
		"CLASS_5,CLASS_6,CLASS_7,CLASS_8,CLASS_9,CLASS_10) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        return sql;
	}

	public String isExistByDatabaseFormSql() {
		String sql = "select 1 from T_RES_PAPER_REL_TEACH  where PAPER_ID = ?";
		return sql;
	}

	public String isExistByKeyIdSql() {
		String sql = "select 1 from T_RES_PAPER_REL_TEACH  where PAPER_ID = ?";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		// TODO Auto-generated method stub

	}

	public String updateSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getPAPER_ID() {
		return PAPER_ID;
	}

	public void setPAPER_ID(String paper_id) {
		PAPER_ID = paper_id;
	}

	public String getPAPER_TEACH_ID() {
		return PAPER_TEACH_ID;
	}

	public void setPAPER_TEACH_ID(String paper_teach_id) {
		PAPER_TEACH_ID = paper_teach_id;
	}

	public String getPAPER_KEY_ID() {
		return PAPER_KEY_ID;
	}

	public void setPAPER_KEY_ID(String paper_key_id) {
		PAPER_KEY_ID = paper_key_id;
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

	public String getPAPER_TEACH_CASCADEID() {
		return PAPER_TEACH_CASCADEID;
	}

	public void setPAPER_TEACH_CASCADEID(String paper_teach_cascadeid) {
		PAPER_TEACH_CASCADEID = paper_teach_cascadeid;
	}

	public String getPAPER_KEY_CASCADEID() {
		return PAPER_KEY_CASCADEID;
	}

	public void setPAPER_KEY_CASCADEID(String paper_key_cascadeid) {
		PAPER_KEY_CASCADEID = paper_key_cascadeid;
	}	
}
