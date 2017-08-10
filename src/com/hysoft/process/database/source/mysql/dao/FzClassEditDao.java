package com.hysoft.process.database.source.mysql.dao;

import java.sql.ResultSet;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.SourceParentDao;
import com.hysoft.process.database.source.mysql.model.FzClassEdit;

public class FzClassEditDao extends SourceParentDao {

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		 FzClassEdit form = new FzClassEdit();
		 form.setId(rs.getString("id"));
		 form.setName(rs.getString("name"));
		 form.setPid(rs.getString("pid"));
		 form.setNum(rs.getString("num"));
		 form.setHigh_score(rs.getString("high_score"));
		 form.setHigh_score_uid(rs.getString("high_score_uid"));
		 return form;
	}

	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new FzClassEdit();
	}

	public boolean isSplitPage() {
		return true;
	}
}
