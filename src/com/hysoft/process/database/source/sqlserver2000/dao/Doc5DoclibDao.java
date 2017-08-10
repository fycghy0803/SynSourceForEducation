package com.hysoft.process.database.source.sqlserver2000.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.Doc5Doclib;

public class Doc5DoclibDao extends Sqlserver2000Dao {

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		Doc5Doclib d5libForm = new Doc5Doclib();
		setFormData(d5libForm,rs);
		return d5libForm;
	}

	public void setFormData(Doc5Doclib d5libForm,ResultSet rs)  throws Exception{
		d5libForm.setCLASSNUM(rs.getString("CLASSNUM"));
		d5libForm.setDOC_ID(rs.getString("DOC_ID"));
		d5libForm.setDOC_LIBID(rs.getString("DOC_LIBID"));
		d5libForm.setDOC_PRODUCT(rs.getString("DOC_PRODUCT"));
		d5libForm.setDOC_PRODUCTID(rs.getString("DOC_PRODUCTID"));
		d5libForm.setDOC_PRODUCTLIBID(rs.getString("DOC_PRODUCTLIBID"));
		d5libForm.setEXAMTYPE(rs.getString("EXAMTYPE"));
		d5libForm.setGRADE(rs.getString("GRADE"));
		d5libForm.setOLD_PAPER_CONTENT(rs.getString("OLD_PAPER_CONTENT"));
		d5libForm.setPAPER_ANSWERTIME(rs.getString("PAPER_ANSWERTIME"));
		d5libForm.setPAPER_AREA(rs.getString("PAPER_AREA"));
		d5libForm.setPAPER_AREAID(rs.getString("PAPER_AREAID"));
		d5libForm.setPAPER_CONTENT(rs.getString("PAPER_CONTENT"));
		d5libForm.setPAPER_EXPORTFLAG(rs.getString("PAPER_EXPORTFLAG"));
		d5libForm.setPAPER_GRADE(rs.getString("PAPER_GRADE"));
		d5libForm.setPAPER_GRADEID(rs.getString("PAPER_GRADEID"));
		d5libForm.setPAPER_ISBN(rs.getString("PAPER_ISBN"));
		d5libForm.setPAPER_KIND(rs.getString("PAPER_KIND"));
		d5libForm.setPAPER_KINDID(rs.getString("PAPER_KINDID"));
		d5libForm.setPAPER_MEMO(rs.getString("PAPER_MEMO"));
		d5libForm.setPAPER_QST_ISUSE(rs.getString("PAPER_QST_ISUSE"));
		d5libForm.setPAPER_QST_ISUSEID(rs.getString("PAPER_QST_ISUSEID"));
		d5libForm.setPAPER_SCHOOL(rs.getString("PAPER_SCHOOL"));
		d5libForm.setPAPER_SCOPE(rs.getString("PAPER_SCOPE"));
		d5libForm.setPAPER_SCOPEID(rs.getString("PAPER_SCOPEID"));
		d5libForm.setPAPER_SCORE(rs.getString("PAPER_SCORE"));
		d5libForm.setPAPER_SOURCE(rs.getString("PAPER_SOURCE"));
		d5libForm.setPAPER_STATUS(rs.getString("PAPER_STATUS"));
		d5libForm.setPAPER_SUBJECT(rs.getString("PAPER_SUBJECT"));
		d5libForm.setPAPER_SUBJECTID(rs.getString("PAPER_SUBJECTID"));
		d5libForm.setPAPER_TEACH(rs.getString("PAPER_TEACH"));
		d5libForm.setPAPER_TEACHER(rs.getString("PAPER_TEACHER"));
		d5libForm.setPAPER_TEACHID(rs.getString("PAPER_TEACHID"));
		d5libForm.setPAPER_TYPE(rs.getString("PAPER_TYPE"));
		d5libForm.setPAPER_YEAR(rs.getString("PAPER_YEAR"));
		d5libForm.setPAPER_YEARID(rs.getString("PAPER_YEARID"));
		d5libForm.setPUBLISHER(rs.getString("PUBLISHER"));
		d5libForm.setPUBLISHERID(rs.getString("PUBLISHERID"));
		d5libForm.setQST_COUNT(rs.getString("QST_COUNT"));
		d5libForm.setQSTIDS(rs.getString("QSTIDS"));
		d5libForm.setSCHOOL(rs.getString("SCHOOL"));
		d5libForm.setSIGN_PROPID(rs.getString("SIGN_PROPID"));
		d5libForm.setSRC_DOCID(rs.getString("SRC_DOCID"));
		d5libForm.setSTYLEID(rs.getString("STYLEID"));
		d5libForm.setSYS_AUTHORS(rs.getString("SYS_AUTHORS"));
		d5libForm.setSYS_CREATED(rs.getString("SYS_CREATED"));
		d5libForm.setSYS_CURRENTFLOW(rs.getString("SYS_CURRENTFLOW"));
		d5libForm.setSYS_CURRENTNODE(rs.getString("SYS_CURRENTNODE"));
		d5libForm.setSYS_CURRENTSTATUS(rs.getString("SYS_CURRENTSTATUS"));
		d5libForm.setSYS_CURRENTUSERID(rs.getString("SYS_CURRENTUSERID"));
		d5libForm.setSYS_CURRENTUSERNAME(rs.getString("SYS_CURRENTUSERNAME"));
		d5libForm.setSYS_DELETEFLAG(rs.getString("SYS_DELETEFLAG"));
		d5libForm.setSYS_DOCLIBID(rs.getString("SYS_DOCLIBID"));
		d5libForm.setSYS_DOCUMENTID(rs.getString("SYS_DOCUMENTID"));
		d5libForm.setSYS_FOLDERID(rs.getString("SYS_FOLDERID"));
		d5libForm.setSYS_HAVEATTACH(rs.getString("SYS_HAVEATTACH"));
		d5libForm.setSYS_HAVERELATION(rs.getString("SYS_HAVERELATION"));
		d5libForm.setSYS_ISKEEP(rs.getString("SYS_ISKEEP"));
		d5libForm.setSYS_ISLOCKED(rs.getString("SYS_ISLOCKED"));
		d5libForm.setSYS_LASTMODIFIED(rs.getString("SYS_LASTMODIFIED"));
		d5libForm.setSYS_TOPIC(rs.getString("SYS_TOPIC"));
		d5libForm.setVERSION(rs.getString("VERSION"));
		d5libForm.setVERSIONID(rs.getString("VERSIONID"));
		d5libForm.setVISIONPROPERTY(rs.getString("VISIONPROPERTY"));
	}
	
	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new Doc5Doclib();
	}

	public void setSingleFormById(String pid,Doc5Doclib d5libForm) {
		Doc5Doclib form = new Doc5Doclib();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement(form.getSqlByPid());
			ps.setString(1, pid);
			rs = ps.executeQuery();
			if(rs.next()) {
				setFormData(d5libForm,rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
			loger.error(e);
		}finally {
			if(null != rs )try{rs.close();}catch(Exception e){}
			if(null != ps )try{ps.close();}catch(Exception e){}
		}
	}

	public boolean isSplitPage() {
		return false;
	}	
}
