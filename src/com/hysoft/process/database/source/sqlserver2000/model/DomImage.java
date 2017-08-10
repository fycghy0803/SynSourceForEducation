package com.hysoft.process.database.source.sqlserver2000.model;

import com.hysoft.process.database.DatabaseSql;

public class DomImage implements DatabaseSql {
    private String docId;
    private String doclibId;
    private String imgFormat;
    private String imgSize;
    private String imgCreated;
    private String refId;
    private String imgSmall;
    private String imgMiddle;
    private String imgLargePath;
    private String imgJpgPath;
    private String imgWidth;
    private String imgHeight;
    private int currentPage;
    
	public String getImgWidth() {
		return imgWidth;
	}

	public void setImgWidth(String imgWidth) {
		this.imgWidth = imgWidth;
	}

	public String getImgHeight() {
		return imgHeight;
	}

	public void setImgHeight(String imgHeight) {
		this.imgHeight = imgHeight;
	}

	public String getDocId() {
		return docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}

	public String getDoclibId() {
		return doclibId;
	}

	public void setDoclibId(String doclibId) {
		this.doclibId = doclibId;
	}

	public String getImgFormat() {
		return imgFormat;
	}

	public void setImgFormat(String imgFormat) {
		this.imgFormat = imgFormat;
	}

	public String getImgSize() {
		return imgSize;
	}

	public void setImgSize(String imgSize) {
		this.imgSize = imgSize;
	}

	public String getImgCreated() {
		return imgCreated;
	}

	public void setImgCreated(String imgCreated) {
		this.imgCreated = imgCreated;
	}

	public String getRefId() {
		return refId;
	}

	public void setRefId(String refId) {
		this.refId = refId;
	}

	public String getImgSmall() {
		return imgSmall;
	}

	public void setImgSmall(String imgSmall) {
		this.imgSmall = imgSmall;
	}

	public String getImgMiddle() {
		return imgMiddle;
	}

	public void setImgMiddle(String imgMiddle) {
		this.imgMiddle = imgMiddle;
	}

	public String getImgLargePath() {
		return imgLargePath;
	}

	public void setImgLargePath(String imgLargePath) {
		this.imgLargePath = imgLargePath;
	}

	public String getImgJpgPath() {
		return imgJpgPath;
	}

	public void setImgJpgPath(String imgJpgPath) {
		this.imgJpgPath = imgJpgPath;
	}

	public String getSql() {
		String sql = "select top " + DatabaseSql.PAGE_COUNT +  " doc_id,doclib_id,img_height,img_width,img_format,img_size,img_created," +
		"    refid,img_small,img_middle,img_large_path,img_jpg_path " +
		"    from dom_image di " +
		"   where di.refid not in (select top " + DatabaseSql.PAGE_COUNT * this.currentPage + " refid from dom_image dit order by dit.refid) order by di.refid"; 
		return sql;
	}

	public String getImgColumnName() {
		return "img_large_path";
	}

	public String getImgPath(String sourcePath) {
		String[] tempStrs = sourcePath.split(",");
		if(tempStrs.length == 2) {
			return tempStrs[1];
		}
		
		return sourcePath;
	}

	public String deleteSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String isExistByDatabaseFormSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String isExistByKeyIdSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String updateSql() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getCount() {
		String sql = "select count(1) from dom_image";
		return sql;
	}

	public void setCurrentPage(int pageNumber) {
		this.currentPage = pageNumber;
	}
}
