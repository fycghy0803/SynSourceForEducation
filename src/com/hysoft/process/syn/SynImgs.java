package com.hysoft.process.syn;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.apache.log4j.Logger;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.ImgParentDao;
import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.SourceParentDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.util.conn.ConnsPool;
import com.hysoft.util.forms.DatabaseForm;
import com.hysoft.util.forms.FtpForm;
import com.hysoft.util.forms.TargetServerForm;
import com.hysoft.util.ftp.FtpClientUtil;
import com.hysoft.util.zip.ZipUtil;

public abstract class SynImgs extends SynParent{
    protected Logger loger = Logger.getRootLogger();
    protected TargetParentDao targetDao; 
    protected int currPage;
    protected SourceParentDao spDao;
    protected ConnsPool connsPool;
    protected String tmpPath;
	
    public ConnsPool getConnsPool() {
		return connsPool;
	}

	public void setConnsPool(ConnsPool connsPool) {
		this.connsPool = connsPool;
	}

	public SourceParentDao getSpDao() {
		return spDao;
	}

	public void setSpDao(SourceParentDao spDao) {
		this.spDao = spDao;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public SynImgs() throws Exception {
	    super();
    }
	
    protected void clearTempFile(String localTempPath){
    	loger.error("clear all temp files");
		File file = new File(localTempPath);
		deleteDir(file);
    }
    
	public abstract void uploadFile();
	
	public int getPageCount() {
		int pageCount = (int)Math.ceil(spDao.getCount() / (float)DatabaseSql.PAGE_COUNT);
		return pageCount;
	}
	
	protected boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i=0; i<children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        return dir.delete();
    }
	
	protected int[] processUploadFileToTargets(SourceParentDao spDao,DatabaseForm dbForm,FtpForm sourceFtpForm,FtpClientUtil fcUtil) {
		int errorCount = 0,totalCount = 0;
		int[] retMsg = new int[2];
		List<DatabaseSql> data = spDao.getSourceData();
		List<FtpForm> listForms = new CopyOnWriteArrayList<FtpForm>();
		
		try{
			spDao.getConnection().close();
		}catch(Exception e) {}
		
		try {
			fcUtil.closeConnect();
			fcUtil.connect();
		} catch (Exception e) {
			e.printStackTrace();
			loger.error("connect ftp failure;" + fcUtil.toString() + ";" + e);
		}
		
		loger.info("download files to local temp directory start." + this.currPage);
		
		//��ȡ����ͼƬ��¼��Ӧ��ͼƬȫ��ftp������������ʱ�ļ���
		for( DatabaseSql ds : data){
		   ++totalCount;
		   String filepath = ((ImgParentDao)spDao).getImgPath(ds);
		   //��Դftp������ͼƬ
		   boolean res = fcUtil.downLoadFile(filepath, tmpPath);
		   if( !res) {
			   fcUtil.closeConnect();
			   res = fcUtil.downLoadFile(filepath, tmpPath);
		   }
		   if( !res) {++errorCount;}
		   FtpForm ftpForm = new FtpForm();
		   ftpForm.setFtpPath(filepath);
		   ftpForm.setLocalTempPath(tmpPath);
		   listForms.add(ftpForm);
		}
		
		fcUtil.closeConnect();
		loger.info("download files to local temp directory end." + this.currPage);
        
		ZipUtil zipUtil = new ZipUtil();
		try {
			//Zip the tmpPath
			String localZipFile = new File(tmpPath).getParent() + "/tmp" + this.currPage + ".tmp" ;
			File tmpFile = new File(localZipFile);
			
			if(tmpFile.exists()) {
				tmpFile.delete(); //clear temp file
			}
			
			zipUtil.zip(localZipFile , new File(tmpPath));
			 //2.send zip file to the dest fpt server
			loger.info("send Files To Targets start." + this.currPage);
			sendFileToTargets(localZipFile);
			loger.info("send Files To Targets end." + this.currPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		retMsg[0] = totalCount;
		retMsg[1] = errorCount;
		
		return retMsg;
	}
	
	private void sendFileToTargets(String fileName){
		List<TargetServerForm> targets = tsForXml.getTargetServers(); //�õ�Ŀ�����б��¼
		for(TargetServerForm tsForm : targets) {
			String serverId = tsForm.getServerId();
			//�жϵ�ǰ�Ƿ�ͬ��ʱ���ѵ�
			boolean isTime = this.isTimeCome(tsForm.getSynInterval(), serverId);
			if(!isTime) {continue;}
			
			//��������ʱ�ļ��е�ͼƬ�ϴ���Ŀ��ftp������
			FtpClientUtil fcTmpUtil = this.connsPool.getTargetFtpConns(serverId);
			fcTmpUtil.closeConnect();
			
			try {
				fcTmpUtil.connect();
				loger.info("current date start :" + new Date()); 
				String remote = new File(fileName).getName();
				boolean uploadRet = fcTmpUtil.upLoadFile(remote,fileName);
                if(!uploadRet) {
                	fcTmpUtil.closeConnect();
                	fcTmpUtil.connect();
                	fcTmpUtil.upLoadFile(remote,fileName);
                }
                loger.info("current date end :" + new Date());
			} catch (Exception e) {
				e.printStackTrace();
				loger.error(" upload file failure." + fcTmpUtil.toString() + ";" + e  + ";" + serverId);
			}
			
			fcTmpUtil.closeConnect();
		}
    }		

	
	public void synRun(int type) throws Exception {
		this.uploadFile();
	}

	public void synRun() throws Exception {
		this.uploadFile();
	}
	
	@Override
	public SelectDao getSourceDao() throws Exception {
		return null;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		return null;
	}
}
