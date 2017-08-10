package com.hysoft.process.database.target.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.hysoft.process.database.target.model.SynOperationLog;

public class SynOperationLogDao {
	private SynOperationLog soLogModel = new SynOperationLog();
	private Connection conn;
	private Logger loger = Logger.getRootLogger();
	
	public SynOperationLogDao(Connection conn){
		this.conn = conn;
	}
	
	public boolean insertLog(SynOperationLog soLogForm){
		String insertSql = soLogModel.getInsertSql();
		PreparedStatement ps = null;
		boolean lb = false;
	   	try {
	   		ps = conn.prepareStatement(insertSql);
	   		ps.setString(1, soLogForm.getSyn_data_type());
	   		ps.setInt(2, soLogForm.getSyn_page_number());
	   		ps.setInt(3, soLogForm.getSyn_Success_Count());
	   		ps.setInt(4, soLogForm.getSyn_failure_Count());
	   		ps.setInt(5, soLogForm.getSyn_Insert_Count());
	   		ps.setInt(6, soLogForm.getSyn_Update_Count());
	   		ps.setInt(7, soLogForm.getSyn_Exists_Count());
	   		ps.setInt(8, soLogForm.getSyn_TotalCount());
	   		ps.setString(9, soLogForm.getTargetIp());
	   		ps.executeUpdate();
	   		lb = true;
		} catch (SQLException e) {
			e.printStackTrace();
			loger.error(e);
		} finally {
			if(null == ps) try{ps.close();}catch(Exception e){}
		}	
		
		return lb;
	}
}
