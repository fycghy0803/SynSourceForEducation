package com.hysoft.process.database.target.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.log4j.Logger;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.target.model.SynOperationLog;

public abstract class TargetParentDao implements SourceDao {
    protected Connection conn;
    protected List<DatabaseSql> listcTypes;
    protected DatabaseSql targetDatabaseSql;
    protected Logger loger = Logger.getRootLogger();
    protected int synSuccCount = 0;
    protected int synFailCount = 0;
    protected int synInsertCount = 0;
    protected int synUpdateCount = 0;
    protected int synExistsCount = 0;
    protected int currentPage = 0;
    protected int synPageTotalCount = 0;
    protected String dataType = "";
    
	public DatabaseSql getTargetDatabaseSql() {
		return targetDatabaseSql;
	}

	public void setTargetDatabaseSql(DatabaseSql targetDatabaseSql) {
		this.targetDatabaseSql = targetDatabaseSql;
	}

	public int getSynInsertCount() {
		return synInsertCount;
	}

	public void setSynInsertCount(int synInsertCount) {
		this.synInsertCount = synInsertCount;
	}

	public int getSynUpdateCount() {
		return synUpdateCount;
	}

	public void setSynUpdateCount(int synUpdateCount) {
		this.synUpdateCount = synUpdateCount;
	}

	public int getSynExistsCount() {
		return synExistsCount;
	}

	public void setSynExistsCount(int synExistsCount) {
		this.synExistsCount = synExistsCount;
	}

	public int getSynPageTotalCount() {
		return synPageTotalCount;
	}

	public void setSynPageTotalCount(int synPageTotalCount) {
		this.synPageTotalCount = synPageTotalCount;
	}

	public void setSynSuccCount(int synSuccCount) {
		this.synSuccCount = synSuccCount;
	}

	public int getSynSuccCount() {
		return synSuccCount;
	}

	public int getSynFailCount() {
		return synFailCount;
	}
	
	public void setSynFailCount(int synFailCount) {
		this.synFailCount = synFailCount;
	}

	public Connection getConnection() {
		return conn;
	}

	public void insertDataBySource() throws Exception {
		if(null == targetDatabaseSql) setTargetDatabaseSql();
		PreparedStatement ps = null;
		boolean insRet = false;
		synSuccCount = 0;
		synFailCount = 0;
		synInsertCount = 0;
		synUpdateCount = 0;
		synExistsCount = 0;
		synPageTotalCount = 0;
		
		try{
			for(DatabaseSql cTypeForm : listcTypes) {
				insRet = false;
				synPageTotalCount++;
				try {
				   ps = conn.prepareStatement(targetDatabaseSql.getSql());					
				   if(!isExistByKeyId(cTypeForm)) {
					   this.insertDataByPreMent(ps,cTypeForm);
					   synInsertCount++;
				   } else if(!isExistsByDatabaseForm(cTypeForm)){
					   this.deleteData(cTypeForm);
					   insertDataByPreMent(ps,cTypeForm);
					   synUpdateCount++;
				   } else {
					   synExistsCount++;
				   }
				   
				   insRet = true;
				   synSuccCount++;
				}catch(Exception e) {
					synFailCount++;
					loger.error(e);
					e.printStackTrace();
				}finally{
					try{
					   if(insRet) {conn.commit();}else {conn.rollback();}
					   if(null != ps) ps.close();
					}catch(Exception e){
						e.printStackTrace();
						loger.error(e);
					}
				}
			}
		}catch(Exception e) {
			loger.error(e);
			e.printStackTrace();
		}finally {
			loger.error("synPageTotalCount :" + synPageTotalCount + ";synInsertCount:" + synInsertCount);
			loger.error("synFailCount :" + synFailCount + ";synSuccCount:" + synSuccCount);
			loger.error("synUpdateCount :" + synUpdateCount + ";synExistsCount:" + synExistsCount);
			
			insertLog(); //write operation log
			if(null != ps) { 
				try{
					ps.close();
					ps = null;
					conn.close();
				}catch(Exception e){
					loger.error(e);
					e.printStackTrace();
				}
			}
		}
	}

	public void clearCount() {
		this.setSynExistsCount(0);
		this.setSynFailCount(0);
		this.setSynSuccCount(0);
		this.setSynInsertCount(0);
		this.setSynPageTotalCount(0);
		this.setSynInsertCount(0);
		this.setSynUpdateCount(synUpdateCount);
	}
	
	public void insertLog() {
		SynOperationLog sLogForm = new SynOperationLog();
		sLogForm.setSyn_data_type(this.dataType);
		sLogForm.setSyn_page_number(this.currentPage);
		sLogForm.setSyn_TotalCount(this.synPageTotalCount);
		sLogForm.setSyn_Success_Count(this.synSuccCount);
		sLogForm.setSyn_failure_Count(this.synFailCount);
		sLogForm.setSyn_Exists_Count(this.synExistsCount);
		sLogForm.setSyn_Insert_Count(this.synInsertCount);
		sLogForm.setSyn_Update_Count(this.synUpdateCount);
		String cat = "";
		
		try{
			cat = conn.getMetaData().getURL();
			sLogForm.setTargetIp(cat);
		}catch(Exception e) {}
		
		SynOperationLogDao sLogDao = new SynOperationLogDao(conn);
		boolean ret = sLogDao.insertLog(sLogForm);
		try{
			if(ret) {
				conn.commit();
			}else {
				conn.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
			loger.error(e);
		}
	}
	
	public abstract void setTargetDatabaseSql();
	public abstract void insertDataByPreMent(PreparedStatement ps,DatabaseSql cTypeForm) throws Exception;
	public abstract void setPsExistByKeyId(PreparedStatement ps,DatabaseSql db);
	public abstract void setPsExistDatabaseForm(PreparedStatement ps,DatabaseSql db);
	public abstract void setPsExistDeleteData(PreparedStatement ps,DatabaseSql db);
	
	protected boolean isExistByKeyId(DatabaseSql db){
		String sql = this.targetDatabaseSql.isExistByKeyIdSql();
		return isExists(db,sql,1);
	}
	
	private boolean isExists(DatabaseSql db,String sql,int type) {
		boolean lb = false;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement(sql);
			if(type == 1) {
				setPsExistByKeyId(ps,db);
			}else if(type == 2) {
				setPsExistDatabaseForm(ps,db);
			}
			
			rs = ps.executeQuery();
			lb = rs.next();
		} catch (SQLException e) {
			loger.error(e);
			e.printStackTrace();
		} finally {
			if(null == rs) try{rs.close();}catch(Exception e){}
			if(null == ps) try{ps.close();}catch(Exception e){}
		}
		
		return lb;
	}
	
	protected boolean isExistsByDatabaseForm(DatabaseSql db) {
		String sql = this.targetDatabaseSql.isExistByDatabaseFormSql();
		return isExists(db,sql,2);
	}

	protected void deleteData(DatabaseSql db) throws Exception{
	   	String sql = this.targetDatabaseSql.deleteSql();
	   	PreparedStatement ps = null;
	   	try {
	   		ps = conn.prepareStatement(sql);
	   		setPsExistDeleteData(ps,db);
	   		ps.executeUpdate();
		} catch (SQLException e) {
			loger.error(e);
			e.printStackTrace();
		} finally {
			if(null == ps) try{ps.close();}catch(Exception e){}
		}
	}
	
	public void setConnection(Connection conn) {
       this.conn = conn;  
	}

	public void setDataByRS(DatabaseSql rs) throws Exception {

	}

	public List getSourceData() throws Exception {
		return listcTypes;
	}

	public void setSourceData(List dataList) {
		this.listcTypes = dataList;
	}
	
	public int getCurrentPage(){
		return currentPage;
	}

	public int getCount() {
		int count = 0;
		String sql = this.targetDatabaseSql.getCount();
		ResultSet rt = null;
		try {
			Statement st = conn.createStatement();
			rt = st.executeQuery(sql);
			count = rt.getInt(1);
		} catch (SQLException e) {
			loger.error(e);
			e.printStackTrace();
		}finally {
			if(null != rt) try{rt.close();}catch(Exception e){}
		}
		
		return count;
	}
	
	
	public void setCurrentPage(int page){
		this.currentPage = page;
	}
	
}
