package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.mysql.dao.FzSubjectDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TresPaperDao;
import com.hysoft.process.syn.SynParent;
import com.hysoft.util.forms.DatabaseForm;

public class SynTresPaperData extends SynParent {

	public SynTresPaperData() throws Exception {
		super();
	}

	public SynTresPaperData(Connection conn,Connection connAn) throws Exception {
		super();
		this.conn = conn;
		this.connAn = connAn;
	}
	
	@Override
	public SelectDao getSourceDao() throws Exception {
		FzSubjectDao fsDao = new FzSubjectDao();
		fsDao.setConnection(this.getConnMySql());
		fsDao.setConnAn(this.getConnSqlServer2000());
		return fsDao;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		TresPaperDao tDao = new TresPaperDao();
		return tDao;
	}

	@Override
	protected boolean allowSynFlag(DatabaseForm df) {
		if(df.getSynContent().indexOf("testPager") == -1) {
			return false;
		}
		return true;
	}
}
