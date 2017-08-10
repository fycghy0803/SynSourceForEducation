package com.hysoft.process.database;

import java.util.List;

import com.hysoft.util.database.RunInitScript;
import com.hysoft.util.forms.DatabaseForm;
import com.hysoft.util.forms.TargetServerForm;
import com.hysoft.util.xml.SourceServerForXML;
import com.hysoft.util.xml.TargetServerForXml;

public class BackupDatabase implements Runnable {
    private Thread th = new Thread(this);
    SourceServerForXML ssForXml = SourceServerForXML.getInstance();
    TargetServerForXml tsForXml = TargetServerForXml.getInstance();
    public BackupDatabase() {
    	try {
			ssForXml.setSourceForms();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        tsForXml.init();
    }
    
    public void start() {
    	th.start();
    }
    
	public void run() {
		while(true) {
			DatabaseForm toForm = ssForXml.getBackupServerForm();
			RunInitScript rs = new RunInitScript();
			try {
				List<TargetServerForm> list = tsForXml.getTargetServers();
				
				for(TargetServerForm tsForm : list) {
					DatabaseForm fromForm = tsForm.getDatabaseForm();	
					toForm.setDatabaseName("zhtk_" + tsForm.getServerCode());
				 	rs.backAndRestoreDatabase(toForm, fromForm);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				Thread.sleep(1000 * 60 * 60 * 24);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
