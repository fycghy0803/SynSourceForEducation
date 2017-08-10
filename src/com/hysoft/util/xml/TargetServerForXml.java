package com.hysoft.util.xml;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.dom4j.Element;

import com.hysoft.util.forms.DatabaseForm;
import com.hysoft.util.forms.FtpForm;
import com.hysoft.util.forms.TargetServerForm;

public class TargetServerForXml extends ServerForXML{
	private static TargetServerForXml ssXml = new TargetServerForXml();
	
	@SuppressWarnings("unchecked")
	public CopyOnWriteArrayList<TargetServerForm> getTargetServers() {
		Element root = document.getRootElement();
		List<Element> list = root.selectNodes("server");
		CopyOnWriteArrayList<TargetServerForm> targetServerForms = new CopyOnWriteArrayList<TargetServerForm>();
		
        for(Element elem : list) {
           String synFlag = elem.elementTextTrim("synFlag");
           if( "N".equals(synFlag) ) {
        	   continue;
           }
           
           TargetServerForm tsForm = new TargetServerForm();
           tsForm.setSynFlag(synFlag);
           tsForm.setConnectDate(elem.elementTextTrim("connectDate"));
           tsForm.setServerCode(elem.elementTextTrim("serverCode"));
           tsForm.setLastSynDate(elem.elementTextTrim("lastSynDate"));
           tsForm.setWebServicePath(elem.elementTextTrim("webServicePath"));
           tsForm.setSynType(elem.elementTextTrim("synType"));
           
           tsForm.setSynInterval(elem.elementTextTrim("synInterval"));
           tsForm.setServerId(elem.attributeValue("id"));
           tsForm.setDesc(elem.elementTextTrim("desc"));
           tsForm.setSynContent(elem.elementTextTrim("synContent"));
           FtpForm ftpForm = new FtpForm();
           DatabaseForm dbForm = new DatabaseForm(); 
           dbForm.setSynContent(tsForm.getSynContent());
           setDatabaseForm(dbForm, (Element)elem.selectSingleNode("database"));
           setFtpForm(ftpForm,  (Element)elem.selectSingleNode("ftp"));
           tsForm.setDatabaseForm(dbForm);
           tsForm.setFtpForm(ftpForm);
           targetServerForms.add(tsForm);
        }
        
        return targetServerForms;
	}

	private TargetServerForXml() {
		xmlFileName = "Config/TargetServerConfig.xml";  
		readXml();
	}
	
	public void init() {
		xmlFileName = "Config/TargetServerConfig.xml";  
		readXml();
	}

	public static TargetServerForXml getInstance(){
        return ssXml;		
	}
}
