package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.DomImage;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TresQstImageModel;

public class TresQstImageDao extends TargetParentDao{
    public TresQstImageDao() {
        this.dataType = "TresQstImage";
    }
    
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		DomImage dbSql = (DomImage)typeForm;
		ps.setString(1, dbSql.getRefId());
    	ps.setString(2, dbSql.getDocId());
    	ps.setString(3, dbSql.getImgLargePath());
    	ps.setString(4, dbSql.getImgHeight());
    	ps.setString(5, dbSql.getImgWidth());
    	ps.setString(6, dbSql.getImgFormat());
    	ps.setString(7, dbSql.getImgCreated());
    	ps.executeUpdate();
	}

	@Override
	public void setTargetDatabaseSql() {
		this.targetDatabaseSql = new TresQstImageModel();
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		DomImage dbSql = (DomImage)db;
		try {
			ps.setString(1, dbSql.getRefId());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		DomImage dbSql = (DomImage)db;
		try {
			ps.setString(1, dbSql.getRefId());
			ps.setString(2, dbSql.getImgLargePath());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		setPsExistByKeyId(ps,db);
	}
}
