package com.hysoft.process.database.source.sqlserver2000.model;

import com.hysoft.process.database.DatabaseSql;

public class Doc1Doclib implements DatabaseSql {
	private String ANSWER_TIMES;
	private String AVG_SCORE;
	private String BOOK_ISBN;
	private String BOOK_NAME;
	private String CHECK_1_AUTHOR;
	private String CHECK_1_AUTHORID;
	private String CHECK_1_STATUS;
	private String CHECK_2_AUTHOR;
	private String CHECK_2_AUTHORID;
	private String CHECK_2_STATUS;
	private String CHECK_AUTHOR;
	private String CHECK_AUTHORID;
	private String CHECK_STATUS;
	private String COMMENTS;
	private String DOC_ID;
	private String DOC_LIBID;
	private String DOC_QSTTYPE;
	private String DOC_STATUS;
	private String DUPLIBNAME;
	private String ERRORMERGE;
	private String EXAM_TYPE;
	private String EXAM_TYPEID;
	private String GRADE;
	private String GRADEID;
	private String ISBN;
	private String LABEL_1_AUTHOR;
	private String LABEL_1_AUTHORID;
	private String LABEL_1_STATUS;
	private String LABEL_2_AUTHOR;
	private String LABEL_2_AUTHORID;
	private String LABEL_2_STATUS;
	private String LABEL_3_AUTHOR;
	private String LABEL_3_AUTHORID;
	private String LABEL_3_STATUS;
	private String PAGENUMBER;
	private String PAPERTYPE;
	private String PAPERTYPEID;
	private String PRESSINFO;
	private String PRESSINFOID;
	private String PRINTORDER;
	private String PUB_DATE;
	private String PUBLISHDATE;
	private String PUTINPERSON;
	private String PUTINPERSONID;
	private String QST_ADVISE;
	private String QST_ANSWERTIME;
	private String QST_APPLICATION;
	private String QST_APPLY;
	private String QST_APPLYID;
	private String QST_BASE;
	private String QST_BOOK;
	private String Qst_CLASSOPERATRPERSON;
	private String QST_COMPOSITE;
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
	private String QST_OLDINDEX;
	private String QST_ONLINETEST;
	private String QST_ONLINETESTID;
	private String QST_OOXML;
	private String QST_OPERATRPERSON;
	private String QST_OVER;
	private String QST_QUALITY;
	private String QST_QUALITYID;
	private String QST_ROWS;
	private String QST_SCORE;
	private String QST_SOURCE;
	private String QST_SOURCETYPE;
	private String QST_SOURCETYPEID;
	private String QST_SUBJECT;
	private String QST_SUBJECTID;
	private String QST_TEACH;
	private String QST_TEACH_CASCADEID;
	private String QST_TEACHID;
	private String QST_TEXT;
	private String QST_TQID;
	private String QST_TYPE;
	private String QST_TYPEID;
	private String QST_UNIT;
	private String QST_UNIT_NO;
	private String QST_UNITID;
	private String QST_USE;
	private String QST_WORDSCOUNT;
	private String QST_YAER;
	private String QST_YAERID;
	private String REVISION;
	private String SIGNER;
	private String SIGNERID;
	private String SOLVE_PROBLEM;
	private String SOLVE_PROBLEMID;
	private String SRC_DOCID;
	private String SUBQST_NUM;
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
	
	public int getCurrentPage() {
		return currentPage;
	}

	public String getANSWER_TIMES() {
		return ANSWER_TIMES;
	}

	public void setANSWER_TIMES(String answer_times) {
		ANSWER_TIMES = answer_times;
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

	public String getCHECK_1_AUTHOR() {
		return CHECK_1_AUTHOR;
	}

	public void setCHECK_1_AUTHOR(String check_1_author) {
		CHECK_1_AUTHOR = check_1_author;
	}

	public String getCHECK_1_AUTHORID() {
		return CHECK_1_AUTHORID;
	}

	public void setCHECK_1_AUTHORID(String check_1_authorid) {
		CHECK_1_AUTHORID = check_1_authorid;
	}

	public String getCHECK_1_STATUS() {
		return CHECK_1_STATUS;
	}

	public void setCHECK_1_STATUS(String check_1_status) {
		CHECK_1_STATUS = check_1_status;
	}

	public String getCHECK_2_AUTHOR() {
		return CHECK_2_AUTHOR;
	}

	public void setCHECK_2_AUTHOR(String check_2_author) {
		CHECK_2_AUTHOR = check_2_author;
	}

	public String getCHECK_2_AUTHORID() {
		return CHECK_2_AUTHORID;
	}

	public void setCHECK_2_AUTHORID(String check_2_authorid) {
		CHECK_2_AUTHORID = check_2_authorid;
	}

	public String getCHECK_2_STATUS() {
		return CHECK_2_STATUS;
	}

	public void setCHECK_2_STATUS(String check_2_status) {
		CHECK_2_STATUS = check_2_status;
	}

	public String getCHECK_AUTHOR() {
		return CHECK_AUTHOR;
	}

	public void setCHECK_AUTHOR(String check_author) {
		CHECK_AUTHOR = check_author;
	}

	public String getCHECK_AUTHORID() {
		return CHECK_AUTHORID;
	}

	public void setCHECK_AUTHORID(String check_authorid) {
		CHECK_AUTHORID = check_authorid;
	}

	public String getCHECK_STATUS() {
		return CHECK_STATUS;
	}

	public void setCHECK_STATUS(String check_status) {
		CHECK_STATUS = check_status;
	}

	public String getCOMMENTS() {
		return COMMENTS;
	}

	public void setCOMMENTS(String comments) {
		COMMENTS = comments;
	}

	public String getDOC_ID() {
		return DOC_ID;
	}

	public void setDOC_ID(String doc_id) {
		DOC_ID = doc_id;
	}

	public String getDOC_LIBID() {
		return DOC_LIBID;
	}

	public void setDOC_LIBID(String doc_libid) {
		DOC_LIBID = doc_libid;
	}

	public String getDOC_QSTTYPE() {
		return DOC_QSTTYPE;
	}

	public void setDOC_QSTTYPE(String doc_qsttype) {
		DOC_QSTTYPE = doc_qsttype;
	}

	public String getDOC_STATUS() {
		return DOC_STATUS;
	}

	public void setDOC_STATUS(String doc_status) {
		DOC_STATUS = doc_status;
	}

	public String getDUPLIBNAME() {
		return DUPLIBNAME;
	}

	public void setDUPLIBNAME(String duplibname) {
		DUPLIBNAME = duplibname;
	}

	public String getERRORMERGE() {
		return ERRORMERGE;
	}

	public void setERRORMERGE(String errormerge) {
		ERRORMERGE = errormerge;
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

	public String getLABEL_1_AUTHOR() {
		return LABEL_1_AUTHOR;
	}

	public void setLABEL_1_AUTHOR(String label_1_author) {
		LABEL_1_AUTHOR = label_1_author;
	}

	public String getLABEL_1_AUTHORID() {
		return LABEL_1_AUTHORID;
	}

	public void setLABEL_1_AUTHORID(String label_1_authorid) {
		LABEL_1_AUTHORID = label_1_authorid;
	}

	public String getLABEL_1_STATUS() {
		return LABEL_1_STATUS;
	}

	public void setLABEL_1_STATUS(String label_1_status) {
		LABEL_1_STATUS = label_1_status;
	}

	public String getLABEL_2_AUTHOR() {
		return LABEL_2_AUTHOR;
	}

	public void setLABEL_2_AUTHOR(String label_2_author) {
		LABEL_2_AUTHOR = label_2_author;
	}

	public String getLABEL_2_AUTHORID() {
		return LABEL_2_AUTHORID;
	}

	public void setLABEL_2_AUTHORID(String label_2_authorid) {
		LABEL_2_AUTHORID = label_2_authorid;
	}

	public String getLABEL_2_STATUS() {
		return LABEL_2_STATUS;
	}

	public void setLABEL_2_STATUS(String label_2_status) {
		LABEL_2_STATUS = label_2_status;
	}

	public String getLABEL_3_AUTHOR() {
		return LABEL_3_AUTHOR;
	}

	public void setLABEL_3_AUTHOR(String label_3_author) {
		LABEL_3_AUTHOR = label_3_author;
	}

	public String getLABEL_3_AUTHORID() {
		return LABEL_3_AUTHORID;
	}

	public void setLABEL_3_AUTHORID(String label_3_authorid) {
		LABEL_3_AUTHORID = label_3_authorid;
	}

	public String getLABEL_3_STATUS() {
		return LABEL_3_STATUS;
	}

	public void setLABEL_3_STATUS(String label_3_status) {
		LABEL_3_STATUS = label_3_status;
	}

	public String getPAGENUMBER() {
		return PAGENUMBER;
	}

	public void setPAGENUMBER(String pagenumber) {
		PAGENUMBER = pagenumber;
	}

	public String getPAPERTYPE() {
		return PAPERTYPE;
	}

	public void setPAPERTYPE(String papertype) {
		PAPERTYPE = papertype;
	}

	public String getPAPERTYPEID() {
		return PAPERTYPEID;
	}

	public void setPAPERTYPEID(String papertypeid) {
		PAPERTYPEID = papertypeid;
	}

	public String getPRESSINFO() {
		return PRESSINFO;
	}

	public void setPRESSINFO(String pressinfo) {
		PRESSINFO = pressinfo;
	}

	public String getPRESSINFOID() {
		return PRESSINFOID;
	}

	public void setPRESSINFOID(String pressinfoid) {
		PRESSINFOID = pressinfoid;
	}

	public String getPRINTORDER() {
		return PRINTORDER;
	}

	public void setPRINTORDER(String printorder) {
		PRINTORDER = printorder;
	}

	public String getPUB_DATE() {
		return PUB_DATE;
	}

	public void setPUB_DATE(String pub_date) {
		PUB_DATE = pub_date;
	}

	public String getPUBLISHDATE() {
		return PUBLISHDATE;
	}

	public void setPUBLISHDATE(String publishdate) {
		PUBLISHDATE = publishdate;
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

	public String getQST_APPLICATION() {
		return QST_APPLICATION;
	}

	public void setQST_APPLICATION(String qst_application) {
		QST_APPLICATION = qst_application;
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

	public String getQST_BASE() {
		return QST_BASE;
	}

	public void setQST_BASE(String qst_base) {
		QST_BASE = qst_base;
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

	public String getQST_COMPOSITE() {
		return QST_COMPOSITE;
	}

	public void setQST_COMPOSITE(String qst_composite) {
		QST_COMPOSITE = qst_composite;
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

	public String getQST_OLDINDEX() {
		return QST_OLDINDEX;
	}

	public void setQST_OLDINDEX(String qst_oldindex) {
		QST_OLDINDEX = qst_oldindex;
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

	public String getQST_OVER() {
		return QST_OVER;
	}

	public void setQST_OVER(String qst_over) {
		QST_OVER = qst_over;
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

	public String getQST_ROWS() {
		return QST_ROWS;
	}

	public void setQST_ROWS(String qst_rows) {
		QST_ROWS = qst_rows;
	}

	public String getQST_SCORE() {
		return QST_SCORE;
	}

	public void setQST_SCORE(String qst_score) {
		QST_SCORE = qst_score;
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

	public String getQST_TQID() {
		return QST_TQID;
	}

	public void setQST_TQID(String qst_tqid) {
		QST_TQID = qst_tqid;
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

	public String getQST_UNIT_NO() {
		return QST_UNIT_NO;
	}

	public void setQST_UNIT_NO(String qst_unit_no) {
		QST_UNIT_NO = qst_unit_no;
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

	public String getQST_YAERID() {
		return QST_YAERID;
	}

	public void setQST_YAERID(String qst_yaerid) {
		QST_YAERID = qst_yaerid;
	}

	public String getREVISION() {
		return REVISION;
	}

	public void setREVISION(String revision) {
		REVISION = revision;
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

	public String getSUBQST_NUM() {
		return SUBQST_NUM;
	}

	public void setSUBQST_NUM(String subqst_num) {
		SUBQST_NUM = subqst_num;
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

	public String getSql() {
		String sql = 
			"select top " + DatabaseSql.PAGE_COUNT +  " ANSWER_TIMES,\n" +
			"AVG_SCORE,\n" + 
			"BOOK_ISBN,\n" + 
			"BOOK_NAME,\n" + 
			"CHECK_1_AUTHOR,\n" + 
			"CHECK_1_AUTHORID,\n" + 
			"CHECK_1_STATUS,\n" + 
			"CHECK_2_AUTHOR,\n" + 
			"CHECK_2_AUTHORID,\n" + 
			"CHECK_2_STATUS,\n" + 
			"CHECK_AUTHOR,\n" + 
			"CHECK_AUTHORID,\n" + 
			"CHECK_STATUS,\n" + 
			"COMMENTS,\n" + 
			"DOC_ID,\n" + 
			"DOC_LIBID,\n" + 
			"DOC_QSTTYPE,\n" + 
			"DOC_STATUS,\n" + 
			"DUPLIBNAME,\n" + 
			"ERRORMERGE,\n" + 
			"EXAM_TYPE,\n" + 
			"EXAM_TYPEID,\n" + 
			"GRADE,\n" + 
			"GRADEID,\n" + 
			"ISBN,\n" + 
			"LABEL_1_AUTHOR,\n" + 
			"LABEL_1_AUTHORID,\n" + 
			"LABEL_1_STATUS,\n" + 
			"LABEL_2_AUTHOR,\n" + 
			"LABEL_2_AUTHORID,\n" + 
			"LABEL_2_STATUS,\n" + 
			"LABEL_3_AUTHOR,\n" + 
			"LABEL_3_AUTHORID,\n" + 
			"LABEL_3_STATUS,\n" + 
			"PAGENUMBER,\n" + 
			"PAPERTYPE,\n" + 
			"PAPERTYPEID,\n" + 
			"PRESSINFO,\n" + 
			"PRESSINFOID,\n" + 
			"PRINTORDER,\n" + 
			"PUB_DATE,\n" + 
			"PUBLISHDATE,\n" + 
			"PUTINPERSON,\n" + 
			"PUTINPERSONID,\n" + 
			"QST_ADVISE,\n" + 
			"QST_ANSWERTIME,\n" + 
			"QST_APPLICATION,\n" + 
			"QST_APPLY,\n" + 
			"QST_APPLYID,\n" + 
			"QST_BASE,\n" + 
			"QST_BOOK,\n" + 
			"Qst_CLASSOPERATRPERSON,\n" + 
			"QST_COMPOSITE,\n" + 
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
			"QST_OLDINDEX,\n" + 
			"QST_ONLINETEST,\n" + 
			"QST_ONLINETESTID,\n" + 
			"QST_OOXML,\n" + 
			"QST_OPERATRPERSON,\n" + 
			"QST_OVER,\n" + 
			"QST_QUALITY,\n" + 
			"QST_QUALITYID,\n" + 
			"QST_ROWS,\n" + 
			"QST_SCORE,\n" + 
			"QST_SOURCE,\n" + 
			"QST_SOURCETYPE,\n" + 
			"QST_SOURCETYPEID,\n" + 
			"QST_SUBJECT,\n" + 
			"QST_SUBJECTID,\n" + 
			"QST_TEACH,\n" + 
			"QST_TEACH_CASCADEID,\n" + 
			"QST_TEACHID,\n" + 
			"QST_TEXT,\n" + 
			"QST_TQID,\n" + 
			"QST_TYPE,\n" + 
			"QST_TYPEID,\n" + 
			"QST_UNIT,\n" + 
			"QST_UNIT_NO,\n" + 
			"QST_UNITID,\n" + 
			"QST_USE,\n" + 
			"QST_WORDSCOUNT,\n" + 
			"QST_YAER,\n" + 
			"QST_YAERID,\n" + 
			"REVISION,\n" + 
			"SIGNER,\n" + 
			"SIGNERID,\n" + 
			"SOLVE_PROBLEM,\n" + 
			"SOLVE_PROBLEMID,\n" + 
			"SRC_DOCID,\n" + 
			"SUBQST_NUM,\n" + 
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
			" CONVERT(varchar(100),sys_lastmodified, 120) SYS_LASTMODIFIED,\n" + 
			"SYS_TOPIC from dom_1_doclib d1d where d1d.SYS_DOCUMENTID not in (select top " + DatabaseSql.PAGE_COUNT * this.currentPage + " SYS_DOCUMENTID from dom_1_doclib dit order by dit.SYS_DOCUMENTID) order by d1d.SYS_DOCUMENTID";
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
		String sql = "select count(1) from dom_1_doclib";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		this.currentPage = pageNumber;
	}

}
