package com.hysoft.process;

import org.apache.log4j.Logger;

import com.hysoft.process.syn.SynPublic;
import com.hysoft.process.syn.thread.producer.ImgProducerFor2000;
import com.hysoft.process.syn.thread.producer.ImgProducerForMysql;
import com.hysoft.process.syn.thread.producer.ImgProducerParent;
import com.hysoft.process.syn.thread.producer.ProducerParent;

public class StartRuning {
	private int[] retMySqlMsg;
	private int[] retSqlServerMsg;
	private static final int synCount = 7;
	private static int completeCount = 0;  
	private static Object lockObject = new Object();
	private static Logger loger = Logger.getRootLogger();
	
	public static void addCompleteCount() {
		synchronized(lockObject) {
			completeCount++;
			if(completeCount == synCount) {
				loger.error("syn all of data is completed.");
				completeCount = 0 ;
			}
		}
	}
	
	public int[] getRetMySqlMsg() {
		return retMySqlMsg;
	}

	public void setRetMySqlMsg(int[] retMySqlMsg) {
		this.retMySqlMsg = retMySqlMsg;
	}
	
	public int[] getRetSqlServerMsg() {
		return retSqlServerMsg;
	}

	public void setRetSqlServerMsg(int[] retSqlServerMsg) {
		this.retSqlServerMsg = retSqlServerMsg;
	}

	public void runSynImgs(String type) throws Exception{
		loger.info("syn Images is running............");
		
		if(null == type || "9".equals(type)) {
			loger.info("syn Images from sql server 2000 is running............");
			//6.同步2000中的图片 
			ProducerParent pp2000 = new ImgProducerFor2000();
			pp2000.setConsumerCount(SynPublic.THREAD_COUNT);
			pp2000.start();
		}
		
		if(null == type || "8".equals(type)) {
			loger.info("syn Images from my sql is running............");
			//7.同步my sql中的图片
			ImgProducerParent ppMysql = new ImgProducerForMysql();
			ppMysql.setConsumerCount(SynPublic.THREAD_COUNT);
			ppMysql.start();
		}
	}
}
