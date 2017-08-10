package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.mysql.dao.FzMathmlImgDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TresQstMathmlIMgDao;
import com.hysoft.process.syn.SynParent;

public class SynTresQstMathmlIMgData extends SynParent {

	public SynTresQstMathmlIMgData() throws Exception {
		super();
	}
	
	public SynTresQstMathmlIMgData(Connection conn) throws Exception {
		super();
		this.conn = conn;
	}

	
	@Override
	public SelectDao getSourceDao() throws Exception {
		FzMathmlImgDao ftDao = new FzMathmlImgDao();
		ftDao.setConnection(this.getConnMySql());
		return ftDao;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		TresQstMathmlIMgDao tpDao = new TresQstMathmlIMgDao();
		return tpDao;
	}
}