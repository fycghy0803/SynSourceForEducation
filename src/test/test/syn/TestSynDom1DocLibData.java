package test.syn;

import org.apache.log4j.Logger;

import com.hysoft.process.syn.thread.producer.ProducerParent;
import com.hysoft.process.syn.thread.producer.QuestionProducer;
import junit.framework.TestCase;

public class TestSynDom1DocLibData extends TestCase {
     public void testSynDom1DocLibData() throws Exception{
    	Logger loger = Logger.getRootLogger();
    	loger.info("syn start SynDom1DocLibData.....");
    	ProducerParent pp = new QuestionProducer();
		pp.setConsumerCount(4);
		pp.start();
		loger.info("syn end SynDom1DocLibData.....");
     }
}
