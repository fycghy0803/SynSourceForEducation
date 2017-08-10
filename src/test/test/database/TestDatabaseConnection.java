package test.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.util.database.sub.SqlServer2000Option;
import com.hysoft.util.forms.DatabaseForm;

import junit.framework.TestCase;

public class TestDatabaseConnection extends TestCase {
   public void testSerer2000() throws Exception{
	   SqlServer2000Option sOption = new SqlServer2000Option();
	   DatabaseForm dbForm = new DatabaseForm();
	   dbForm.setDatabaseAddress("127.0.0.1");
	   dbForm.setPort(14330);
	   dbForm.setLoginName("sa");
	   dbForm.setPwd("sa");
	   dbForm.setDatabaseName("exam");
	   sOption.setDbForm(dbForm);
	   sOption.setConnection();
	   Connection conn = sOption.getConnection();
	   
	   String sql = "select top " + DatabaseSql.PAGE_COUNT +  " doc_id,doclib_id,img_height,img_width,img_format,img_size,img_created," +
		"    refid,img_small,img_middle,img_large_path,img_jpg_path " +
		"    from dom_image di " +
		"   where di.refid not in (select top " + DatabaseSql.PAGE_COUNT * (1-1) + " refid from dom_image dit order by dit.refid) order by di.refid"; 
	   System.out.println(sql);
	   PreparedStatement ps = conn.prepareCall(sql);
	   ResultSet rs = ps.executeQuery();
	   while(rs.next()) {
		   System.out.println( rs.getString("refid"));
	   }
   }
}
