package com.hysoft.util.forms;

public class DatabaseForm {
    private String databaseAddress;
    private int port;
    private String loginName;
    private String pwd;
    private String databaseName;
    private String desc;
    private String databaseCharSet;
    private String serverId;
    private String synContent = "";
    private String mysqlBinPath = "";
    private String serverCode = "";
    
	public String getSynContent() {
		return synContent;
	}
	public void setSynContent(String synContent) {
		this.synContent = synContent;
	}
	public String getDatabaseAddress() {
		return databaseAddress;
	}
	public void setDatabaseAddress(String databaseAddress) {
		this.databaseAddress = databaseAddress;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getDatabaseName() {
		return databaseName;
	}
	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getDatabaseCharSet() {
		return databaseCharSet;
	}
	public void setDatabaseCharSet(String databaseCharSet) {
		this.databaseCharSet = databaseCharSet;
	}
	public String getServerId() {
		return serverId;
	}
	public void setServerId(String serverId) {
		this.serverId = serverId;
	}
	public String getMysqlBinPath() {
		return mysqlBinPath;
	}
	public void setMysqlBinPath(String mysqlBinPath) {
		this.mysqlBinPath = mysqlBinPath;
	}
	public String getServerCode() {
		return serverCode;
	}
	public void setServerCode(String serverCode) {
		this.serverCode = serverCode;
	}
}
