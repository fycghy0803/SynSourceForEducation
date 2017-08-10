package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.Doc1Doclib;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TresQuestion;

public class TresQuestionDao extends TargetParentDao {

	public TresQuestionDao() {
		this.dataType = "TresQuestion";
	}
	
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		Doc1Doclib dom1Form = (Doc1Doclib)typeForm;
		ps.setString(1, dom1Form.getSYS_DOCUMENTID());
		ps.setString(2, dom1Form.getQST_CONTENT());
		ps.setString(3, dom1Form.getQST_TEXT());
		ps.setString(4, null); //title
		ps.setString(5, null); //QST_RESULT
		ps.setString(6, null); //QST_ANALYSIS
		ps.setString(7, dom1Form.getQST_QUALITYID()); 
		ps.setString(8, dom1Form.getQST_DIFICULTYID());
		ps.setString(9, dom1Form.getQST_YAER());
		ps.setString(10, dom1Form.getQST_SUBJECTID());
		ps.setString(11, dom1Form.getQST_TEACHID());
		ps.setString(12, dom1Form.getQST_TEACH_CASCADEID());
		ps.setString(13, dom1Form.getQST_KEYID());
		ps.setString(14, dom1Form.getQST_KEY_CASCADEID());
		ps.setString(15, dom1Form.getSYS_DELETEFLAG());
		ps.setString(16, dom1Form.getSYS_CREATED());
		ps.setString(17, dom1Form.getSYS_LASTMODIFIED());
		ps.setString(18, dom1Form.getSYS_LASTMODIFIED());
		ps.setString(19, dom1Form.getDOC_ID());
		ps.setString(20, dom1Form.getQST_TYPEID());
		ps.execute();
	}

	@Override
	public void setTargetDatabaseSql() {
       this.targetDatabaseSql = new TresQuestion();
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		Doc1Doclib dom1Form = (Doc1Doclib)db;
		try {
			ps.setString(1, dom1Form.getSYS_DOCUMENTID());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		Doc1Doclib dom1Form = (Doc1Doclib)db;
		try {
			ps.setString(1, dom1Form.getSYS_DOCUMENTID());
			ps.setString(2, dom1Form.getSYS_LASTMODIFIED());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		setPsExistByKeyId(ps,db);
	}
}
