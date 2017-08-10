package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.CategoryOther;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TResOriginalAttr;

public class TResOriginalAttrDao extends TargetParentDao {
	public TResOriginalAttrDao() {
    	this.dataType = "TResOriginalAttr";
    }
	
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		CategoryOther trForm = (CategoryOther)typeForm;
		ps.setString(1, trForm.getENTRY_ID());
		ps.setString(2, trForm.getWT_TYPE());
		ps.setString(3, trForm.getPARENT_ID());
		ps.setString(4, trForm.getENTRY_LEVEL());
		ps.setString(5, trForm.getENTRY_NAME());
		ps.setString(6, trForm.getENTRY_CASCADE_ID());
		ps.setString(7, trForm.getENTRY_CASCADE_NAME());
		ps.setString(8, trForm.getENTRY_DISP_ORDER());
		ps.setString(9, trForm.getENTRY_DELETE_FLAG());
		ps.setString(10, trForm.getLAST_MODI_DATE());
		ps.execute();
	}

	@Override
	public void setTargetDatabaseSql() {
        this.targetDatabaseSql = new TResOriginalAttr();
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		CategoryOther trForm = (CategoryOther)db;
		try {
			ps.setString(1, trForm.getENTRY_ID());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		CategoryOther trForm = (CategoryOther)db;
		try {
			ps.setString(1, trForm.getENTRY_ID());
			ps.setString(2, trForm.getWT_TYPE());
			ps.setString(3, trForm.getPARENT_ID());
			ps.setString(4, trForm.getENTRY_LEVEL());
			ps.setString(5, trForm.getENTRY_NAME());
			ps.setString(6, trForm.getENTRY_CASCADE_ID());
			ps.setString(7, trForm.getENTRY_CASCADE_NAME());
			ps.setString(8, trForm.getENTRY_DISP_ORDER());
			ps.setString(9, trForm.getENTRY_DELETE_FLAG());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		CategoryOther trForm = (CategoryOther)db;
		try {
			ps.setString(1, trForm.getENTRY_ID());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
