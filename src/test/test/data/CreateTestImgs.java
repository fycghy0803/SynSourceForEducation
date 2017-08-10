package test.data;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.hysoft.process.database.source.mysql.model.FzMathmlImg;
import com.hysoft.process.database.source.sqlserver2000.model.DomImage;
import com.hysoft.util.database.sub.MySqlDatabaseOption;
import com.hysoft.util.database.sub.SqlServer2000Option;
import com.hysoft.util.xml.SourceServerForXML;

public class CreateTestImgs {
   public void createTest() throws Exception {
	   SourceServerForXML sXml = SourceServerForXML.getInstance();
   	   sXml.setSourceForms();
   	   
      MySqlDatabaseOption msOption = new MySqlDatabaseOption();
      msOption.setDbForm(sXml.getMySqlForm());
      msOption.setConnection(sXml.getMySqlForm());
      Connection conn = msOption.getConnection();
	  String sql = new FzMathmlImg().getSql();
	  Statement st = conn.createStatement();
	  ResultSet rs = st.executeQuery(sql);
	  while(rs.next()) {
		   String filepath = "c:/ftp/" + rs.getString("filepath");
		   System.out.println(filepath);
		   File f = new File(filepath);
		   f.getParentFile().mkdirs();
		   f.createNewFile();
	  }
   }
   
   public void createTest2000() throws Exception {
	   SourceServerForXML sXml = SourceServerForXML.getInstance();
   	   sXml.setSourceForms();
   	   
   	  SqlServer2000Option msOption = new SqlServer2000Option();
      msOption.setDbForm(sXml.getSqlServerForm());
      msOption.setConnection();
      Connection conn = msOption.getConnection();
	  String sql = new DomImage().getSql();
	  Statement st = conn.createStatement();
	  ResultSet rs = st.executeQuery(sql);
	  while(rs.next()) {
		   String[] ret = rs.getString("img_large_path").split(",");
		   String filepath = "c:/ftp/" + ret[1];
		   System.out.println(filepath);
		   File f = new File(filepath);
		   f.getParentFile().mkdirs();
		   f.createNewFile();
	  }
   }
   
   public static void main(String[] args) {
	   try {
		   new CreateTestImgs().createTest2000();
	} catch (Exception e) {
		e.printStackTrace();
	}
   }
}
