package com.hysoft.process.database.target.model;

import com.hysoft.process.database.DatabaseSql;

public class TresQstImageModel implements DatabaseSql {
	private String imageId;
    private String qstId;
    private String imgLargePath;
    private String imgHeight;
    private String imgWidth;
    private String imgFormat;
    private String createDate;
    
	public String getImageId() {
		return imageId;
	}

	public void setImageId(String imageId) {
		this.imageId = imageId;
	}

	public String getQstId() {
		return qstId;
	}

	public void setQstId(String qstId) {
		this.qstId = qstId;
	}

	public String getImgLargePath() {
		return imgLargePath;
	}

	public void setImgLargePath(String imgLargePath) {
		this.imgLargePath = imgLargePath;
	}

	public String getImgHeight() {
		return imgHeight;
	}

	public void setImgHeight(String imgHeight) {
		this.imgHeight = imgHeight;
	}

	public String getImgWidth() {
		return imgWidth;
	}

	public void setImgWidth(String imgWidth) {
		this.imgWidth = imgWidth;
	}

	public String getImgFormat() {
		return imgFormat;
	}

	public void setImgFormat(String imgFormat) {
		this.imgFormat = imgFormat;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getImgColumnName() {
		return null;
	}

	public String getImgPath(String sourcePath) {
		return null;
	}

	public String getSql() {
	    String sql = "insert into t_res_qst_image(IMAGE_ID,QST_ID,IMG_LARGE_PATH,IMG_HEIGHT,IMG_WIDTH,IMG_FORMAT,CREATE_TIME) values(?,?,?,?,?,?,?)";
		return sql;
	}

	public String deleteSql() {
		String sql = "delete from t_res_qst_image where IMAGE_ID = ?";
		return sql;
	}
	
	public String updateSql() {
		return null;
	}

	public String isExistByDatabaseFormSql() {
		String sql = "select 1 from t_res_qst_image where IMAGE_ID = ? and IMG_LARGE_PATH = ?";
		return sql;
	}

	public String isExistByKeyIdSql() {
		String sql = "select 1 from t_res_qst_image where IMAGE_ID = ?";
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
