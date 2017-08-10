package com.hysoft.process.database.target.dao;

import com.hysoft.process.database.DatabaseSql;

public interface TargetOptionDao {
     public boolean isExist(DatabaseSql db);
     public void updateData(DatabaseSql db) throws Exception;
     public void delete(DatabaseSql db) throws Exception;
}
