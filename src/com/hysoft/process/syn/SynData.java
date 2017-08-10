package com.hysoft.process.syn;

import org.apache.log4j.Logger;

import com.hysoft.process.syn.thread.producer.DomRelQstKeyDataProducer;
import com.hysoft.process.syn.thread.producer.DomRelQstTeachDataProducer;
import com.hysoft.process.syn.thread.producer.PaperProducer;
import com.hysoft.process.syn.thread.producer.PaperRelTeachProducer;
import com.hysoft.process.syn.thread.producer.ProducerParent;
import com.hysoft.process.syn.thread.producer.QuestionProducer;
import com.hysoft.process.syn.thread.producer.SynBasicData;
import com.hysoft.process.syn.thread.producer.TresQstImgageProducer;
import com.hysoft.process.syn.thread.producer.TresQstMathmlImgageProducer;

public class SynData{
	private Logger loger = Logger.getRootLogger();
	
	public void startRunning(String type) throws Exception {
		try{
			//1.syn basic data
			SynBasicData syData = new SynBasicData(type);
			syData.start();
			
			//2.syn question 
			if(null == type || "4".equals(type)) {
				loger.info("syn start SynDom1DocLibData.....");
				ProducerParent pp = new QuestionProducer();
				pp.setConsumerCount(SynPublic.THREAD_COUNT);
				pp.start();
				loger.info("syn end SynDom1DocLibData.....");
			}
						
			//3.syn paper
			if(null == type || "5".equals(type)) {
				loger.info("syn start SynTresPaperData.....");
				ProducerParent pp = new PaperProducer();
				pp.setConsumerCount(SynPublic.THREAD_COUNT);
				pp.start();
				loger.info("syn end SynTresPaperData.....");
			}
						
			//4.syn question rel teach
			if(null == type || "6".equals(type)) {
				loger.info("syn start SynDomRelQstTeachData.....");
				ProducerParent pp = new DomRelQstTeachDataProducer();
				pp.setConsumerCount(SynPublic.THREAD_COUNT);
				pp.start();
				loger.info("syn end SynDomRelQstTeachData.....");
			}
			
			//5.syn question rel key 
			if(null == type || "7".equals(type)) {
				loger.info("syn start SynDomRelQstKeyData.....");
				ProducerParent pp = new DomRelQstKeyDataProducer();
				pp.setConsumerCount(SynPublic.THREAD_COUNT);
				pp.start();
				loger.info("syn end SynDomRelQstKeyData.....");
			}
			
			//syn my sql SynTresPaperRelTeach
			if(null == type || "13".equals(type)) {
				loger.info("syn start SynTresPaperRelTeach.....");
				ProducerParent pp = new PaperRelTeachProducer();
				pp.setConsumerCount(SynPublic.THREAD_COUNT);
				pp.start();
				loger.info("syn end SynTresPaperRelTeach.....");
			}
			
			//syn  sql  server TresQstImage
			if(null == type || "14".equals(type)) {
				loger.info("syn start TresQstImage.....");
				ProducerParent pp = new TresQstImgageProducer();
				pp.setConsumerCount(SynPublic.THREAD_COUNT);
				pp.start();
				loger.info("syn end TresQstImage.....");
			}
			
			//syn my sql TresQstMathmlImgage
			if(null == type || "15".equals(type)) {
				loger.info("syn start TresQstMathmlImgage.....");
				ProducerParent pp = new TresQstMathmlImgageProducer();
				pp.setConsumerCount(SynPublic.THREAD_COUNT);
				pp.start();
				loger.info("syn end TresQstMathmlImgage.....");
			}
		}catch(Exception e){
			e.printStackTrace();
			loger.error(e);
		}
	}	
}
