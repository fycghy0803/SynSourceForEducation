package com.hysoft.process.database.source.mysql.dao;

import java.sql.ResultSet;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.SourceParentDao;
import com.hysoft.process.database.source.mysql.model.FzSubject;
import com.hysoft.process.database.source.sqlserver2000.dao.Doc5DoclibDao;

public class FzSubjectDao extends SourceParentDao {

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		String pid = rs.getString("pid");
		FzSubject form = new FzSubject();
		form.setId(rs.getString("id"));
		form.setPid(pid);
		form.setLibid(rs.getString("libid"));
		form.setName(rs.getString("name"));
		form.setAuthors(rs.getString("authors"));
		form.setBuy(rs.getString("buy"));
		try{form.setTime(rs.getString("time"));}catch(Exception e) {}
		form.setSubjectid(rs.getString("subjectid"));
		form.setSubject(rs.getString("subject"));
		form.setProductlibid(rs.getString("productlibid"));
		form.setProductid(rs.getString("productid"));
		form.setProduct(rs.getString("product"));
		form.setNianji(rs.getString("nianji"));
		form.setBanben(rs.getString("banben"));
		form.setClassName(rs.getString("class"));
		form.setDiqv(rs.getString("diqv"));
		form.setNianfen(rs.getString("nianfen"));
		form.setNum(rs.getString("num"));
		form.setS(rs.getString("s"));
		form.setT(rs.getString("t"));
		form.setDel(rs.getString("del"));
		form.setGaostu_pid(rs.getString("gaostu_pid"));
		form.setAnswertime(rs.getString("answertime"));
		form.setLianji1(rs.getString("lianji1"));
		form.setLianji2(rs.getString("lianji2"));
		form.setLianji3(rs.getString("lianji3"));
		form.setLianji4(rs.getString("lianji4"));
		form.setLianji5(rs.getString("lianji5"));
		form.setLianji6(rs.getString("lianji6"));
		form.setLianji7(rs.getString("lianji7"));
		form.setLianji8(rs.getString("lianji8"));
		form.setLianji9(rs.getString("lianji9"));
		form.setLianji10(rs.getString("lianji10"));
		
		setDoc5DoclibForm(pid,form);
		if(null == form.getDOC_ID() || ("".equals(form.getDOC_ID())) ) {
			form.setDOC_ID(form.getPid());
		}
		
		if(null == form.getSYS_DOCUMENTID() ||  ("".equals(form.getSYS_DOCUMENTID())) ) {
			form.setSYS_DOCUMENTID(form.getPid());
			form.setSYS_DELETEFLAG("0");
			form.setSYS_ISLOCKED("0");
			form.setSYS_CREATED(form.getTime());
			form.setSYS_LASTMODIFIED(form.getTime());
		}
		
		return form;
	}	
	
	private void setDoc5DoclibForm(String pid,FzSubject fzForm){
		Doc5DoclibDao doc5Dao = new Doc5DoclibDao();
		doc5Dao.setConnection(this.getConnAn());
		doc5Dao.setSingleFormById(pid, fzForm);
	}
	
	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new FzSubject();
	}
   
	public boolean isSplitPage() {
		return true;
	}
}
