package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.mysql.model.FzMathmlImg;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TresQstMathmlIMgModel;

public class TresQstMathmlIMgDao extends TargetParentDao{
    
    public TresQstMathmlIMgDao() {
       this.dataType = "TresQstMathmlIMg";
    }
    
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		FzMathmlImg dbSql = (FzMathmlImg)typeForm;
		ps.setString(1, dbSql.getHash());
    	ps.setString(2, dbSql.getDocumentid());
    	ps.setString(3, dbSql.getFilepath());
    	ps.executeUpdate();
	}

	@Override
	public void setTargetDatabaseSql() {
	    this.targetDatabaseSql = new TresQstMathmlIMgModel();
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		FzMathmlImg dbSql = (FzMathmlImg)db;
    	try {
			ps.setString(1, dbSql.getHash());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		FzMathmlImg dbSql = (FzMathmlImg)db;
		try {
			ps.setString(1, dbSql.getHash());
			ps.setString(2, dbSql.getFilepath());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		setPsExistByKeyId(ps,db);
	}
}
