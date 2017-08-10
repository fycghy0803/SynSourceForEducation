package com.hysoft.process.database.target.dao.sub;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.mysql.model.FzSubject;
import com.hysoft.process.database.target.dao.TargetParentDao;
import com.hysoft.process.database.target.model.TresPaper;

public class TresPaperDao extends TargetParentDao {
	public TresPaperDao() {
    	this.dataType = "TresPaper";
    }
	
	@Override
	public void insertDataByPreMent(PreparedStatement ps, DatabaseSql typeForm)
			throws Exception {
		FzSubject do5Form = (FzSubject)typeForm;
		String docId = do5Form.getDOC_ID();
		if(null == docId || "".equals(docId)) {
			return;
		}
		
		String sysDocId = do5Form.getSYS_DOCUMENTID();
		if(null == sysDocId || "".equals(sysDocId)) {
			return;
		}
		
		ps.setString(1, do5Form.getPid());
		ps.setString(2, do5Form.getName());
		ps.setString(3, do5Form.getPAPER_SCORE());
		ps.setString(4, do5Form.getAnswertime());
		ps.setString(5, do5Form.getBuy());
		ps.setString(6, do5Form.getNianfen());
		ps.setString(7, do5Form.getT());
		ps.setString(8, do5Form.getQST_COUNT());
		ps.setString(9, do5Form.getSubjectid());
		ps.setString(10, do5Form.getNianji());
		
		ps.setString(11, do5Form.getBanben());
		ps.setString(12, do5Form.getDiqv());
		ps.setString(13, do5Form.getClassName());
		ps.setString(14, null); //source_id
		ps.setString(15, do5Form.getSYS_DOCUMENTID());
		ps.setString(16, do5Form.getOLD_PAPER_CONTENT()); 
		ps.setString(17, do5Form.getPAPER_SCORE());
		ps.setString(18, do5Form.getPAPER_ANSWERTIME()); 
		ps.setString(19, do5Form.getPAPER_SCOPEID());
		ps.setString(20, do5Form.getPAPER_SCOPE()); 
		
		ps.setString(21, do5Form.getPAPER_SUBJECTID());
		ps.setString(22, do5Form.getPAPER_SUBJECT());
		ps.setString(23, do5Form.getPAPER_TYPE());
		ps.setString(24, do5Form.getQST_COUNT());
		ps.setString(25, do5Form.getProductlibid());
		ps.setString(26, do5Form.getProductid());
		ps.setString(27, do5Form.getProduct());
		ps.setString(28, do5Form.getPAPER_SOURCE());
		ps.setString(29, do5Form.getPAPER_AREA());
		ps.setString(30, do5Form.getPAPER_AREAID());
		
		ps.setString(31, do5Form.getPAPER_KIND());
		ps.setString(32, do5Form.getPAPER_KINDID());
		ps.setString(33, do5Form.getPAPER_GRADE());
		ps.setString(34, do5Form.getPAPER_GRADEID());
		ps.setString(35, do5Form.getPAPER_YEAR());
		ps.setString(36, do5Form.getPAPER_YEARID());
		ps.setString(37, do5Form.getSYS_DELETEFLAG());
		ps.setString(38, do5Form.getSYS_CREATED());
		ps.setString(39, do5Form.getSYS_LASTMODIFIED());
		ps.setString(40, do5Form.getSYS_LASTMODIFIED());
		ps.setString(41, do5Form.getDOC_ID());
		ps.execute();
	}

	@Override
	public void setTargetDatabaseSql() {
		this.targetDatabaseSql = new TresPaper();
	}

	@Override
	public void setPsExistByKeyId(PreparedStatement ps, DatabaseSql db) {
		FzSubject do5Form = (FzSubject)db;
		try {
			ps.setString(1, do5Form.getPid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDatabaseForm(PreparedStatement ps, DatabaseSql db) {
		FzSubject do5Form = (FzSubject)db;
		try {
			ps.setString(1, do5Form.getPid());
			ps.setString(2, do5Form.getSYS_LASTMODIFIED());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setPsExistDeleteData(PreparedStatement ps, DatabaseSql db) {
		setPsExistByKeyId(ps,db);
	}
}