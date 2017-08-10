package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.sqlserver2000.dao.SysSubjectDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TCdeSubjectDao;
import com.hysoft.process.syn.SynParent;

public class SynTCdeSubjectData extends SynParent  {

	public SynTCdeSubjectData(Connection conn) throws Exception {
		super();
		this.conn = conn;
	}
	
	@Override
	public SelectDao getSourceDao() throws Exception {
		SysSubjectDao ctDao = new SysSubjectDao();
		ctDao.setConnection(this.getConnSqlServer2000());
		return ctDao;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		TCdeSubjectDao ttDao = new TCdeSubjectDao();
		return ttDao;
	}
}
