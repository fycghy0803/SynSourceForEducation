package com.hysoft.util.ftp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.log4j.Logger;

import com.hysoft.process.syn.SynPublic;
import com.hysoft.util.forms.FtpForm;

public class FtpClientUtil {
   private FTPClient ftp;
   private FtpForm ftpForm;
   
   private Logger loger = Logger.getRootLogger();
   
   public void closeConnect(){
	   if(ftp != null) {
		    try {
			   ftp.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			    loger.error(e);	
			}
	   }
   }
   
   public void setFtpForm(FtpForm ftpForm){
	   this.ftpForm = ftpForm;
   }
   
   public void connect() throws Exception {
	  if(ftp != null){
		  if(ftp.isConnected()) {
		     ftp.disconnect();
		  }
	  } 
	  
	  ftp = new FTPClient();
      ftp.connect(ftpForm.getFtpAddress(), ftpForm.getFtpPort());
      ftp.login(ftpForm.getFtpLoginName(), ftpForm.getFtpPwd());
      String repStr = ftp.getReplyString();
      if( !FTPReply.isPositiveCompletion(ftp.getReplyCode()) ) {
    	  ftp.disconnect();
    	  throw new Exception(repStr);
      }
      
      //二进制方式进行传递
      ftp.setFileType(FTP.BINARY_FILE_TYPE);
      ftp.setKeepAlive(true);
      ftp.enterLocalPassiveMode();
      ftp.setDefaultTimeout(SynPublic.timeOut);
      ftp.setDataTimeout(SynPublic.timeOut);
      ftp.setConnectTimeout(SynPublic.timeOut);
      ftp.setBufferSize(SynPublic.bufferSize);
   }
   
   public boolean upLoadDirectory(String romatePath,String localPath,String tmpPath){
	   boolean success = false;
	   File localfile = new File(localPath);
       // 要上传的是否存在
       if (!localfile.exists()) {
           return success;
       }
       
       // 要上传的是否是文件夹
       if (!localfile.isDirectory()) {
           return success;
       }
       
       File[] files = localfile.listFiles();
       for (File file : files) {
           if (file.exists()) {
               if (file.isDirectory()) {
                   upLoadDirectory(romatePath,file.getAbsolutePath(),tmpPath);
               } else {
                   String local = file.getAbsolutePath();
                   File tmpFile = new File(tmpPath);
                   tmpPath = tmpFile.getAbsolutePath();
                   String remote = romatePath + local.toUpperCase().replace(tmpPath.toUpperCase(), "");
                   File remoteFile = new File(remote);
                   remote = remoteFile.getAbsolutePath();
                   boolean uploadRet = upLoadFile(remote,local);
                   if(!uploadRet) {
                	   upLoadFile(remote,local);
                   }
               }
           }
       }
       return true;
   } 
   
   private void checkConnectValid(){
	   boolean status = false;
	   try {
		  status = ftp.sendNoOp();
	   } catch (IOException e1) {
		   e1.printStackTrace();
		   loger.error(e1 + " ftp connect is disconnect");
	   }finally {
		   if(!status) {
			   this.closeConnect();
			   try{
				   this.connect();
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }
	   }
   }
   
   public boolean upLoadFile(String remotePath,String sourcePath){
	   boolean ret = false;
	   FileInputStream fis = null;
	   
	   try {
		    File remoteFile = new File(remotePath);
		    String parPath = remoteFile.getParent();
		    boolean exist = ftp.changeWorkingDirectory(parPath);
		    
		    if(!exist) { //文件夹在ftp服务器上不存在
		    	makeDirs(parPath);
		    }
		    
		    fis  = new FileInputStream(sourcePath);
	    	ret = ftp.storeFile(remotePath, fis);
	    	if(!ret) {
	    		throw new Exception(ftp.getReplyString());
	    	} else {
	    		ftp.rename(remotePath,remotePath.replace(".tmp", ".zip"));
	    	}
	   } catch (Exception e) {
		  e.printStackTrace();
		  loger.error(e + ",upload file:" + remotePath + ";" + sourcePath);
	   }finally {
	      if(fis != null) try{
	    	  fis.close();
	      }catch(Exception e) {}
	   }
	   
	   return ret;
   } 
   
   public void makeDirs(String pathName) {
	   pathName = pathName.replace("\\", "/");
	   String[] pathNames = pathName.split("/");
	   String parentPath = "";
	   
	   boolean existsDir;
	   try {
			String currentDirectory = ftp.printWorkingDirectory();
			existsDir = ftp.changeWorkingDirectory(pathName);
			ftp.changeWorkingDirectory(currentDirectory);
			if(existsDir) return;
	   } catch (IOException e1) {}
	   
	   for(int i = 0;i < pathNames.length;i++) {
		   try {
			  String parent = parentPath +"/" + pathNames[i];
			  String currentDirectory = ftp.printWorkingDirectory();
			  existsDir = ftp.changeWorkingDirectory(parent);
			  ftp.changeWorkingDirectory(currentDirectory);
			  if(!existsDir) {
			     ftp.makeDirectory(parent);
			  }
		   } catch (Exception e) {
			   e.printStackTrace();
			   loger.error(e);
		   }
		   parentPath += "/" + pathNames[i];
	   }
   }
   
   public boolean downLoadFile(String sourcefile,String destPath) {
	   boolean ret = false;
	   FileOutputStream fos = null;
	   checkConnectValid();
	   try{
		   destPath += "/" + sourcefile;
		   File file = new File(destPath);
		   if(file.exists()) {
			   file.delete();
		   }else{
			   new File(file.getParent()).mkdirs();
		   }
		   
		   file.createNewFile();
		   fos = new FileOutputStream(destPath);
		   ret = ftp.retrieveFile(sourcefile, fos);
		   
		   if( !ret ) {
			   throw new Exception(ftp.getReplyString());
		   }
	   } catch(Exception e) {
		   e.printStackTrace();
		   loger.error(e.getMessage() + ",download file:" + sourcefile + ";" + destPath);
	   } finally {
		   try {
			   if(fos != null) {
				   fos.flush();
				   fos.close();
			   }
		   }catch(Exception e) {
			   loger.error(e);
		   }
	   }
	   
	   return ret;
   } 
  
	public FTPClient getFtp() {
		return ftp;
	}
	
	public void setFtp(FTPClient ftp) {
		this.ftp = ftp;
	}
	
	public String toString() {
		return ftpForm.getFtpAddress();
	}
}
