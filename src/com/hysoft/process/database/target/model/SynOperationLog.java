package com.hysoft.process.database.target.model;

public class SynOperationLog {
	private String syn_data_type;
	private int syn_page_number;
	private int syn_Success_Count;
	private int syn_failure_Count;
	private int syn_Insert_Count;
	private int syn_Update_Count;
	private int syn_Exists_Count;
	private int syn_TotalCount;
	private String  syn_date;
	private String targetIp;
	private String targetServerId;
	
	public String getTargetIp() {
		return targetIp;
	}

	public void setTargetIp(String targetIp) {
		this.targetIp = targetIp;
	}

	public String getTargetServerId() {
		return targetServerId;
	}

	public void setTargetServerId(String targetServerId) {
		this.targetServerId = targetServerId;
	}

	public String getSyn_data_type() {
		return syn_data_type;
	}

	public void setSyn_data_type(String syn_data_type) {
		this.syn_data_type = syn_data_type;
	}

	public int getSyn_page_number() {
		return syn_page_number;
	}

	public void setSyn_page_number(int syn_page_number) {
		this.syn_page_number = syn_page_number;
	}

	public int getSyn_Success_Count() {
		return syn_Success_Count;
	}

	public void setSyn_Success_Count(int syn_Success_Count) {
		this.syn_Success_Count = syn_Success_Count;
	}

	public int getSyn_failure_Count() {
		return syn_failure_Count;
	}

	public void setSyn_failure_Count(int syn_failure_Count) {
		this.syn_failure_Count = syn_failure_Count;
	}

	public int getSyn_Insert_Count() {
		return syn_Insert_Count;
	}

	public void setSyn_Insert_Count(int syn_Insert_Count) {
		this.syn_Insert_Count = syn_Insert_Count;
	}

	public int getSyn_Update_Count() {
		return syn_Update_Count;
	}

	public void setSyn_Update_Count(int syn_Update_Count) {
		this.syn_Update_Count = syn_Update_Count;
	}

	public int getSyn_Exists_Count() {
		return syn_Exists_Count;
	}

	public void setSyn_Exists_Count(int syn_Exists_Count) {
		this.syn_Exists_Count = syn_Exists_Count;
	}

	public int getSyn_TotalCount() {
		return syn_TotalCount;
	}

	public void setSyn_TotalCount(int syn_TotalCount) {
		this.syn_TotalCount = syn_TotalCount;
	}

	public String getSyn_date() {
		return syn_date;
	}

	public void setSyn_date(String syn_date) {
		this.syn_date = syn_date;
	}

	public String getInsertSql() {
		String sql = "insert into syn_operation_log(syn_data_type," +
				"syn_page_number," +
				"syn_Success_Count," +
				"syn_failure_Count," +
				"syn_Insert_Count," +
				"syn_Update_Count," +
				"syn_Exists_Count," +
				"syn_TotalCount," +
				"syn_date," +
				" target_ip" +
				" ) values(?,?,?,?,?,?,?,?,now(),?)";
		return sql;
	}
}
