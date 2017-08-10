package test.syn;

import com.hysoft.process.StartRuning;
import com.hysoft.util.conn.ConnsPool;

import junit.framework.TestCase;

public class TestRunSynImgs extends TestCase {
   public void testSynImgs() throws Exception {
	   StartRuning run = new StartRuning();
	   run.runSynImgs(null);
   }
}
