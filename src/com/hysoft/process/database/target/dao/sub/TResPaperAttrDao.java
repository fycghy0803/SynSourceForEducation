package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.mysql.model.FzType;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TResPaperAttr;

public class TResPaperAttrDao extends TargetParentDao {
	public TResPaperAttrDao() {
    	this.dataType = "TResPaperAttr";
    }
	
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		FzType ftypeForm = (FzType)typeForm;
		ps.setString(1, ftypeForm.getId());
		ps.setString(2, ftypeForm.getUpid());
		ps.setString(3, ftypeForm.getType());
		ps.setString(4, ftypeForm.getName());
		ps.setString(5, ftypeForm.getTab());
		ps.setString(6, ftypeForm.getStat());
		ps.execute();
	}

	@Override
	public void setTargetDatabaseSql() {
	    this.targetDatabaseSql = new TResPaperAttr();	
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		FzType ftypeForm = (FzType)db;
		try {
			ps.setString(1, ftypeForm.getId());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		FzType ftypeForm = (FzType)db;
		try {
			ps.setString(1, ftypeForm.getId());
			ps.setString(2, ftypeForm.getUpid());
			ps.setString(3, ftypeForm.getType());
			ps.setString(4, ftypeForm.getName());
			ps.setString(5, ftypeForm.getTab());
			ps.setString(6, ftypeForm.getStat());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		setPsExistByKeyId(ps,db);
	}
}
