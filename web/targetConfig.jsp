<%@ page import="com.hysoft.util.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <title>目标库信息查询</title>
      <meta content="text/html;charset=GBK" http-equiv="Content-Type">
    <%
        String contentPath = request.getContextPath();
    %>
      <style type="text/css">
          html{}
          body{
              font: 13px "微软雅黑","宋体","黑体";
              background-color: #E6E6E6;
              margin: 0;
              padding: 0;
          }
          a{
              text-decoration: none;
          }
          .wrapDiv{
              width: 860px;
              clear: both;
              margin-left: auto;
              margin-right: auto;
              margin-top: 50px;
              margin-bottom: 0;
              background-color: white;
              height: 100%;
              padding: 10 30 ;
              position : relative;
          }

          .title{
              font-weight: bold;
          }
          .checkOptionBorder{
              width: 700px;
              clear: both
          }
          .checkOption{
              width:150px;
              float:left;
          }
          .inputSingleBorder{
              width: 340px;;
              margin-top: 5px;
              margin-bottom: 5px;
              border-left: 0px;
              border-top: 0px;
              border-right: 0px;
          }
          .labelInfo{
              margin: 0 4;
              font-weight: bold;
              font-size: 15px;

          }

          .titleDiv{
              font-weight: bold;
              font-size: 20px;
              text-align: center;
          }
      </style>
      <script type="text/javascript">
          function showInfo(){

          }
          function editInfo(){

          }
          function deleteInfo(id,name){
              if(window.confirm("你确定要删除目标库："+name)){
                  return true;
              }
               return false;
          }
          function search(){
              document.getElementById("configInfo").submit();
              return true;
          }
      </script>
  </head>
  <body>
  <div class="wrapDiv">
      <div style="padding: 10px 30px;height: 100%;">
          <div class="titleDiv">目标库信息查询</div>
        <form id="configInfo" name="configInfo" action="<%=contentPath%>/configInfo.htm" method="post">
            <input type="hidden" name="act" value="query" />
            <div class="checkOptionBorder">
                <div class="inputSingleBorder"><label for="schoolName" class="labelInfo">目标库名称:</label>
                    <input class="inputSingle" type="text" id="schoolName" name="schoolName" value="<%=CommonTools.getStr(request.getAttribute("schoolName"))%>"></div>
             </div>
         <div style="clear: both"/>
            <input type="submit" value="查询" />
            <a href="<%=contentPath%>/configInfo.htm?act=addInfo">新增</a>
            <div style="margin-top: 10px;">
                <table id="resultTbl" border="1x" cellpadding="0" cellspacing="0">
                    <thead>
                     <tr>
                           <th style="width:50px;">序号</th>
                           <th style="width:600px;">目标库名称</th>
                           <th style="width: 200px;text-align: center;">操作</th>
                     </tr>
                    </thead>
                    <tbody>
                      <%
                          Map<String,String> configInfoMap = (HashMap<String,String>)(request.getAttribute("configInfoMap"));
                          if(configInfoMap==null){
                              %>
                      <tr>
                          <td colspan="3" style="text-align: center;">请点击“<a href="javascript:search();">查询</a>”进行查询 或 单据“<a href="<%=contentPath%>/configInfo.htm?act=addInfo">新增</a>”按钮添加目标库信息。</td>
                      </tr>
                      <%
                          }else{

                          if(configInfoMap != null && !configInfoMap.isEmpty()){
                              int i = 1;
                              for(String key:configInfoMap.keySet()){
                       %>
                      <tr>
                          <td style="text-align: center;"><%=i%></td>
                          <td style="text-align: center;"><a href="<%=contentPath%>/configInfo.htm?act=showInfo&id=<%=key%>" onclick="showInfo('<%=key%>');" ><%=configInfoMap.get(key)%></a></td>
                          <td style="text-align: center;"><a href="<%=contentPath%>/configInfo.htm?act=addInfo&id=<%=key%>" onclick="editInfo('<%=key%>');" ><img width="20px" height="20px" border="0px" src="<%=contentPath%>/images/edit.gif" alt="点击进行编辑"/></a>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=contentPath%>/configInfo.htm?act=deleteInfo&id=<%=key%>" onclick="return deleteInfo('<%=key%>','<%=configInfoMap.get(key)%>');"><img width="20px" height="20px" border="0px" src="<%=contentPath%>/images/delete.jpg" alt="点击进行删除"/></a>
                          </td>
                      </tr>
                      <%         i++;
                              }
                      }else{
                      %>
                      <tr>
                          <td colspan="3" style="text-align: center;color: red;">没有你要查询的信息！</td>
                      </tr>
                      <%
                      }
                          }%>
                    </tbody>
                </table>
            </div>
        </form>
      </div>
    </div>
  <script type="text/javascript">
      var windowHeight = window.scrollHeight;
      var scrollHeight = document.getElementById("resultTbl");
      sc
  </script>
  </body>
</html>
