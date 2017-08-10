package com.hysoft.process.database.source.sqlserver2000.dao;

import java.sql.ResultSet;
import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.DomRelQstKey;

public class DomRelQstKeyDao extends Sqlserver2000Dao {

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		DomRelQstKey doKeyForm = new DomRelQstKey();
		doKeyForm.setAVG_SCORE(rs.getString("AVG_SCORE"));
		doKeyForm.setBOOK_ISBN(rs.getString("BOOK_ISBN"));
		doKeyForm.setBOOK_NAME(rs.getString("BOOK_NAME"));
		doKeyForm.setCLASS_1(rs.getString("CLASS_1"));
		doKeyForm.setCLASS_10(rs.getString("CLASS_10"));
		doKeyForm.setCLASS_2(rs.getString("CLASS_2"));
		doKeyForm.setCLASS_3(rs.getString("CLASS_3"));
		doKeyForm.setCLASS_4(rs.getString("CLASS_4"));
		doKeyForm.setCLASS_5(rs.getString("CLASS_5"));
		doKeyForm.setCLASS_6(rs.getString("CLASS_6"));
		doKeyForm.setCLASS_7(rs.getString("CLASS_7"));
		doKeyForm.setCLASS_8(rs.getString("CLASS_8"));
		doKeyForm.setCLASS_9(rs.getString("CLASS_9"));
		doKeyForm.setEXAM_TYPE(rs.getString("EXAM_TYPE"));
		doKeyForm.setEXAM_TYPEID(rs.getString("EXAM_TYPEID"));
		doKeyForm.setGRADE(rs.getString("GRADE"));
		doKeyForm.setGRADEID(rs.getString("GRADEID"));
		doKeyForm.setISBN(rs.getString("ISBN"));
		doKeyForm.setPUTINPERSON(rs.getString("PUTINPERSON"));
		doKeyForm.setPUTINPERSONID(rs.getString("PUTINPERSONID"));
		doKeyForm.setQST_ADVISE(rs.getString("QST_ADVISE"));
		doKeyForm.setQST_ANSWERTIME(rs.getString("QST_ANSWERTIME"));
		doKeyForm.setQST_APPLY(rs.getString("QST_APPLY"));
		doKeyForm.setQST_APPLYID(rs.getString("QST_APPLYID"));
		doKeyForm.setQST_BOOK(rs.getString("QST_BOOK"));
		doKeyForm.setQst_CLASSOPERATRPERSON(rs.getString("Qst_CLASSOPERATRPERSON"));
		doKeyForm.setQST_CONTENT(rs.getString("QST_CONTENT"));
		doKeyForm.setQST_DIFICULTY(rs.getString("QST_DIFICULTY"));
		doKeyForm.setQST_DIFICULTYID(rs.getString("QST_DIFICULTYID"));
		doKeyForm.setQST_DUPL(rs.getString("QST_DUPL"));
		doKeyForm.setQST_EXAMPLE(rs.getString("QST_EXAMPLE"));
		doKeyForm.setQST_EXAMPLEID(rs.getString("QST_EXAMPLEID"));
		doKeyForm.setQST_IMPORT(rs.getString("QST_IMPORT"));
		doKeyForm.setQST_KEY(rs.getString("QST_KEY"));
		doKeyForm.setQST_KEY_CASCADEID(rs.getString("QST_KEY_CASCADEID"));
		doKeyForm.setQST_KEYID(rs.getString("QST_KEYID"));
		doKeyForm.setQST_LEVEL(rs.getString("QST_LEVEL"));
		doKeyForm.setQST_LEVELID(rs.getString("QST_LEVELID"));
		doKeyForm.setQST_MEMO(rs.getString("QST_MEMO"));
		doKeyForm.setQST_MODEL(rs.getString("QST_MODEL"));
		doKeyForm.setQST_MODELID(rs.getString("QST_MODELID"));
		doKeyForm.setQST_NUMBER(rs.getString("QST_NUMBER"));
		doKeyForm.setQST_ONLINETEST(rs.getString("QST_ONLINETEST"));
		doKeyForm.setQST_ONLINETESTID(rs.getString("QST_ONLINETESTID"));
		doKeyForm.setQST_OOXML(rs.getString("QST_OOXML"));
		doKeyForm.setQST_OPERATRPERSON(rs.getString("QST_OPERATRPERSON"));
		doKeyForm.setQST_QUALITY(rs.getString("QST_QUALITY"));
		doKeyForm.setQST_QUALITYID(rs.getString("QST_QUALITYID"));
		doKeyForm.setQST_SOURCE(rs.getString("QST_SOURCE"));
		doKeyForm.setQST_SOURCETYPE(rs.getString("QST_SOURCETYPE"));
		doKeyForm.setQST_SOURCETYPEID(rs.getString("QST_SOURCETYPEID"));
		doKeyForm.setQST_SUBJECT(rs.getString("QST_SUBJECT"));
		doKeyForm.setQST_SUBJECTID(rs.getString("QST_SUBJECTID"));
		doKeyForm.setQST_TEACH(rs.getString("QST_TEACH"));
		doKeyForm.setQST_TEACH_CASCADEID(rs.getString("QST_TEACH_CASCADEID"));
		doKeyForm.setQST_TEACHID(rs.getString("QST_TEACHID"));
		doKeyForm.setQST_TEXT(rs.getString("QST_TEXT"));
		doKeyForm.setQST_TYPE(rs.getString("QST_TYPE"));
		doKeyForm.setQST_TYPEID(rs.getString("QST_TYPEID"));
		doKeyForm.setQST_UNIT(rs.getString("QST_UNIT"));
		doKeyForm.setQST_UNITID(rs.getString("QST_UNITID"));
		doKeyForm.setQST_USE(rs.getString("QST_USE"));
		doKeyForm.setQST_WORDSCOUNT(rs.getString("QST_WORDSCOUNT"));
		doKeyForm.setQST_YAER(rs.getString("QST_YAER"));
		doKeyForm.setSIGNER(rs.getString("SIGNER"));
		doKeyForm.setSIGNERID(rs.getString("SIGNERID"));
		doKeyForm.setSOLVE_PROBLEM(rs.getString("SOLVE_PROBLEM"));
		doKeyForm.setSOLVE_PROBLEMID(rs.getString("SOLVE_PROBLEMID"));
		doKeyForm.setSRC_DOCID(rs.getString("SRC_DOCID"));
		doKeyForm.setSYS_AUTHORS(rs.getString("SYS_AUTHORS"));
		doKeyForm.setSYS_CREATED(rs.getString("SYS_CREATED"));
		doKeyForm.setSYS_CURRENTFLOW(rs.getString("SYS_CURRENTFLOW"));
		doKeyForm.setSYS_CURRENTNODE(rs.getString("SYS_CURRENTNODE"));
		doKeyForm.setSYS_CURRENTSTATUS(rs.getString("SYS_CURRENTSTATUS"));
		doKeyForm.setSYS_CURRENTUSERID(rs.getString("SYS_CURRENTUSERID"));
		doKeyForm.setSYS_CURRENTUSERNAME(rs.getString("SYS_CURRENTUSERNAME"));
		doKeyForm.setSYS_DELETEFLAG(rs.getString("SYS_DELETEFLAG"));
		doKeyForm.setSYS_DOCLIBID(rs.getString("SYS_DOCLIBID"));
		doKeyForm.setSYS_DOCUMENTID(rs.getString("SYS_DOCUMENTID"));
		doKeyForm.setSYS_FOLDERID(rs.getString("SYS_FOLDERID"));
		doKeyForm.setSYS_HAVEATTACH(rs.getString("SYS_HAVEATTACH"));
		doKeyForm.setSYS_HAVERELATION(rs.getString("SYS_HAVERELATION"));
		doKeyForm.setSYS_ISKEEP(rs.getString("SYS_ISKEEP"));
		doKeyForm.setSYS_ISLOCKED(rs.getString("SYS_ISLOCKED"));
		doKeyForm.setSYS_LASTMODIFIED(rs.getString("SYS_LASTMODIFIED"));
		doKeyForm.setSYS_TOPIC(rs.getString("SYS_TOPIC"));

		return doKeyForm;
	}

	@Override
	public void setDatabaseSql() throws Exception {
         this.databaseSql = new DomRelQstKey();
	}

	public boolean isSplitPage() {
		return true;
	}
}
