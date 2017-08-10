package com.hysoft.process.syn.thread.producer;

import org.apache.log4j.Logger;

import com.hysoft.process.syn.thread.consumer.ConcumerParent;
import com.hysoft.util.conn.ConnsPool;

public abstract class ProducerParent implements Runnable {
	protected Logger loger = Logger.getRootLogger();
	protected int consumerCount = 1;
	protected ConcumerParent[] cp;
	protected Thread th = new Thread(this);
	protected int currentPage = -1; 
	protected int pageCount;
	protected ConnsPool connsPool = new ConnsPool();
	public static int THREAD_SLEEP_TIME = 1000 * 60 * 40;
	
	public ProducerParent(){
		try {
			connsPool.init();
			this.setConnsPool(connsPool);
		} catch (Exception e) {
		}
	}
	
	public int getConsumerCount() {
		return consumerCount;
	}
	public void setConsumerCount(int consumerCount) {
		this.consumerCount = consumerCount;
	}
	
	public void start() {
		th.start();
	}
	
	public synchronized void init() {
		this.currentPage = -1;
	}
	
	public synchronized int pickCurrentPage() {
		if(this.currentPage == -1) return -1;
		int ret = this.currentPage;
		
		if(this.currentPage < pageCount) {
			++currentPage;
		}else {
			this.currentPage = -1;
		}
		
		return ret;
	}
	
	public ConnsPool getConnsPool() {
		return connsPool;
	}
	public void setConnsPool(ConnsPool connsPool) {
		this.connsPool = connsPool;
	}
}
