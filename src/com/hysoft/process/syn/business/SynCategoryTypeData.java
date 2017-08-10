package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.sqlserver2000.dao.CategoryTypeDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TCdeQstAttrTypeDao;
import com.hysoft.process.syn.SynParent;

public class SynCategoryTypeData extends SynParent  {

	public SynCategoryTypeData(Connection conn) throws Exception {
		super();
		this.conn = conn;
	}
	
	@Override
	public SelectDao getSourceDao() throws Exception {
		CategoryTypeDao ctDao = new CategoryTypeDao();
		ctDao.setConnection(this.getConnSqlServer2000());
		return ctDao;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		TCdeQstAttrTypeDao ttDao = new TCdeQstAttrTypeDao();
		return ttDao;
	}
}
