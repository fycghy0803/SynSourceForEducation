package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.mysql.model.FzSubject;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TresPaperRelTeach;

public class TresPaperRelTeachDao extends TargetParentDao {

	public TresPaperRelTeachDao() {
    	this.dataType = "TresPaperRelTeach";
    }
	
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		FzSubject fzSubject = (FzSubject)typeForm;
		ps.setString(1, fzSubject.getPid());
		ps.setString(2, fzSubject.getGaostu_pid());
		ps.setString(3, fzSubject.getLianji1());
		ps.setString(4, fzSubject.getLianji2());
		ps.setString(5, fzSubject.getLianji3());
		ps.setString(6, fzSubject.getLianji4());
		ps.setString(7, fzSubject.getLianji5());
		ps.setString(8, fzSubject.getLianji6());
		ps.setString(9, fzSubject.getLianji7());
		ps.setString(10, fzSubject.getLianji8());
		ps.setString(11, fzSubject.getLianji9());
		ps.setString(12, fzSubject.getLianji10());
		ps.execute();
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		FzSubject fzSubject = (FzSubject)db;
		try {
			ps.setString(1, fzSubject.getPid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		setPsExistByKeyId(ps,db);
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		setPsExistByKeyId(ps,db);
	}

	@Override
	public void setTargetDatabaseSql() {
		this.targetDatabaseSql = new TresPaperRelTeach();
	}
}
