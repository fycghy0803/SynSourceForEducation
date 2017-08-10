package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.mysql.dao.FzSubjectDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TresPaperRelTeachDao;
import com.hysoft.process.syn.SynParent;

public class SynTresPaperRelTeach extends SynParent {
	public SynTresPaperRelTeach() throws Exception {
		super();
	}
	
	public SynTresPaperRelTeach(Connection conn) throws Exception {
		super();
		this.conn = conn;
	}

	public SynTresPaperRelTeach(Connection conn,Connection connAn) throws Exception {
		super();
		this.conn = conn;
		this.connAn = connAn;
	}
	
	@Override
	public SelectDao getSourceDao() throws Exception {
		FzSubjectDao ftDao = new FzSubjectDao();
		ftDao.setConnection(this.getConnMySql());
		ftDao.setConnAn(this.getConnSqlServer2000());
		return ftDao;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		TresPaperRelTeachDao tpDao = new TresPaperRelTeachDao();
		return tpDao;
	}
}
