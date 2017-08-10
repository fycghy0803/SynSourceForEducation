package com.hysoft.util.forms;

public class TargetServerForm {
    private String connectDate;
    private String lastSynDate;
    private String synType;
    private String webServicePath;
    private String serverId;
    private String desc;
	private DatabaseForm databaseForm;
    private FtpForm ftpForm;
    private String synContent;
    private String synInterval;
    private String serverCode;
    private String synFlag;
        
	public String getSynFlag() {
		return synFlag;
	}
	public void setSynFlag(String synFlag) {
		this.synFlag = synFlag;
	}
	public String getSynContent() {
		return synContent;
	}
	public void setSynContent(String synContent) {
		this.synContent = synContent;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public DatabaseForm getDatabaseForm() {
		return databaseForm;
	}
	public void setDatabaseForm(DatabaseForm databaseForm) {
		this.databaseForm = databaseForm;
	}
	public FtpForm getFtpForm() {
		return ftpForm;
	}
	public void setFtpForm(FtpForm ftpForm) {
		this.ftpForm = ftpForm;
	}
	public String getConnectDate() {
		return connectDate;
	}
	public void setConnectDate(String connectDate) {
		this.connectDate = connectDate;
	}
	public String getLastSynDate() {
		return lastSynDate;
	}
	public void setLastSynDate(String lastSynDate) {
		this.lastSynDate = lastSynDate;
	}
	public String getSynType() {
		return synType;
	}
	public void setSynType(String synType) {
		this.synType = synType;
	}
	public String getWebServicePath() {
		return webServicePath;
	}
	public void setWebServicePath(String webServicePath) {
		this.webServicePath = webServicePath;
	}
	public String getServerId() {
		return serverId;
	}
	public void setServerId(String serverId) {
		this.serverId = serverId;
	}
	public String getSynInterval() {
		return synInterval;
	}
	public void setSynInterval(String synInterval) {
		this.synInterval = synInterval;
	}
	public String getServerCode() {
		return serverCode;
	}
	public void setServerCode(String serverCode) {
		this.serverCode = serverCode;
	}
}
