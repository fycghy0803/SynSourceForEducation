package com.hysoft.synImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.hysoft.process.StartRuning;
import com.hysoft.process.database.BackupDatabase;
import com.hysoft.process.syn.SynData;
import com.hysoft.process.syn.SynParent;
import com.hysoft.util.database.RunInitScript;
import com.hysoft.util.zip.UnzipFilesThread;

public class SynImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger loger = Logger.getRootLogger();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String autoRun = config.getInitParameter("autoRun");
		String useServer = config.getInitParameter("useServer");
			
		try {
			if("true".equals(autoRun)) {
				if("SynServer".equals(useServer)) {
					Calendar cal = Calendar.getInstance();
					cal.set(Calendar.HOUR_OF_DAY, cal.get(Calendar.HOUR_OF_DAY) - 1);
					SynParent.startDate = cal.getTime();
					//start to back database
					BackupDatabase bd = new BackupDatabase();
					bd.start();
				    runSyn(null);
				} else {
					//start to unzip files
					String zipFilePath = config.getInitParameter("zipFilePath");
					UnzipFilesThread ufThread =	new UnzipFilesThread(zipFilePath);
					ufThread.start();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			loger.error(e);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		PrintWriter pw = null;
		
		try {
			String type = req.getParameter("type");
			runSyn(type);
			pw = resp.getWriter();
			pw.print("<br/>syn job is start to run......");
			pw.flush();
		} catch (Exception e) {
			e.printStackTrace();
			resp.getWriter().println(e.getMessage());
		}finally {
		    if( null != pw) {
		    	pw.close();	
		    }
		}
	}
	
	public void runSyn(String type) throws Exception {

		//初始化生成表的脚本
		RunInitScript rs = new RunInitScript();
		rs.initTargets();
		//初始化完成
		
		if("".equals(type)) type = null;
		
		StartRuning run = new StartRuning();
		run.runSynImgs(type);
		
		loger.info("syn Img data starting ............");
		SynData synData = new SynData();
		synData.startRunning(type);
		loger.info("syn Img data is running ............");
	}
}
