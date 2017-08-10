package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.target.dao.TargetParentDao;

public class TCdeGradeDao extends TargetParentDao {
    public TCdeGradeDao() {
    	this.dataType = "TCdeGrade";
    }
	
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		
	}

	@Override
	public void setTargetDatabaseSql() {
		
	}

	public void delete(DatabaseSql db) throws Exception {
		
	}

	public boolean isExist(DatabaseSql db) {
		return false;
	}

	public void updateData(DatabaseSql db) throws Exception {
		
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		
	}
}
