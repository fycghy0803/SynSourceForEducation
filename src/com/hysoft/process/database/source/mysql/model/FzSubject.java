package com.hysoft.process.database.source.mysql.model;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.sqlserver2000.model.Doc5Doclib;

public class FzSubject extends Doc5Doclib implements DatabaseSql {
	private String id;
	private String   pid;
	private String   libid;
	private String   name;
	private String   authors ;
	private String   buy ;
	private String   time;
	private String   subjectid ;
	private String   subject ;
	private String   productlibid ;
	private String   productid ;
	private String   product ;
	private String  nianji ;
	private String   banben ;
	private String  className ;
	private String  diqv ;
	private String  nianfen;
	private String  num;
	private String  s;
	private String  t;
	private String  del;
	private String gaostu_pid;
	private String  answertime;
	private String   lianji1;
	private String   lianji2;
	private String   lianji3 ;
	private String   lianji4 ;
	private String   lianji5 ;
	private String   lianji6 ;
	private String   lianji7 ;
	private String   lianji8 ;
	private String   lianji9 ;
	private String   lianji10 ;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getLibid() {
		return libid;
	}

	public void setLibid(String libid) {
		this.libid = libid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthors() {
		return authors;
	}

	public void setAuthors(String authors) {
		this.authors = authors;
	}

	public String getBuy() {
		return buy;
	}

	public void setBuy(String buy) {
		this.buy = buy;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSubjectid() {
		return subjectid;
	}

	public void setSubjectid(String subjectid) {
		this.subjectid = subjectid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getProductlibid() {
		return productlibid;
	}

	public void setProductlibid(String productlibid) {
		this.productlibid = productlibid;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getNianji() {
		return nianji;
	}

	public void setNianji(String nianji) {
		this.nianji = nianji;
	}

	public String getBanben() {
		return banben;
	}

	public void setBanben(String banben) {
		this.banben = banben;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getDiqv() {
		return diqv;
	}

	public void setDiqv(String diqv) {
		this.diqv = diqv;
	}

	public String getNianfen() {
		return nianfen;
	}

	public void setNianfen(String nianfen) {
		this.nianfen = nianfen;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getS() {
		return s;
	}

	public void setS(String s) {
		this.s = s;
	}

	public String getT() {
		return t;
	}

	public void setT(String t) {
		this.t = t;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getGaostu_pid() {
		return gaostu_pid;
	}

	public void setGaostu_pid(String gaostu_pid) {
		this.gaostu_pid = gaostu_pid;
	}

	public String getAnswertime() {
		return answertime;
	}

	public void setAnswertime(String answertime) {
		this.answertime = answertime;
	}

	public String getLianji1() {
		return lianji1;
	}

	public void setLianji1(String lianji1) {
		this.lianji1 = lianji1;
	}

	public String getLianji2() {
		return lianji2;
	}

	public void setLianji2(String lianji2) {
		this.lianji2 = lianji2;
	}

	public String getLianji3() {
		return lianji3;
	}

	public void setLianji3(String lianji3) {
		this.lianji3 = lianji3;
	}

	public String getLianji4() {
		return lianji4;
	}

	public void setLianji4(String lianji4) {
		this.lianji4 = lianji4;
	}

	public String getLianji5() {
		return lianji5;
	}

	public void setLianji5(String lianji5) {
		this.lianji5 = lianji5;
	}

	public String getLianji6() {
		return lianji6;
	}

	public void setLianji6(String lianji6) {
		this.lianji6 = lianji6;
	}

	public String getLianji7() {
		return lianji7;
	}

	public void setLianji7(String lianji7) {
		this.lianji7 = lianji7;
	}

	public String getLianji8() {
		return lianji8;
	}

	public void setLianji8(String lianji8) {
		this.lianji8 = lianji8;
	}

	public String getLianji9() {
		return lianji9;
	}

	public void setLianji9(String lianji9) {
		this.lianji9 = lianji9;
	}

	public String getLianji10() {
		return lianji10;
	}

	public void setLianji10(String lianji10) {
		this.lianji10 = lianji10;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = 
			"select  id,\n" +
			"   pid,\n" + 
			"   libid,\n" + 
			"   name,\n" + 
			"   authors ,\n" + 
			"   buy ,\n" + 
			"   time,\n" + 
			"   subjectid ,\n" + 
			"   subject ,\n" + 
			"   productlibid ,\n" + 
			"   productid ,\n" + 
			"   product ,\n" + 
			"   nianji ,\n" + 
			"   banben ,\n" + 
			"   class ,\n" + 
			"   diqv ,\n" + 
			"   nianfen,\n" + 
			"   num,\n" + 
			"   s,\n" + 
			"   t,\n" + 
			"   del,\n" + 
			"   gaostu_pid,\n" + 
			"   answertime,\n" + 
			"   lianji1,\n" + 
			"   lianji2,\n" + 
			"   lianji3 ,\n" + 
			"   lianji4 ,\n" + 
			"   lianji5 ,\n" + 
			"   lianji6 ,\n" + 
			"   lianji7 ,\n" + 
			"   lianji8 ,\n" + 
			"   lianji9 ,\n" + 
			"   lianji10 from fz_subject limit ?," + DatabaseSql.PAGE_COUNT ;
		return sql;
	}
	

	public String  getCount() {
		String sql = "select count(1) from fz_subject";
		return sql;
	}

}
