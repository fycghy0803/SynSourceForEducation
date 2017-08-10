package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.CategoryType;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TCdeQstAttrType;

public class TCdeQstAttrTypeDao extends TargetParentDao{
	public TCdeQstAttrTypeDao() {
	    	this.dataType = "TCdeQstAttrType";
	}
	 
	@Override
	public void insertDataByPreMent(PreparedStatement ps,DatabaseSql cTypeForm) throws Exception {
		CategoryType ctForm = (CategoryType)cTypeForm;
		ps.setString(1,ctForm.getWT_TYPE());
		ps.setString(2,ctForm.getWT_NAME());
		ps.setString(3, ctForm.getWT_ORDER());
		ps.execute();
	}

	@Override
	public void setTargetDatabaseSql() {
		this.targetDatabaseSql = new TCdeQstAttrType();
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		CategoryType ctForm = (CategoryType)db;
		try {
			ps.setString(1, ctForm.getWT_TYPE());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		CategoryType ctForm = (CategoryType)db;
		try {
			ps.setString(1, ctForm.getWT_TYPE());
			ps.setString(2, ctForm.getWT_NAME());
			ps.setString(3, ctForm.getWT_ORDER());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		CategoryType ctForm = (CategoryType)db;
		try {
			ps.setInt(1, Integer.valueOf(ctForm.getWT_TYPE()).intValue());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
