package com.hysoft.util.xml;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.hysoft.util.forms.DatabaseForm;
import com.hysoft.util.forms.FtpForm;

public class ServerForXML {
	protected Document document;
	protected String xmlFileName;
	protected Logger logger = Logger.getRootLogger();
	
	public String getConfigPath() {
		return SourceServerForXML.class.getResource("/").getFile();
	}
	
	protected void readXml() {
		SAXReader reader = new SAXReader();
		// ¶ÁÈ¡XMLÎÄ¼þ
		xmlFileName =  getConfigPath() + xmlFileName;
		
		try {
			document = reader.read(createXmlFile());
		} catch (Exception e) {
			logger.error(e);		
		}
	}
	
	public File createXmlFile() throws Exception{
		File xmlFile = new File(xmlFileName);
        String entStr = "\r\n";
		if( !xmlFile.exists() ) {
			xmlFile.createNewFile();
			
			OutputStreamWriter fw = new OutputStreamWriter(new FileOutputStream(xmlFile),"UTF-8");
			fw.write("<?xml version='1.0' encoding='UTF-8' standalone='no'?>" + entStr);
			fw.write("<targetInfo>" + entStr);
			fw.write("</targetInfo>" + entStr);
			fw.flush();
			fw.close();
		}
		
		return xmlFile;
	}
	
    protected void setFtpForm(FtpForm ftpForm,Element elem) {
    	ftpForm.setFtpAddress(elem.elementTextTrim("IpAddress"));
    	String port = elem.elementTextTrim("port");
    	if("".equals(port)) {
    		port = "0";
    	}
    	
    	ftpForm.setFtpPort(Integer.valueOf(port).intValue());
    	ftpForm.setFtpLoginName(elem.elementTextTrim("loginName"));
    	ftpForm.setFtpPwd(elem.elementTextTrim("pwd"));
    	ftpForm.setSecondPath(elem.elementTextTrim("secondPath"));
    	ftpForm.setDesc(elem.elementTextTrim("desc"));
    	ftpForm.setLocalTempPath(elem.elementTextTrim("localTempPath"));
    }
    
    protected void setDatabaseForm(DatabaseForm databaseForm,Element elem) {
    	databaseForm.setDatabaseAddress(elem.elementTextTrim("IpAddress"));
    	String port = elem.elementTextTrim("port");
    	if("".equals(port)) {
    		port = "0";
    	}
    	databaseForm.setPort( Integer.valueOf(port).intValue());
    	databaseForm.setDatabaseName(elem.elementTextTrim("databaseName"));
    	databaseForm.setLoginName(elem.elementTextTrim("loginName"));
    	databaseForm.setPwd(elem.elementTextTrim("pwd"));
    	databaseForm.setDesc(elem.elementTextTrim("desc"));
    	databaseForm.setDatabaseCharSet(elem.elementTextTrim("databaseCharSet"));
    }

}
