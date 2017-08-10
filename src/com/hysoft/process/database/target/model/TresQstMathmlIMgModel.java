package com.hysoft.process.database.target.model;

import com.hysoft.process.database.DatabaseSql;

public class TresQstMathmlIMgModel implements DatabaseSql {
    private String mmlImgUuid;
    private String qstId;
    private String filePath;
    private String createTime;
    
	public String getMmlImgUuid() {
		return mmlImgUuid;
	}

	public void setMmlImgUuid(String mmlImgUuid) {
		this.mmlImgUuid = mmlImgUuid;
	}

	public String getQstId() {
		return qstId;
	}

	public void setQstId(String qstId) {
		this.qstId = qstId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
		String sql = "insert into t_res_qst_mathml_img(mmlimg_uuid,qst_id,file_path,create_time) values(?,?,?,current_time)";
		return sql;
	}

	public String getImgColumnName() {
		return null;
	}

	public String deleteSql() {
		String sql = "delete from t_res_qst_mathml_img where mmlimg_uuid = ?";
		return sql;
	}

	public String updateSql() {
		return null;
	}

	public String isExistByDatabaseFormSql() {
		String sql = "select 1 from t_res_qst_mathml_img where mmlimg_uuid = ? and file_path = ?";
		return sql;
	}

	public String isExistByKeyIdSql() {
		String sql = "select 1 from t_res_qst_mathml_img where mmlimg_uuid = ?";
		return sql;
	}

	public String getCount() {
		String sql = "";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		// TODO Auto-generated method stub
		
	}
}
