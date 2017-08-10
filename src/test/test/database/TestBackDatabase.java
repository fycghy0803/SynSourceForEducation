package test.database;

import com.hysoft.util.database.RunInitScript;
import com.hysoft.util.forms.DatabaseForm;
import com.hysoft.util.forms.TargetServerForm;
import com.hysoft.util.xml.SourceServerForXML;
import com.hysoft.util.xml.TargetServerForXml;

import junit.framework.TestCase;

public class TestBackDatabase extends TestCase {
	SourceServerForXML ssForXml = SourceServerForXML.getInstance();
    TargetServerForXml tsForXml = TargetServerForXml.getInstance();
    
    @Override
	protected void setUp() throws Exception {
    	ssForXml.setSourceForms();
        tsForXml.init();
	}

	public void testBackDatabase() throws Exception {
		DatabaseForm toForm = ssForXml.getBackupServerForm();
		toForm.setDatabaseName("zhtk_002");
		TargetServerForm tfromForm = tsForXml.getTargetServers().get(0);
		DatabaseForm fromForm = tfromForm.getDatabaseForm();
		RunInitScript rs = new RunInitScript();
		rs.backAndRestoreDatabase(toForm, fromForm);
    }
}
