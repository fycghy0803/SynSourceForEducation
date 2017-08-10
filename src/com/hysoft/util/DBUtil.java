package com.hysoft.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.hysoft.util.database.sub.MySqlDatabaseOption;
import com.hysoft.util.forms.DatabaseForm;
import com.hysoft.util.xml.SourceServerForXML;

/**
 * Created by dell on 2015-03-26.
 */
public class DBUtil {
    public static Connection getConn() throws Exception{
    	SourceServerForXML ssXml = SourceServerForXML.getInstance();
    	ssXml.setSourceForms();
    	DatabaseForm dbForm = ssXml.getMySqlForm();
    	MySqlDatabaseOption mySqlOption = new MySqlDatabaseOption();
    	mySqlOption.setDbForm(dbForm);
    	mySqlOption.setConnection(dbForm);
    	return mySqlOption.getConnection();
    }

    public static void closeConn(Connection conn){
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



}
