package com.hysoft.process.syn.thread.consumer;

import org.apache.log4j.Logger;

import com.hysoft.process.syn.thread.producer.ProducerParent;
import com.hysoft.util.conn.ConnsPool;

public abstract class ConcumerParent implements Runnable {
	protected Thread  th = new Thread(this);
	protected ProducerParent pp;
	protected Logger loger = Logger.getRootLogger();
	protected ConnsPool connsPool;
	protected String dataType;
	
	public ConcumerParent(){
		this.connsPool = new ConnsPool();
		try {
			this.connsPool.init();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void start() {
		th.start();
	}

	public ProducerParent getPp() {
		return pp;
	}

	public void setPp(ProducerParent pp) {
		this.pp = pp;
	}
	
	public ConnsPool getConnsPool() {
		return connsPool;
	}
	public void setConnsPool(ConnsPool connsPool) {
		this.connsPool = connsPool;
	}
}
