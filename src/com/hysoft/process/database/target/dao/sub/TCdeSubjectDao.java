package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.SysSubjectModel;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TCdeSubject;

public class TCdeSubjectDao extends TargetParentDao {
    public TCdeSubjectDao() {
    	this.dataType = "TCdeSubject";
    }
	
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		SysSubjectModel ftypeForm = (SysSubjectModel)typeForm;
		ps.setString(1, ftypeForm.getID());
		ps.setString(2, ftypeForm.getNAME());
		ps.execute();
	}

	@Override
	public void setTargetDatabaseSql() {
	    this.targetDatabaseSql = new TCdeSubject();	
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		SysSubjectModel ftypeForm = (SysSubjectModel)db;
		try {
			ps.setString(1, ftypeForm.getID());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		SysSubjectModel ftypeForm = (SysSubjectModel)db;
		try {
			ps.setString(1, ftypeForm.getID());
			ps.setString(2, ftypeForm.getNAME());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		setPsExistByKeyId(ps,db);
	}
}
