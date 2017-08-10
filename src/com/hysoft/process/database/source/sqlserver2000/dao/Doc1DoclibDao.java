package com.hysoft.process.database.source.sqlserver2000.dao;

import java.sql.ResultSet;
import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.Doc1Doclib;

public class Doc1DoclibDao extends Sqlserver2000Dao {

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		Doc1Doclib d1libForm = new Doc1Doclib();
		d1libForm.setANSWER_TIMES(rs.getString("ANSWER_TIMES"));
		d1libForm.setAVG_SCORE(rs.getString("AVG_SCORE"));
		d1libForm.setBOOK_ISBN(rs.getString("BOOK_ISBN"));
		d1libForm.setBOOK_NAME(rs.getString("BOOK_NAME"));
		d1libForm.setCHECK_1_AUTHOR(rs.getString("CHECK_1_AUTHOR"));
		d1libForm.setCHECK_1_AUTHORID(rs.getString("CHECK_1_AUTHORID"));
		d1libForm.setCHECK_1_STATUS(rs.getString("CHECK_1_STATUS"));
		d1libForm.setCHECK_2_AUTHOR(rs.getString("CHECK_2_AUTHOR"));
		d1libForm.setCHECK_2_AUTHORID(rs.getString("CHECK_2_AUTHORID"));
		d1libForm.setCHECK_2_STATUS(rs.getString("CHECK_2_STATUS"));
		d1libForm.setCHECK_AUTHOR(rs.getString("CHECK_AUTHOR"));
		d1libForm.setCHECK_AUTHORID(rs.getString("CHECK_AUTHORID"));
		d1libForm.setCHECK_STATUS(rs.getString("CHECK_STATUS"));
		d1libForm.setCOMMENTS(rs.getString("COMMENTS"));
		d1libForm.setDOC_ID(rs.getString("DOC_ID"));
		d1libForm.setDOC_LIBID(rs.getString("DOC_LIBID"));
		d1libForm.setDOC_QSTTYPE(rs.getString("DOC_QSTTYPE"));
		d1libForm.setDOC_STATUS(rs.getString("DOC_STATUS"));
		d1libForm.setDUPLIBNAME(rs.getString("DUPLIBNAME"));
		d1libForm.setERRORMERGE(rs.getString("ERRORMERGE"));
		d1libForm.setEXAM_TYPE(rs.getString("EXAM_TYPE"));
		d1libForm.setEXAM_TYPEID(rs.getString("EXAM_TYPEID"));
		d1libForm.setGRADE(rs.getString("GRADE"));
		d1libForm.setGRADEID(rs.getString("GRADEID"));
		d1libForm.setISBN(rs.getString("ISBN"));
		d1libForm.setLABEL_1_AUTHOR(rs.getString("LABEL_1_AUTHOR"));
		d1libForm.setLABEL_1_AUTHORID(rs.getString("LABEL_1_AUTHORID"));
		d1libForm.setLABEL_1_STATUS(rs.getString("LABEL_1_STATUS"));
		d1libForm.setLABEL_2_AUTHOR(rs.getString("LABEL_2_AUTHOR"));
		d1libForm.setLABEL_2_AUTHORID(rs.getString("LABEL_2_AUTHORID"));
		d1libForm.setLABEL_2_STATUS(rs.getString("LABEL_2_STATUS"));
		d1libForm.setLABEL_3_AUTHOR(rs.getString("LABEL_3_AUTHOR"));
		d1libForm.setLABEL_3_AUTHORID(rs.getString("LABEL_3_AUTHORID"));
		d1libForm.setLABEL_3_STATUS(rs.getString("LABEL_3_STATUS"));
		d1libForm.setPAGENUMBER(rs.getString("PAGENUMBER"));
		d1libForm.setPAPERTYPE(rs.getString("PAPERTYPE"));
		d1libForm.setPAPERTYPEID(rs.getString("PAPERTYPEID"));
		d1libForm.setPRESSINFO(rs.getString("PRESSINFO"));
		d1libForm.setPRESSINFOID(rs.getString("PRESSINFOID"));
		d1libForm.setPRINTORDER(rs.getString("PRINTORDER"));
		d1libForm.setPUB_DATE(rs.getString("PUB_DATE"));
		d1libForm.setPUBLISHDATE(rs.getString("PUBLISHDATE"));
		d1libForm.setPUTINPERSON(rs.getString("PUTINPERSON"));
		d1libForm.setPUTINPERSONID(rs.getString("PUTINPERSONID"));
		d1libForm.setQST_ADVISE(rs.getString("QST_ADVISE"));
		d1libForm.setQST_ANSWERTIME(rs.getString("QST_ANSWERTIME"));
		d1libForm.setQST_APPLICATION(rs.getString("QST_APPLICATION"));
		d1libForm.setQST_APPLY(rs.getString("QST_APPLY"));
		d1libForm.setQST_APPLYID(rs.getString("QST_APPLYID"));
		d1libForm.setQST_BASE(rs.getString("QST_BASE"));
		d1libForm.setQST_BOOK(rs.getString("QST_BOOK"));
		d1libForm.setQst_CLASSOPERATRPERSON(rs.getString("Qst_CLASSOPERATRPERSON"));
		d1libForm.setQST_COMPOSITE(rs.getString("QST_COMPOSITE"));
		d1libForm.setQST_CONTENT(rs.getString("QST_CONTENT"));
		d1libForm.setQST_DIFICULTY(rs.getString("QST_DIFICULTY"));
		d1libForm.setQST_DIFICULTYID(rs.getString("QST_DIFICULTYID"));
		d1libForm.setQST_DUPL(rs.getString("QST_DUPL"));
		d1libForm.setQST_EXAMPLE(rs.getString("QST_EXAMPLE"));
		d1libForm.setQST_EXAMPLEID(rs.getString("QST_EXAMPLEID"));
		d1libForm.setQST_IMPORT(rs.getString("QST_IMPORT"));
		d1libForm.setQST_KEY(rs.getString("QST_KEY"));
		d1libForm.setQST_KEY_CASCADEID(rs.getString("QST_KEY_CASCADEID"));
		d1libForm.setQST_KEYID(rs.getString("QST_KEYID"));
		d1libForm.setQST_LEVEL(rs.getString("QST_LEVEL"));
		d1libForm.setQST_LEVELID(rs.getString("QST_LEVELID"));
		d1libForm.setQST_MEMO(rs.getString("QST_MEMO"));
		d1libForm.setQST_MODEL(rs.getString("QST_MODEL"));
		d1libForm.setQST_MODELID(rs.getString("QST_MODELID"));
		d1libForm.setQST_NUMBER(rs.getString("QST_NUMBER"));
		d1libForm.setQST_OLDINDEX(rs.getString("QST_OLDINDEX"));
		d1libForm.setQST_ONLINETEST(rs.getString("QST_ONLINETEST"));
		d1libForm.setQST_ONLINETESTID(rs.getString("QST_ONLINETESTID"));
		d1libForm.setQST_OOXML(rs.getString("QST_OOXML"));
		d1libForm.setQST_OPERATRPERSON(rs.getString("QST_OPERATRPERSON"));
		d1libForm.setQST_OVER(rs.getString("QST_OVER"));
		d1libForm.setQST_QUALITY(rs.getString("QST_QUALITY"));
		d1libForm.setQST_QUALITYID(rs.getString("QST_QUALITYID"));
		d1libForm.setQST_ROWS(rs.getString("QST_ROWS"));
		d1libForm.setQST_SCORE(rs.getString("QST_SCORE"));
		d1libForm.setQST_SOURCE(rs.getString("QST_SOURCE"));
		d1libForm.setQST_SOURCETYPE(rs.getString("QST_SOURCETYPE"));
		d1libForm.setQST_SOURCETYPEID(rs.getString("QST_SOURCETYPEID"));
		d1libForm.setQST_SUBJECT(rs.getString("QST_SUBJECT"));
		d1libForm.setQST_SUBJECTID(rs.getString("QST_SUBJECTID"));
		d1libForm.setQST_TEACH(rs.getString("QST_TEACH"));
		d1libForm.setQST_TEACH_CASCADEID(rs.getString("QST_TEACH_CASCADEID"));
		d1libForm.setQST_TEACHID(rs.getString("QST_TEACHID"));
		d1libForm.setQST_TEXT(rs.getString("QST_TEXT"));
		d1libForm.setQST_TQID(rs.getString("QST_TQID"));
		d1libForm.setQST_TYPE(rs.getString("QST_TYPE"));
		d1libForm.setQST_TYPEID(rs.getString("QST_TYPEID"));
		d1libForm.setQST_UNIT(rs.getString("QST_UNIT"));
		d1libForm.setQST_UNIT_NO(rs.getString("QST_UNIT_NO"));
		d1libForm.setQST_UNITID(rs.getString("QST_UNITID"));
		d1libForm.setQST_USE(rs.getString("QST_USE"));
		d1libForm.setQST_WORDSCOUNT(rs.getString("QST_WORDSCOUNT"));
		d1libForm.setQST_YAER(rs.getString("QST_YAER"));
		d1libForm.setQST_YAERID(rs.getString("QST_YAERID"));
		d1libForm.setREVISION(rs.getString("REVISION"));
		d1libForm.setSIGNER(rs.getString("SIGNER"));
		d1libForm.setSIGNERID(rs.getString("SIGNERID"));
		d1libForm.setSOLVE_PROBLEM(rs.getString("SOLVE_PROBLEM"));
		d1libForm.setSOLVE_PROBLEMID(rs.getString("SOLVE_PROBLEMID"));
		d1libForm.setSRC_DOCID(rs.getString("SRC_DOCID"));
		d1libForm.setSUBQST_NUM(rs.getString("SUBQST_NUM"));
		d1libForm.setSYS_AUTHORS(rs.getString("SYS_AUTHORS"));
		d1libForm.setSYS_CREATED(rs.getString("SYS_CREATED"));
		d1libForm.setSYS_CURRENTFLOW(rs.getString("SYS_CURRENTFLOW"));
		d1libForm.setSYS_CURRENTNODE(rs.getString("SYS_CURRENTNODE"));
		d1libForm.setSYS_CURRENTSTATUS(rs.getString("SYS_CURRENTSTATUS"));
		d1libForm.setSYS_CURRENTUSERID(rs.getString("SYS_CURRENTUSERID"));
		d1libForm.setSYS_CURRENTUSERNAME(rs.getString("SYS_CURRENTUSERNAME"));
		d1libForm.setSYS_DELETEFLAG(rs.getString("SYS_DELETEFLAG"));
		d1libForm.setSYS_DOCLIBID(rs.getString("SYS_DOCLIBID"));
		d1libForm.setSYS_DOCUMENTID(rs.getString("SYS_DOCUMENTID"));
		d1libForm.setSYS_FOLDERID(rs.getString("SYS_FOLDERID"));
		d1libForm.setSYS_HAVEATTACH(rs.getString("SYS_HAVEATTACH"));
		d1libForm.setSYS_HAVERELATION(rs.getString("SYS_HAVERELATION"));
		d1libForm.setSYS_ISKEEP(rs.getString("SYS_ISKEEP"));
		d1libForm.setSYS_ISLOCKED(rs.getString("SYS_ISLOCKED"));
		d1libForm.setSYS_LASTMODIFIED(rs.getString("SYS_LASTMODIFIED"));
		d1libForm.setSYS_TOPIC(rs.getString("SYS_TOPIC"));
		return d1libForm;
	}

	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new Doc1Doclib();
	}

	public boolean isSplitPage() {
		return true;
	}
}
