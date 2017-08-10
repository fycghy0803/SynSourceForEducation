package com.hysoft.process.syn.business;

import com.hysoft.process.database.source.mysql.dao.FzMathmlImgDao;
import com.hysoft.process.database.target.dao.sub.TresQstMathmlIMgDao;
import com.hysoft.process.syn.SynImgs;
import com.hysoft.util.conn.ConnsPool;
import com.hysoft.util.ftp.FtpClientUtil;

public class SynImgsForMysql extends SynImgs {
    
	public SynImgsForMysql(ConnsPool connsPool) throws Exception {
		super();
		this.connsPool = connsPool;
		init();
	}
	
	@Override
	public void init() {
		super.init();
		this.spDao = new FzMathmlImgDao();
		spDao.setConnection(this.connsPool.getSourceMysql());
	}

	@Override
	public void uploadFile() {
		//从mySql数据库的服务器下载图片传至目标库
		loger.error("download file from my sql server");
		loger.info("current process page:" + (currPage +  1));
		this.tmpPath = ssForXml.getSourceFtpServerFormula().getLocalTempPath() + "/tmp" + currPage;		
		//clearTempFile(tmpPath);
		this.targetDao = new TresQstMathmlIMgDao();
		FtpClientUtil fcUtil = this.connsPool.getFtpFormula();
		
		spDao.clearList();
		spDao.setCurrentPage(currPage);
		retMsgMySql = processUploadFileToTargets(spDao,ssForXml.getMySqlForm(),ssForXml.getSourceFtpServerFormula(),fcUtil);
	}
}
