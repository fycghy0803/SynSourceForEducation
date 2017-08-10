package com.hysoft.process.database.source.mysql.dao;

import java.sql.ResultSet;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.source.ImgParentDao;
import com.hysoft.process.database.source.SourceParentDao;
import com.hysoft.process.database.source.mysql.model.FzMathmlImg;

public class FzMathmlImgDao extends SourceParentDao implements ImgParentDao{
    
	@Override
	public DatabaseSql getRsData(ResultSet rs) throws Exception {
		 FzMathmlImg form = new FzMathmlImg();
		 form.setHash(rs.getString("hash"));
		 form.setDocumentid(rs.getString("documentid"));
		 form.setFilepath(rs.getString("filepath"));
		 form.setRemote(rs.getString("remote"));
		 return form;
	}

	@Override
	public void setDatabaseSql() throws Exception {
		this.databaseSql = new FzMathmlImg();
	}

	public String getImgPath(DatabaseSql sourcePath) {
		return ((FzMathmlImg)sourcePath).getFilepath();
	}

	public boolean isSplitPage() {
		return true;
	}
    
}
