package com.hysoft.process.database.source.sqlserver2000.model;

import com.hysoft.process.database.DatabaseSql;

public class DomRelQstKey implements DatabaseSql {
	private String AVG_SCORE;
	private String BOOK_ISBN;
	private String BOOK_NAME;
	private String CLASS_1;
	private String CLASS_10;
	private String CLASS_2;
	private String CLASS_3;
	private String CLASS_4;
	private String CLASS_5;
	private String CLASS_6;
	private String CLASS_7;
	private String CLASS_8;
	private String CLASS_9;
	private String EXAM_TYPE;
	private String EXAM_TYPEID;
	private String GRADE;
	private String GRADEID;
	private String ISBN;
	private String PUTINPERSON;
	private String PUTINPERSONID;
	private String QST_ADVISE;
	private String QST_ANSWERTIME;
	private String QST_APPLY;
	private String QST_APPLYID;
	private String QST_BOOK;
	private String Qst_CLASSOPERATRPERSON;
	private String QST_CONTENT;
	private String QST_DIFICULTY;
	private String QST_DIFICULTYID;
	private String QST_DUPL;
	private String QST_EXAMPLE;
	private String QST_EXAMPLEID;
	private String QST_IMPORT;
	private String QST_KEY;
	private String QST_KEY_CASCADEID;
	private String QST_KEYID;
	private String QST_LEVEL;
	private String QST_LEVELID;
	private String QST_MEMO;
	private String QST_MODEL;
	private String QST_MODELID;
	private String QST_NUMBER;
	private String QST_ONLINETEST;
	private String QST_ONLINETESTID;
	private String QST_OOXML;
	private String QST_OPERATRPERSON;
	private String QST_QUALITY;
	private String QST_QUALITYID;
	private String QST_SOURCE;
	private String QST_SOURCETYPE;
	private String QST_SOURCETYPEID;
	private String QST_SUBJECT;
	private String QST_SUBJECTID;
	private String QST_TEACH;
	private String QST_TEACH_CASCADEID;
	private String QST_TEACHID;
	private String QST_TEXT;
	private String QST_TYPE;
	private String QST_TYPEID;
	private String QST_UNIT;
	private String QST_UNITID;
	private String QST_USE;
	private String QST_WORDSCOUNT;
	private String QST_YAER;
	private String SIGNER;
	private String SIGNERID;
	private String SOLVE_PROBLEM;
	private String SOLVE_PROBLEMID;
	private String SRC_DOCID;
	private String SYS_AUTHORS;
	private String SYS_CREATED;
	private String SYS_CURRENTFLOW;
	private String SYS_CURRENTNODE;
	private String SYS_CURRENTSTATUS;
	private String SYS_CURRENTUSERID;
	private String SYS_CURRENTUSERNAME;
	private String SYS_DELETEFLAG;
	private String SYS_DOCLIBID;
	private String SYS_DOCUMENTID;
	private String SYS_FOLDERID;
	private String SYS_HAVEATTACH;
	private String SYS_HAVERELATION;
	private String SYS_ISKEEP;
	private String SYS_ISLOCKED;
	private String SYS_LASTMODIFIED;
	private String SYS_TOPIC;
	private int currentPage; 
	
	public String getSql() {
		String sql = 
			"select top " + DatabaseSql.PAGE_COUNT + " AVG_SCORE,\n" +
			"BOOK_ISBN,\n" + 
			"BOOK_NAME,\n" + 
			"CLASS_1,\n" + 
			"CLASS_10,\n" + 
			"CLASS_2,\n" + 
			"CLASS_3,\n" + 
			"CLASS_4,\n" + 
			"CLASS_5,\n" + 
			"CLASS_6,\n" + 
			"CLASS_7,\n" + 
			"CLASS_8,\n" + 
			"CLASS_9,\n" + 
			"EXAM_TYPE,\n" + 
			"EXAM_TYPEID,\n" + 
			"GRADE,\n" + 
			"GRADEID,\n" + 
			"ISBN,\n" + 
			"PUTINPERSON,\n" + 
			"PUTINPERSONID,\n" + 
			"QST_ADVISE,\n" + 
			"QST_ANSWERTIME,\n" + 
			"QST_APPLY,\n" + 
			"QST_APPLYID,\n" + 
			"QST_BOOK,\n" + 
			"Qst_CLASSOPERATRPERSON,\n" + 
			"QST_CONTENT,\n" + 
			"QST_DIFICULTY,\n" + 
			"QST_DIFICULTYID,\n" + 
			"QST_DUPL,\n" + 
			"QST_EXAMPLE,\n" + 
			"QST_EXAMPLEID,\n" + 
			"QST_IMPORT,\n" + 
			"QST_KEY,\n" + 
			"QST_KEY_CASCADEID,\n" + 
			"QST_KEYID,\n" + 
			"QST_LEVEL,\n" + 
			"QST_LEVELID,\n" + 
			"QST_MEMO,\n" + 
			"QST_MODEL,\n" + 
			"QST_MODELID,\n" + 
			"QST_NUMBER,\n" + 
			"QST_ONLINETEST,\n" + 
			"QST_ONLINETESTID,\n" + 
			"QST_OOXML,\n" + 
			"QST_OPERATRPERSON,\n" + 
			"QST_QUALITY,\n" + 
			"QST_QUALITYID,\n" + 
			"QST_SOURCE,\n" + 
			"QST_SOURCETYPE,\n" + 
			"QST_SOURCETYPEID,\n" + 
			"QST_SUBJECT,\n" + 
			"QST_SUBJECTID,\n" + 
			"QST_TEACH,\n" + 
			"QST_TEACH_CASCADEID,\n" + 
			"QST_TEACHID,\n" + 
			"QST_TEXT,\n" + 
			"QST_TYPE,\n" + 
			"QST_TYPEID,\n" + 
			"QST_UNIT,\n" + 
			"QST_UNITID,\n" + 
			"QST_USE,\n" + 
			"QST_WORDSCOUNT,\n" + 
			"QST_YAER,\n" + 
			"SIGNER,\n" + 
			"SIGNERID,\n" + 
			"SOLVE_PROBLEM,\n" + 
			"SOLVE_PROBLEMID,\n" + 
			"SRC_DOCID,\n" + 
			"SYS_AUTHORS,\n" + 
			"SYS_CREATED,\n" + 
			"SYS_CURRENTFLOW,\n" + 
			"SYS_CURRENTNODE,\n" + 
			"SYS_CURRENTSTATUS,\n" + 
			"SYS_CURRENTUSERID,\n" + 
			"SYS_CURRENTUSERNAME,\n" + 
			"SYS_DELETEFLAG,\n" + 
			"SYS_DOCLIBID,\n" + 
			"SYS_DOCUMENTID,\n" + 
			"SYS_FOLDERID,\n" + 
			"SYS_HAVEATTACH,\n" + 
			"SYS_HAVERELATION,\n" + 
			"SYS_ISKEEP,\n" + 
			"SYS_ISLOCKED,\n" + 
			"CONVERT(varchar(100),SYS_LASTMODIFIED, 120) SYS_LASTMODIFIED,\n" + 
			"SYS_TOPIC from dom_rel_qst_key dk where dk.SYS_DOCUMENTID not in (select top " + DatabaseSql.PAGE_COUNT * this.currentPage + " SYS_DOCUMENTID from dom_rel_qst_key dit order by dit.SYS_DOCUMENTID) order by dk.SYS_DOCUMENTID";
		return sql;
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
		String sql = "select count(1) from dom_rel_qst_key";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		this.currentPage = pageNumber;
	}
	

	public String getAVG_SCORE() {
		return AVG_SCORE;
	}

	public void setAVG_SCORE(String avg_score) {
		AVG_SCORE = avg_score;
	}

	public String getBOOK_ISBN() {
		return BOOK_ISBN;
	}

	public void setBOOK_ISBN(String book_isbn) {
		BOOK_ISBN = book_isbn;
	}

	public String getBOOK_NAME() {
		return BOOK_NAME;
	}

	public void setBOOK_NAME(String book_name) {
		BOOK_NAME = book_name;
	}

	public String getCLASS_1() {
		return CLASS_1;
	}

	public void setCLASS_1(String class_1) {
		CLASS_1 = class_1;
	}

	public String getCLASS_10() {
		return CLASS_10;
	}

	public void setCLASS_10(String class_10) {
		CLASS_10 = class_10;
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

	public String getEXAM_TYPE() {
		return EXAM_TYPE;
	}

	public void setEXAM_TYPE(String exam_type) {
		EXAM_TYPE = exam_type;
	}

	public String getEXAM_TYPEID() {
		return EXAM_TYPEID;
	}

	public void setEXAM_TYPEID(String exam_typeid) {
		EXAM_TYPEID = exam_typeid;
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

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String isbn) {
		ISBN = isbn;
	}

	public String getPUTINPERSON() {
		return PUTINPERSON;
	}

	public void setPUTINPERSON(String putinperson) {
		PUTINPERSON = putinperson;
	}

	public String getPUTINPERSONID() {
		return PUTINPERSONID;
	}

	public void setPUTINPERSONID(String putinpersonid) {
		PUTINPERSONID = putinpersonid;
	}

	public String getQST_ADVISE() {
		return QST_ADVISE;
	}

	public void setQST_ADVISE(String qst_advise) {
		QST_ADVISE = qst_advise;
	}

	public String getQST_ANSWERTIME() {
		return QST_ANSWERTIME;
	}

	public void setQST_ANSWERTIME(String qst_answertime) {
		QST_ANSWERTIME = qst_answertime;
	}

	public String getQST_APPLY() {
		return QST_APPLY;
	}

	public void setQST_APPLY(String qst_apply) {
		QST_APPLY = qst_apply;
	}

	public String getQST_APPLYID() {
		return QST_APPLYID;
	}

	public void setQST_APPLYID(String qst_applyid) {
		QST_APPLYID = qst_applyid;
	}

	public String getQST_BOOK() {
		return QST_BOOK;
	}

	public void setQST_BOOK(String qst_book) {
		QST_BOOK = qst_book;
	}

	public String getQst_CLASSOPERATRPERSON() {
		return Qst_CLASSOPERATRPERSON;
	}

	public void setQst_CLASSOPERATRPERSON(String qst_CLASSOPERATRPERSON) {
		Qst_CLASSOPERATRPERSON = qst_CLASSOPERATRPERSON;
	}

	public String getQST_CONTENT() {
		return QST_CONTENT;
	}

	public void setQST_CONTENT(String qst_content) {
		QST_CONTENT = qst_content;
	}

	public String getQST_DIFICULTY() {
		return QST_DIFICULTY;
	}

	public void setQST_DIFICULTY(String qst_dificulty) {
		QST_DIFICULTY = qst_dificulty;
	}

	public String getQST_DIFICULTYID() {
		return QST_DIFICULTYID;
	}

	public void setQST_DIFICULTYID(String qst_dificultyid) {
		QST_DIFICULTYID = qst_dificultyid;
	}

	public String getQST_DUPL() {
		return QST_DUPL;
	}

	public void setQST_DUPL(String qst_dupl) {
		QST_DUPL = qst_dupl;
	}

	public String getQST_EXAMPLE() {
		return QST_EXAMPLE;
	}

	public void setQST_EXAMPLE(String qst_example) {
		QST_EXAMPLE = qst_example;
	}

	public String getQST_EXAMPLEID() {
		return QST_EXAMPLEID;
	}

	public void setQST_EXAMPLEID(String qst_exampleid) {
		QST_EXAMPLEID = qst_exampleid;
	}

	public String getQST_IMPORT() {
		return QST_IMPORT;
	}

	public void setQST_IMPORT(String qst_import) {
		QST_IMPORT = qst_import;
	}

	public String getQST_KEY() {
		return QST_KEY;
	}

	public void setQST_KEY(String qst_key) {
		QST_KEY = qst_key;
	}

	public String getQST_KEY_CASCADEID() {
		return QST_KEY_CASCADEID;
	}

	public void setQST_KEY_CASCADEID(String qst_key_cascadeid) {
		QST_KEY_CASCADEID = qst_key_cascadeid;
	}

	public String getQST_KEYID() {
		return QST_KEYID;
	}

	public void setQST_KEYID(String qst_keyid) {
		QST_KEYID = qst_keyid;
	}

	public String getQST_LEVEL() {
		return QST_LEVEL;
	}

	public void setQST_LEVEL(String qst_level) {
		QST_LEVEL = qst_level;
	}

	public String getQST_LEVELID() {
		return QST_LEVELID;
	}

	public void setQST_LEVELID(String qst_levelid) {
		QST_LEVELID = qst_levelid;
	}

	public String getQST_MEMO() {
		return QST_MEMO;
	}

	public void setQST_MEMO(String qst_memo) {
		QST_MEMO = qst_memo;
	}

	public String getQST_MODEL() {
		return QST_MODEL;
	}

	public void setQST_MODEL(String qst_model) {
		QST_MODEL = qst_model;
	}

	public String getQST_MODELID() {
		return QST_MODELID;
	}

	public void setQST_MODELID(String qst_modelid) {
		QST_MODELID = qst_modelid;
	}

	public String getQST_NUMBER() {
		return QST_NUMBER;
	}

	public void setQST_NUMBER(String qst_number) {
		QST_NUMBER = qst_number;
	}

	public String getQST_ONLINETEST() {
		return QST_ONLINETEST;
	}

	public void setQST_ONLINETEST(String qst_onlinetest) {
		QST_ONLINETEST = qst_onlinetest;
	}

	public String getQST_ONLINETESTID() {
		return QST_ONLINETESTID;
	}

	public void setQST_ONLINETESTID(String qst_onlinetestid) {
		QST_ONLINETESTID = qst_onlinetestid;
	}

	public String getQST_OOXML() {
		return QST_OOXML;
	}

	public void setQST_OOXML(String qst_ooxml) {
		QST_OOXML = qst_ooxml;
	}

	public String getQST_OPERATRPERSON() {
		return QST_OPERATRPERSON;
	}

	public void setQST_OPERATRPERSON(String qst_operatrperson) {
		QST_OPERATRPERSON = qst_operatrperson;
	}

	public String getQST_QUALITY() {
		return QST_QUALITY;
	}

	public void setQST_QUALITY(String qst_quality) {
		QST_QUALITY = qst_quality;
	}

	public String getQST_QUALITYID() {
		return QST_QUALITYID;
	}

	public void setQST_QUALITYID(String qst_qualityid) {
		QST_QUALITYID = qst_qualityid;
	}

	public String getQST_SOURCE() {
		return QST_SOURCE;
	}

	public void setQST_SOURCE(String qst_source) {
		QST_SOURCE = qst_source;
	}

	public String getQST_SOURCETYPE() {
		return QST_SOURCETYPE;
	}

	public void setQST_SOURCETYPE(String qst_sourcetype) {
		QST_SOURCETYPE = qst_sourcetype;
	}

	public String getQST_SOURCETYPEID() {
		return QST_SOURCETYPEID;
	}

	public void setQST_SOURCETYPEID(String qst_sourcetypeid) {
		QST_SOURCETYPEID = qst_sourcetypeid;
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

	public String getQST_TEACH() {
		return QST_TEACH;
	}

	public void setQST_TEACH(String qst_teach) {
		QST_TEACH = qst_teach;
	}

	public String getQST_TEACH_CASCADEID() {
		return QST_TEACH_CASCADEID;
	}

	public void setQST_TEACH_CASCADEID(String qst_teach_cascadeid) {
		QST_TEACH_CASCADEID = qst_teach_cascadeid;
	}

	public String getQST_TEACHID() {
		return QST_TEACHID;
	}

	public void setQST_TEACHID(String qst_teachid) {
		QST_TEACHID = qst_teachid;
	}

	public String getQST_TEXT() {
		return QST_TEXT;
	}

	public void setQST_TEXT(String qst_text) {
		QST_TEXT = qst_text;
	}

	public String getQST_TYPE() {
		return QST_TYPE;
	}

	public void setQST_TYPE(String qst_type) {
		QST_TYPE = qst_type;
	}

	public String getQST_TYPEID() {
		return QST_TYPEID;
	}

	public void setQST_TYPEID(String qst_typeid) {
		QST_TYPEID = qst_typeid;
	}

	public String getQST_UNIT() {
		return QST_UNIT;
	}

	public void setQST_UNIT(String qst_unit) {
		QST_UNIT = qst_unit;
	}

	public String getQST_UNITID() {
		return QST_UNITID;
	}

	public void setQST_UNITID(String qst_unitid) {
		QST_UNITID = qst_unitid;
	}

	public String getQST_USE() {
		return QST_USE;
	}

	public void setQST_USE(String qst_use) {
		QST_USE = qst_use;
	}

	public String getQST_WORDSCOUNT() {
		return QST_WORDSCOUNT;
	}

	public void setQST_WORDSCOUNT(String qst_wordscount) {
		QST_WORDSCOUNT = qst_wordscount;
	}

	public String getQST_YAER() {
		return QST_YAER;
	}

	public void setQST_YAER(String qst_yaer) {
		QST_YAER = qst_yaer;
	}

	public String getSIGNER() {
		return SIGNER;
	}

	public void setSIGNER(String signer) {
		SIGNER = signer;
	}

	public String getSIGNERID() {
		return SIGNERID;
	}

	public void setSIGNERID(String signerid) {
		SIGNERID = signerid;
	}

	public String getSOLVE_PROBLEM() {
		return SOLVE_PROBLEM;
	}

	public void setSOLVE_PROBLEM(String solve_problem) {
		SOLVE_PROBLEM = solve_problem;
	}

	public String getSOLVE_PROBLEMID() {
		return SOLVE_PROBLEMID;
	}

	public void setSOLVE_PROBLEMID(String solve_problemid) {
		SOLVE_PROBLEMID = solve_problemid;
	}

	public String getSRC_DOCID() {
		return SRC_DOCID;
	}

	public void setSRC_DOCID(String src_docid) {
		SRC_DOCID = src_docid;
	}

	public String getSYS_AUTHORS() {
		return SYS_AUTHORS;
	}

	public void setSYS_AUTHORS(String sys_authors) {
		SYS_AUTHORS = sys_authors;
	}

	public String getSYS_CREATED() {
		return SYS_CREATED;
	}

	public void setSYS_CREATED(String sys_created) {
		SYS_CREATED = sys_created;
	}

	public String getSYS_CURRENTFLOW() {
		return SYS_CURRENTFLOW;
	}

	public void setSYS_CURRENTFLOW(String sys_currentflow) {
		SYS_CURRENTFLOW = sys_currentflow;
	}

	public String getSYS_CURRENTNODE() {
		return SYS_CURRENTNODE;
	}

	public void setSYS_CURRENTNODE(String sys_currentnode) {
		SYS_CURRENTNODE = sys_currentnode;
	}

	public String getSYS_CURRENTSTATUS() {
		return SYS_CURRENTSTATUS;
	}

	public void setSYS_CURRENTSTATUS(String sys_currentstatus) {
		SYS_CURRENTSTATUS = sys_currentstatus;
	}

	public String getSYS_CURRENTUSERID() {
		return SYS_CURRENTUSERID;
	}

	public void setSYS_CURRENTUSERID(String sys_currentuserid) {
		SYS_CURRENTUSERID = sys_currentuserid;
	}

	public String getSYS_CURRENTUSERNAME() {
		return SYS_CURRENTUSERNAME;
	}

	public void setSYS_CURRENTUSERNAME(String sys_currentusername) {
		SYS_CURRENTUSERNAME = sys_currentusername;
	}

	public String getSYS_DELETEFLAG() {
		return SYS_DELETEFLAG;
	}

	public void setSYS_DELETEFLAG(String sys_deleteflag) {
		SYS_DELETEFLAG = sys_deleteflag;
	}

	public String getSYS_DOCLIBID() {
		return SYS_DOCLIBID;
	}

	public void setSYS_DOCLIBID(String sys_doclibid) {
		SYS_DOCLIBID = sys_doclibid;
	}

	public String getSYS_DOCUMENTID() {
		return SYS_DOCUMENTID;
	}

	public void setSYS_DOCUMENTID(String sys_documentid) {
		SYS_DOCUMENTID = sys_documentid;
	}

	public String getSYS_FOLDERID() {
		return SYS_FOLDERID;
	}

	public void setSYS_FOLDERID(String sys_folderid) {
		SYS_FOLDERID = sys_folderid;
	}

	public String getSYS_HAVEATTACH() {
		return SYS_HAVEATTACH;
	}

	public void setSYS_HAVEATTACH(String sys_haveattach) {
		SYS_HAVEATTACH = sys_haveattach;
	}

	public String getSYS_HAVERELATION() {
		return SYS_HAVERELATION;
	}

	public void setSYS_HAVERELATION(String sys_haverelation) {
		SYS_HAVERELATION = sys_haverelation;
	}

	public String getSYS_ISKEEP() {
		return SYS_ISKEEP;
	}

	public void setSYS_ISKEEP(String sys_iskeep) {
		SYS_ISKEEP = sys_iskeep;
	}

	public String getSYS_ISLOCKED() {
		return SYS_ISLOCKED;
	}

	public void setSYS_ISLOCKED(String sys_islocked) {
		SYS_ISLOCKED = sys_islocked;
	}

	public String getSYS_LASTMODIFIED() {
		return SYS_LASTMODIFIED;
	}

	public void setSYS_LASTMODIFIED(String sys_lastmodified) {
		SYS_LASTMODIFIED = sys_lastmodified;
	}

	public String getSYS_TOPIC() {
		return SYS_TOPIC;
	}

	public void setSYS_TOPIC(String sys_topic) {
		SYS_TOPIC = sys_topic;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}
}
