package com.hysoft.process.database.source.sqlserver2000.dao;

import java.sql.ResultSet;
import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.DomRelQstTeach;

public class DomRelQstTeachDao extends Sqlserver2000Dao {

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		DomRelQstTeach dqForm = new DomRelQstTeach();
		dqForm.setAVG_SCORE(rs.getString("AVG_SCORE"));
		dqForm.setBOOK_ISBN(rs.getString("BOOK_ISBN"));
		dqForm.setBOOK_NAME(rs.getString("BOOK_NAME"));
		dqForm.setCLASS_1(rs.getString("CLASS_1"));
		dqForm.setCLASS_10(rs.getString("CLASS_10"));
		dqForm.setCLASS_2(rs.getString("CLASS_2"));
		dqForm.setCLASS_3(rs.getString("CLASS_3"));
		dqForm.setCLASS_4(rs.getString("CLASS_4"));
		dqForm.setCLASS_5(rs.getString("CLASS_5"));
		dqForm.setCLASS_6(rs.getString("CLASS_6"));
		dqForm.setCLASS_7(rs.getString("CLASS_7"));
		dqForm.setCLASS_8(rs.getString("CLASS_8"));
		dqForm.setCLASS_9(rs.getString("CLASS_9"));
		dqForm.setEXAM_TYPE(rs.getString("EXAM_TYPE"));
		dqForm.setEXAM_TYPEID(rs.getString("EXAM_TYPEID"));
		dqForm.setGRADE(rs.getString("GRADE"));
		dqForm.setGRADEID(rs.getString("GRADEID"));
		dqForm.setISBN(rs.getString("ISBN"));
		dqForm.setQST_ADVISE(rs.getString("QST_ADVISE"));
		dqForm.setQST_ANSWERTIME(rs.getString("QST_ANSWERTIME"));
		dqForm.setQST_APPLY(rs.getString("QST_APPLY"));
		dqForm.setQST_APPLYID(rs.getString("QST_APPLYID"));
		dqForm.setQST_BOOK(rs.getString("QST_BOOK"));
		dqForm.setQst_CLASSOPERATRPERSON(rs.getString("Qst_CLASSOPERATRPERSON"));
		dqForm.setQST_CONTENT(rs.getString("QST_CONTENT"));
		dqForm.setQST_DIFICULTY(rs.getString("QST_DIFICULTY"));
		dqForm.setQST_DIFICULTYID(rs.getString("QST_DIFICULTYID"));
		dqForm.setQST_DUPL(rs.getString("QST_DUPL"));
		dqForm.setQST_EXAMPLE(rs.getString("QST_EXAMPLE"));
		dqForm.setQST_EXAMPLEID(rs.getString("QST_EXAMPLEID"));
		dqForm.setQST_IMPORT(rs.getString("QST_IMPORT"));
		dqForm.setQST_KEY(rs.getString("QST_KEY"));
		dqForm.setQST_KEY_CASCADEID(rs.getString("QST_KEY_CASCADEID"));
		dqForm.setQST_KEYID(rs.getString("QST_KEYID"));
		dqForm.setQST_LEVEL(rs.getString("QST_LEVEL"));
		dqForm.setQST_LEVELID(rs.getString("QST_LEVELID"));
		dqForm.setQST_MEMO(rs.getString("QST_MEMO"));
		dqForm.setQST_MODEL(rs.getString("QST_MODEL"));
		dqForm.setQST_MODELID(rs.getString("QST_MODELID"));
		dqForm.setQST_NUMBER(rs.getString("QST_NUMBER"));
		dqForm.setQST_ONLINETEST(rs.getString("QST_ONLINETEST"));
		dqForm.setQST_ONLINETESTID(rs.getString("QST_ONLINETESTID"));
		dqForm.setQST_OOXML(rs.getString("QST_OOXML"));
		dqForm.setQST_OPERATRPERSON(rs.getString("QST_OPERATRPERSON"));
		dqForm.setQST_QUALITY(rs.getString("QST_QUALITY"));
		dqForm.setQST_QUALITYID(rs.getString("QST_QUALITYID"));
		dqForm.setQST_SOURCE(rs.getString("QST_SOURCE"));
		dqForm.setQST_SOURCETYPE(rs.getString("QST_SOURCETYPE"));
		dqForm.setQST_SOURCETYPEID(rs.getString("QST_SOURCETYPEID"));
		dqForm.setQST_SUBJECT(rs.getString("QST_SUBJECT"));
		dqForm.setQST_SUBJECTID(rs.getString("QST_SUBJECTID"));
		dqForm.setQST_TEACH(rs.getString("QST_TEACH"));
		dqForm.setQST_TEACH_CASCADEID(rs.getString("QST_TEACH_CASCADEID"));
		dqForm.setQST_TEACHID(rs.getString("QST_TEACHID"));
		dqForm.setQST_TEXT(rs.getString("QST_TEXT"));
		dqForm.setQST_TYPE(rs.getString("QST_TYPE"));
		dqForm.setQST_TYPEID(rs.getString("QST_TYPEID"));
		dqForm.setQST_UNIT(rs.getString("QST_UNIT"));
		dqForm.setQST_UNITID(rs.getString("QST_UNITID"));
		dqForm.setQST_USE(rs.getString("QST_USE"));
		dqForm.setQST_WORDSCOUNT(rs.getString("QST_WORDSCOUNT"));
		dqForm.setQST_YAER(rs.getString("QST_YAER"));
		dqForm.setSOLVE_PROBLEM(rs.getString("SOLVE_PROBLEM"));
		dqForm.setSOLVE_PROBLEMID(rs.getString("SOLVE_PROBLEMID"));
		dqForm.setSRC_DOCID(rs.getString("SRC_DOCID"));
		dqForm.setSYS_AUTHORS(rs.getString("SYS_AUTHORS"));
		dqForm.setSYS_CREATED(rs.getString("SYS_CREATED"));
		dqForm.setSYS_CURRENTFLOW(rs.getString("SYS_CURRENTFLOW"));
		dqForm.setSYS_CURRENTNODE(rs.getString("SYS_CURRENTNODE"));
		dqForm.setSYS_CURRENTSTATUS(rs.getString("SYS_CURRENTSTATUS"));
		dqForm.setSYS_CURRENTUSERID(rs.getString("SYS_CURRENTUSERID"));
		dqForm.setSYS_CURRENTUSERNAME(rs.getString("SYS_CURRENTUSERNAME"));
		dqForm.setSYS_DELETEFLAG(rs.getString("SYS_DELETEFLAG"));
		dqForm.setSYS_DOCLIBID(rs.getString("SYS_DOCLIBID"));
		dqForm.setSYS_DOCUMENTID(rs.getString("SYS_DOCUMENTID"));
		dqForm.setSYS_FOLDERID(rs.getString("SYS_FOLDERID"));
		dqForm.setSYS_HAVEATTACH(rs.getString("SYS_HAVEATTACH"));
		dqForm.setSYS_HAVERELATION(rs.getString("SYS_HAVERELATION"));
		dqForm.setSYS_ISKEEP(rs.getString("SYS_ISKEEP"));
		dqForm.setSYS_ISLOCKED(rs.getString("SYS_ISLOCKED"));
		dqForm.setSYS_LASTMODIFIED(rs.getString("SYS_LASTMODIFIED"));
		dqForm.setSYS_TOPIC(rs.getString("SYS_TOPIC"));

		return dqForm;
	}

	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new DomRelQstTeach();
	}

	public boolean isSplitPage() {
		return true;
	}
}
