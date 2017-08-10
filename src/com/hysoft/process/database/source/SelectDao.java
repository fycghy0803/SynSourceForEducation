package com.hysoft.process.database.source;

import java.util.List;

import com.hysoft.process.database.target.dao.SourceDao;

public interface SelectDao extends SourceDao {
    public List getSourceData();
    public int getCurrentPage();
	public void setCurrentPage(int currentPage);
	public boolean isSplitPage();
}
