package test.syn;

import java.sql.Connection;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.syn.SynParent;
import com.hysoft.process.syn.business.SynTresPaperData;

import junit.framework.TestCase;

public class TestSynTresPaperData extends TestCase {
     public void testSynDom1DocLibData() throws Exception{
    	 SynParent synData = new SynTresPaperData(null,null);
    	 Connection conn = synData.getConnMySql();
    	 Connection connAn = synData.getConnSqlServer2000();
    	 synData = new SynTresPaperData(conn,connAn);
    	 synData.synRun(DatabaseSql.TYPE_OPT_MYSQL);
    	 conn.close();
    	 connAn.close();
     }
}
