package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.DomRelQstKey;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TresQstRelKey;

public class TresQstRelKeyDao extends TargetParentDao{

	public TresQstRelKeyDao() {
		this.dataType = "TresQstRelKey";
	}
	
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		DomRelQstKey domKeyForm = (DomRelQstKey)typeForm;
		ps.setString(1, domKeyForm.getSYS_DOCUMENTID());
		ps.setString(2, domKeyForm.getQST_SUBJECT());
		ps.setString(3, domKeyForm.getQST_SUBJECTID());
		ps.setString(4, domKeyForm.getQST_TEACHID());
		ps.setString(5, domKeyForm.getQST_KEYID());
		ps.setString(6, domKeyForm.getQST_DIFICULTYID());
		ps.setString(7, domKeyForm.getQST_TYPEID());
		ps.setString(8, domKeyForm.getQST_LEVELID());
		ps.setString(9, domKeyForm.getQST_QUALITYID());
		ps.setString(10, domKeyForm.getCLASS_1());
		ps.setString(11, domKeyForm.getCLASS_2());
		ps.setString(12, domKeyForm.getCLASS_3());
		ps.setString(13, domKeyForm.getCLASS_4());
		ps.setString(14, domKeyForm.getCLASS_5());
		ps.setString(15, domKeyForm.getCLASS_6());
		ps.setString(16, domKeyForm.getCLASS_7());
		ps.setString(17, domKeyForm.getCLASS_8());
		ps.setString(18, domKeyForm.getCLASS_9());
		ps.setString(19, domKeyForm.getCLASS_10());
		
		ps.setString(20, domKeyForm.getQST_TEACH_CASCADEID());
		ps.setString(21, domKeyForm.getQST_KEY_CASCADEID());
		ps.setString(22, domKeyForm.getQST_YAER());
		ps.setString(23, domKeyForm.getGRADE());
		ps.setString(24, domKeyForm.getGRADEID());
		ps.setString(25, domKeyForm.getQST_MODEL());
		ps.setString(26, domKeyForm.getQST_MODELID());
		ps.setString(27, domKeyForm.getQST_UNIT());
		ps.setString(28, domKeyForm.getQST_UNITID());
		ps.setString(29, domKeyForm.getSYS_CREATED());
		ps.setString(30, domKeyForm.getSYS_LASTMODIFIED());
		
		ps.execute();
	}

	@Override
	public void setTargetDatabaseSql() {
	  this.targetDatabaseSql = new TresQstRelKey();	
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		DomRelQstKey domKeyForm = (DomRelQstKey)db;
		try {
			ps.setString(1, domKeyForm.getSYS_DOCUMENTID());
			ps.setString(2, domKeyForm.getQST_KEYID());
			ps.setString(3, domKeyForm.getCLASS_1());
			ps.setString(4, domKeyForm.getCLASS_2());
			ps.setString(5, domKeyForm.getCLASS_3());
			ps.setString(6, domKeyForm.getCLASS_4());
			ps.setString(7, domKeyForm.getCLASS_5());
			ps.setString(8, domKeyForm.getCLASS_6());
			ps.setString(9, domKeyForm.getCLASS_7());
			ps.setString(10,domKeyForm.getCLASS_8());
			ps.setString(11,domKeyForm.getCLASS_9());
			ps.setString(12,domKeyForm.getCLASS_10());
		} catch (SQLException e) {
			e.printStackTrace();
			loger.error(e);
		}	
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		DomRelQstKey domKeyForm = (DomRelQstKey)db;
		try {
			ps.setString(1, domKeyForm.getSYS_DOCUMENTID());
			ps.setString(2, domKeyForm.getSYS_LASTMODIFIED());
			ps.setString(3, domKeyForm.getQST_KEYID());
			ps.setString(4, domKeyForm.getCLASS_1());
			ps.setString(5, domKeyForm.getCLASS_2());
			ps.setString(6, domKeyForm.getCLASS_3());
			ps.setString(7, domKeyForm.getCLASS_4());
			ps.setString(8, domKeyForm.getCLASS_5());
			ps.setString(9, domKeyForm.getCLASS_6());
			ps.setString(10, domKeyForm.getCLASS_7());
			ps.setString(11, domKeyForm.getCLASS_8());
			ps.setString(12, domKeyForm.getCLASS_9());
			ps.setString(13, domKeyForm.getCLASS_10());
		} catch (SQLException e) {
			loger.error(e);
		}	
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		setPsExistByKeyId(ps,db);
	}
}
