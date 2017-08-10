package com.hysoft.util.database;

import java.sql.Connection;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.util.forms.DatabaseForm;

public interface DatabaseOption {
   public Connection getConnection() throws Exception;
   public void setDbForm(DatabaseForm dbForm);
   public DatabaseSql getCurrentSql();
   public void setCurrentSql(DatabaseSql databaseSql);
   public void setSourceDao(SourceDao sDao);
   public SourceDao getSourceDao();
}
