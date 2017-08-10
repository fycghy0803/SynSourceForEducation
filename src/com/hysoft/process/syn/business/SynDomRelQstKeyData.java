package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.sqlserver2000.dao.DomRelQstKeyDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TresQstRelKeyDao;
import com.hysoft.process.syn.SynParent;

public class SynDomRelQstKeyData extends SynParent {
	
	public SynDomRelQstKeyData(Connection conn) throws Exception {
		super();
		this.conn = conn;
	}
	
	@Override
	public SelectDao getSourceDao() throws Exception {
		SelectDao coDao = new DomRelQstKeyDao();
		coDao.setConnection(this.getConnSqlServer2000());
		return coDao;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		SourceDao toDao = new TresQstRelKeyDao();
		return toDao;
	}
}
