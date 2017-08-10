package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.sqlserver2000.dao.DomRelQstTeachDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TresQstRelTeachDao;
import com.hysoft.process.syn.SynParent;

public class SynDomRelQstTeachData extends SynParent {
	
	public SynDomRelQstTeachData(Connection conn) throws Exception {
		super();
		this.conn = conn;
	}
	
	@Override
	public SelectDao getSourceDao() throws Exception {
		SelectDao coDao = new DomRelQstTeachDao();
		coDao.setConnection(this.getConnSqlServer2000());
		return coDao;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		SourceDao toDao = new TresQstRelTeachDao();
		return toDao;
	}
}
