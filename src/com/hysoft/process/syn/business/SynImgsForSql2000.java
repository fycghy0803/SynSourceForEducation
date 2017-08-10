package com.hysoft.process.syn.business;

import com.hysoft.process.database.source.sqlserver2000.dao.DomImageDao;
import com.hysoft.process.database.target.dao.sub.TresQstImageDao;
import com.hysoft.process.syn.SynImgs;
import com.hysoft.util.conn.ConnsPool;
import com.hysoft.util.ftp.FtpClientUtil;

public class SynImgsForSql2000 extends SynImgs {

	public SynImgsForSql2000(ConnsPool connsPool) throws Exception {
		super();
		this.setConnsPool(connsPool);
		init();
	}
	
	@Override
	public void init() {
		super.init();
		this.spDao = new DomImageDao();
		spDao.setConnection(this.connsPool.getSourceSqlServer2000());
	}
	
	@Override
	public void uploadFile(){
		//¥”sql server 2000 œ¬‘ÿÕº∆¨
		loger.error("download file from sql server 2000");
		loger.info("current process page:" + (currPage + 1));
		this.tmpPath = ssForXml.getSourceFtpServerNormal().getLocalTempPath() + "/tmp" + currPage;
		//clearTempFile(tmpPath);
		this.targetDao = new TresQstImageDao();
		spDao.clearList();
		spDao.setCurrentPage(currPage);
		
		FtpClientUtil fcUtilNormal = this.connsPool.getFtpNormal();
		
	    retMsgSqlServer = processUploadFileToTargets(spDao,ssForXml.getSqlServerForm(),ssForXml.getSourceFtpServerNormal(),fcUtilNormal);
	    
	}
}
