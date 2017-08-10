package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.sqlserver2000.dao.CategoryOtherDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TResOriginalAttrDao;
import com.hysoft.process.syn.SynParent;

public class SynCategoryOtherData extends SynParent {
	
	public SynCategoryOtherData(Connection conn) throws Exception {
		super();
		this.conn = conn;
	}
	
	@Override
	public SelectDao getSourceDao() throws Exception {
		CategoryOtherDao coDao = new CategoryOtherDao();
		coDao.setConnection(this.getConnSqlServer2000());
		return coDao;
	}
	
	@Override
	public SourceDao getTargetDao() throws Exception {
		TResOriginalAttrDao toDao = new TResOriginalAttrDao();
		return toDao;
	}
}
