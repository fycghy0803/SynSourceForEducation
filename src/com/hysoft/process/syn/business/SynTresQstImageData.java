package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.sqlserver2000.dao.DomImageDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TresQstImageDao;
import com.hysoft.process.syn.SynParent;

public class SynTresQstImageData extends SynParent {
	public SynTresQstImageData() throws Exception {
		super();
	}
	
	public SynTresQstImageData(Connection conn) throws Exception {
		super();
		this.conn = conn;
	}

	@Override
	public SelectDao getSourceDao() throws Exception {
		DomImageDao dom1Dao = new DomImageDao();
		dom1Dao.setConnection(this.getConnSqlServer2000());
		return dom1Dao;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		TresQstImageDao tDao = new TresQstImageDao();
		return tDao;
	}
}
