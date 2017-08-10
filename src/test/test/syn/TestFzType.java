package test.syn;

import java.sql.Connection;

import org.apache.log4j.Logger;
import org.quartz.Trigger;
import org.quartz.TriggerUtils;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.syn.SynParent;
import com.hysoft.process.syn.business.SynCategoryTypeData;
import com.hysoft.util.database.DatabaseOption;
import com.hysoft.util.database.sub.MySqlDatabaseOption;
import com.hysoft.util.database.sub.SqlServer2000Option;
import com.hysoft.util.xml.SourceServerForXML;

import junit.framework.TestCase;

public class TestFzType extends TestCase {
	private Logger loger = Logger.getRootLogger();
	Connection connSql2000;
	Connection connMySql;
	SourceServerForXML ssForXml = SourceServerForXML.getInstance();
    public void testFzType() throws Exception {
    	
    	ssForXml.setSourceForms();
    	connSql2000 = getConnSqlServer2000();
    	connMySql = getConnMySql();
    	SynParent synData = null;
		
		   loger.info("syn start SynCategoryTypeData.....");
		   synData = new SynCategoryTypeData(connSql2000);
		   synData.init();
		   synData.synRun(DatabaseSql.TYPE_OPT_2000);
		   loger.info("syn end SynCategoryTypeData.....");
    }
    
    public Connection getConnSqlServer2000() throws Exception {
    	DatabaseOption mydata = new SqlServer2000Option();
		mydata.setDbForm(ssForXml.getSqlServerForm());
		connSql2000 = mydata.getConnection();
		return connSql2000;
    }
    
    public Connection getConnMySql() throws Exception {
    	DatabaseOption mydata = new MySqlDatabaseOption();
		mydata.setDbForm(ssForXml.getMySqlForm());
		connMySql = mydata.getConnection();
		return connMySql;
    }
    
    public void testCronTrigger() {
    	
    }
}
