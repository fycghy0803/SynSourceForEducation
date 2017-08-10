package com.hysoft.util.xml;

import java.util.Iterator;
import java.util.List;

import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;

import com.hysoft.util.forms.DatabaseForm;
import com.hysoft.util.forms.FtpForm;

public class SourceServerForXML extends ServerForXML{
	private FtpForm SourceFtpServerFormula;
	private FtpForm SourceFtpServerNormal;
	private DatabaseForm mySqlForm;
	private DatabaseForm sqlServerForm;
	private DatabaseForm backupServerForm;
	
	private static SourceServerForXML ssForXml = new SourceServerForXML();
	
	public DatabaseForm getBackupServerForm() {
		return backupServerForm;
	}

	public void setBackupServerForm(DatabaseForm backupServerForm) {
		this.backupServerForm = backupServerForm;
	}

	private SourceServerForXML() {
		xmlFileName = "Config/SourceServerConfig.xml";  
		readXml();
	}
	
	public FtpForm getSourceFtpServerFormula() {
		return SourceFtpServerFormula;
	}
	
	public static SourceServerForXML getInstance(){
        return ssForXml;		
	}

	public void setSourceFtpServerFormula(FtpForm sourceFtpServerFormula) {
		SourceFtpServerFormula = sourceFtpServerFormula;
	}

	public FtpForm getSourceFtpServerNormal() {
		return SourceFtpServerNormal;
	}

	public void setSourceFtpServerNormal(FtpForm sourceFtpServerNormal) {
		SourceFtpServerNormal = sourceFtpServerNormal;
	}

	public DatabaseForm getMySqlForm() {
		return mySqlForm;
	}

	public void setMySqlForm(DatabaseForm mySqlForm) {
		this.mySqlForm = mySqlForm;
	}

	public DatabaseForm getSqlServerForm() {
		return sqlServerForm;
	}

	public void setSqlServerForm(DatabaseForm sqlServerForm) {
		this.sqlServerForm = sqlServerForm;
	}
    
    public String getValueByXpath(String xPath) throws DocumentException{
    	Element root = document.getRootElement();
    	Node node = root.selectSingleNode(xPath);
    	String value = node.getText();
		return value;
    }
    
    public void setSourceForms() throws Exception {
    	Element root = document.getRootElement();
    	setDataBaseServers(root);
    	setFtpServers(root);
    }
    
    private void setDataBaseServers(Element root) {
    	List<Element> selectNodes = root.selectNodes("databaseServer/server");
    	Iterator<Element> iter = selectNodes.iterator();
    	
    	while(iter.hasNext()) {
    	   Element elem = (Element)iter.next();
    	   String id = elem.attributeValue("id");
    	   if("mySql".equals(id)) {
    		   if(mySqlForm == null) {
    		      mySqlForm = new DatabaseForm();
    		   }
    		   setDatabaseForm(mySqlForm,elem);
    	   }else if("sqlServer2000".equals(id)) {
    		   if(sqlServerForm == null) {
    		      sqlServerForm = new DatabaseForm();
    		   }
    		   setDatabaseForm(sqlServerForm,elem);
    	   }else if("backupServer".equals(id)) {
    		   if(backupServerForm == null) {
    			   backupServerForm = new DatabaseForm();
    			   setDatabaseForm(backupServerForm,elem);
    			   backupServerForm.setMysqlBinPath(elem.elementTextTrim("mysqlBinPath"));
    		   }
    	   }
    	}
    }
    
    private void setFtpServers(Element root) {
    	List<Element> selectNodes = root.selectNodes("ftpServer/server");
    	Iterator<Element> iter = selectNodes.iterator();
    	
    	while(iter.hasNext()) {
    	   Element elem = (Element)iter.next();
    	   String id = elem.attributeValue("id");
    	   if("source_formula".equals(id)) {
    		   if(SourceFtpServerFormula == null) {
    			   SourceFtpServerFormula = new FtpForm();
    		   }
    		   setFtpForm(SourceFtpServerFormula,elem);
    	   }else if("source_normal".equals(id)) {
    		   if(SourceFtpServerNormal == null) {
    			   SourceFtpServerNormal = new FtpForm();
    		   }
    		   
    		   setFtpForm(SourceFtpServerNormal,elem);
    	   }
    	}
    }
    
    public static void main(String[] args){
    	SourceServerForXML readXml = SourceServerForXML.getInstance();
    	try {
			readXml.setSourceForms();
			System.out.println("readXml");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
