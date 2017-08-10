package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.DomRelQstTeach;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TresQstRelTeach;

public class TresQstRelTeachDao extends TargetParentDao {
	public TresQstRelTeachDao() {
		this.dataType = "TresQstRelTeach";
	}
	
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		DomRelQstTeach qstTeachForm = (DomRelQstTeach)typeForm;
		ps.setString(1, qstTeachForm.getSYS_DOCUMENTID());
		ps.setString(2, qstTeachForm.getQST_SUBJECT());
		ps.setString(3, qstTeachForm.getQST_SUBJECTID());
		ps.setString(4, qstTeachForm.getQST_TEACHID());
		ps.setString(5, qstTeachForm.getQST_KEYID());
		ps.setString(6, qstTeachForm.getQST_DIFICULTYID());
		ps.setString(7, qstTeachForm.getQST_TYPEID());
		ps.setString(8, qstTeachForm.getQST_LEVELID());
		ps.setString(9, qstTeachForm.getQST_QUALITYID());
		ps.setString(10, qstTeachForm.getCLASS_1());
		ps.setString(11, qstTeachForm.getCLASS_2());
		ps.setString(12, qstTeachForm.getCLASS_3());
		ps.setString(13, qstTeachForm.getCLASS_4());
		ps.setString(14, qstTeachForm.getCLASS_5());
		ps.setString(15, qstTeachForm.getCLASS_6());
		ps.setString(16, qstTeachForm.getCLASS_7());
		ps.setString(17, qstTeachForm.getCLASS_8());
		ps.setString(18, qstTeachForm.getCLASS_9());
		ps.setString(19, qstTeachForm.getCLASS_10());
		ps.setString(20, qstTeachForm.getQST_TEACH_CASCADEID());
		ps.setString(21, qstTeachForm.getQST_KEY_CASCADEID());
		ps.setString(22, qstTeachForm.getGRADE());
		ps.setString(23, qstTeachForm.getGRADEID());
		ps.setString(24, qstTeachForm.getSYS_CREATED());
		ps.setString(25, qstTeachForm.getSYS_LASTMODIFIED());
		
		ps.execute();
	}

	@Override
	public void setTargetDatabaseSql() {
		this.targetDatabaseSql = new TresQstRelTeach();
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		DomRelQstTeach qstTeachForm = (DomRelQstTeach)db;
		try {
			ps.setString(1, qstTeachForm.getSYS_DOCUMENTID());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		DomRelQstTeach qstTeachForm = (DomRelQstTeach)db;
		try {
			ps.setString(1, qstTeachForm.getSYS_DOCUMENTID());
			ps.setString(2, qstTeachForm.getSYS_LASTMODIFIED());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		setPsExistByKeyId(ps,db);
	}
}