package test.syn;

import org.apache.log4j.Logger;

import com.hysoft.process.syn.SynData;
import com.hysoft.util.conn.ConnsPool;

import junit.framework.TestCase;

public class TestSynDatabase extends TestCase {
	private Logger loger = Logger.getRootLogger();
	
    public void testSynData() throws Exception {
    	loger.info("syn data starting ............");
		SynData synData = new SynData();
		synData.startRunning(null);
		loger.info("syn data end ............");
    }
}
