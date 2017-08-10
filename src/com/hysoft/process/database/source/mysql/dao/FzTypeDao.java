package com.hysoft.process.database.source.mysql.dao;

import java.sql.ResultSet;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.SourceParentDao;
import com.hysoft.process.database.source.mysql.model.FzType;

public class FzTypeDao extends SourceParentDao {

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		FzType form = new FzType();
		form.setId(rs.getString("id"));
		form.setUpid(rs.getString("upid"));
		form.setType(rs.getString("type"));
		form.setName(rs.getString("name"));
		form.setTab(rs.getString("tab"));
		form.setStat(rs.getString("stat"));
		return form;
	}

	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new FzType();
	}
	
	public boolean isSplitPage() {
		return true;
	}
}
