<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String msg = (String)request.getAttribute("retMsg");
if(null == msg) msg = "";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Syn Process Main page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
	   input {
	     width:150px;
	   }
	 tr {
	    height:33px;
	 }  
	 
	</style>
	
  </head>
  
  <body>
    <form action="<%=basePath%>/synImgs.html" method="post">
    <input type="hidden" value="" name="type" id="type">
    <table border="1">
       <tr>
        <td colspan="2" align="center"><input type="submit" value="synAll" onclick="this.value='running...'"></td>
      </tr>
      
      <tr>
         <td><input type="submit" value="SynImgFilesFromMysql" onclick="this.value='running...';document.getElementById('type').value=8"></td>
         <td><input type="submit" value="SynImgFilesFromSqlServer" onclick="this.value='running...';document.getElementById('type').value=9"></td>
      </tr>
      
      <tr>
        <td>
        <input type="submit" value="SynQuestion" onclick="this.value='running...';document.getElementById('type').value='4'">
        </td>
        <td>
        <input type="submit" value="SynPaper" onclick="this.value='running...';document.getElementById('type').value='5'">
        </td>
        </tr>
        <tr>
        <td>
        <input type="submit" value="SynQstTeach" onclick="this.value='running...';document.getElementById('type').value='6'">
        </td>
        <td>
        <input type="submit" value="SynQstKey" onclick="this.value='running...';document.getElementById('type').value='7'">
        </td>
        </tr>
        <tr>
        <td>
        <input type="submit" value="SynPaperRelTeach" onclick="this.value='running...';document.getElementById('type').value='13'">
        </td>
        
        <td>
        </td>
        </tr>
        
        <tr>
        <td>
        <input type="submit" value="SynImgFromSql server2000" onclick="this.value='running...';document.getElementById('type').value='14'">
        </td>
        <td>
        <input type="submit" value="SynImgFromMySql" onclick="this.value='running...';document.getElementById('type').value='15'">
        </td>
        </tr>
        
      </table>
    </form>
    
    <div>
       <label>return result:</label><%=msg%>
    </div> 
  </body>
</html>
