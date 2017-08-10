package com.hysoft.process.database;

public interface DatabaseSql {
	public String getSql();
    public String getImgPath(String sourcePath);
    public String getImgColumnName();
    public String isExistByKeyIdSql();
    public String isExistByDatabaseFormSql();
    public String deleteSql();
    public String updateSql();
    public String getCount();
    public void setCurrentPage(int pageNumber);
    public int PAGE_COUNT = 1000;
    public int TYPE_OPT_2000 = 1;
    public int TYPE_OPT_MYSQL = 2;
}
