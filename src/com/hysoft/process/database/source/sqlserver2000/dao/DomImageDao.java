package com.hysoft.process.database.source.sqlserver2000.dao;

import java.sql.ResultSet;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.ImgParentDao;
import com.hysoft.process.database.source.sqlserver2000.model.DomImage;

public class DomImageDao  extends Sqlserver2000Dao implements ImgParentDao{

	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		DomImage dImage = new DomImage();
		dImage.setDocId(rs.getString("doc_id"));
		dImage.setDoclibId(rs.getString("doclib_id"));
		dImage.setImgCreated(rs.getString("img_created"));
		dImage.setImgFormat(rs.getString("img_format"));
		dImage.setImgJpgPath(rs.getString("img_jpg_path"));
		dImage.setRefId(rs.getString("refid"));
		dImage.setImgSmall(rs.getString("img_small"));
		dImage.setImgMiddle(rs.getString("img_middle"));
		dImage.setImgLargePath(rs.getString("img_large_path"));
		dImage.setImgHeight(rs.getString("img_height"));
		dImage.setImgWidth(rs.getString("img_width"));
		return dImage;
	}

	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new DomImage();
	}

	public String getImgPath(DatabaseSql sourcePath) {
		DomImage dImage = ((DomImage)sourcePath);
		return dImage.getImgPath(dImage.getImgLargePath());
	}

	public boolean isSplitPage() {
		return true;
	}
}
