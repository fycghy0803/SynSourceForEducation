package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.mysql.dao.FzTypeDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TResPaperAttrDao;
import com.hysoft.process.syn.SynParent;

public class SynFzTypeData extends SynParent {

	public SynFzTypeData(Connection conn) throws Exception {
		super();
		this.conn = conn;
	}

	@Override
	public SelectDao getSourceDao() throws Exception {
		FzTypeDao ftDao = new FzTypeDao();
		ftDao.setConnection(this.getConnMySql());
		return ftDao;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		TResPaperAttrDao tpDao = new TResPaperAttrDao();
		return tpDao;
	}
}