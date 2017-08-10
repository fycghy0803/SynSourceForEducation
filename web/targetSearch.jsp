<%@ page import="com.hysoft.util.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.hysoft.util.forms.ServerConfigForm" %>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    String contentPath = request.getContextPath();
%>
<html>
<head>
    <title>目标库信息查询</title>
    <meta content="text/html;charset=GBK" http-equiv="Content-Type"/>
    <style type="text/css">
        body{
            font: 13px "微软雅黑","宋体","黑体";
            background-color: #E6E6E6;
            margin: 0;
            padding: 0;
        }
        
        a{
            text-decoration: none;
        }
        #contentWrap{
            width: 860px;
            clear: both;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
            margin-bottom: 20;
            background-color: white;
            height: 100%;
            padding: 10 30 ;
            position : relative;
        }
        #header{
            height: 30px;
            clear: both;
        }
        #contentWrap{
            padding: 6px;
            clear: both;
        }
        #navDiv{
            width: 200px;
            float: left;
            border: solid 1px #000000;
            margin-right: 5px;
        }
        #navDiv ul{
            list-style: none;
            padding: 0;
            margin: 0;
        }
        #navDiv ul span{
            display: block;
            list-style: none;
            background-color: #c6c6c6;
            font-size: 15px;
            font-weight: bold;
            padding: 3px;
            color: #fff;
        }
        #navDiv ul li{
            margin: 10px;
            font-size: 13px;
            color: #0000ff;
            border-bottom: solid 1px #E6E6E6;
        }
        #navDiv ul li a{
            cursor: hand;
        }
        #contentDiv{
            width: 650px;
            float: left;
        }
        #searchDiv{
            border: solid 1px #000000;
            margin-bottom: 5px;
            padding-bottom: 3px;
            background-color: #E6E6E6;
        }
        .searchCls{
            margin: 5px;
        }
        #resultDiv{
            border: solid 1px #000000;

        }
        #footer{
            clear: both;
        }
        .titleCls{
            font-weight: bold;
            font-size: 15px;
            background-color: #00428c;
            padding: 5px;
            color: #fff;
            line-height:30px;
            height:30px;
        }
        .searchCls{
            background-color: #E6E6E6;

        }
        .inputSingleBorder{
            margin-top: 5px;
            margin-bottom: 5px;
            border-left: 0px;
            border-top: 0px;
            border-right: 0px;
        }
        .tblCls{
            width: 100%;
            margin: 0;
            padding: 0;
        }
        .tblCls th{
            padding: 0;
            margin: 0;
            background-color: #6c88ad;
            font-size: 15px;
        }
        .tblCls tbody{
            font-size: 15px;
        }
        .tblDivCls{
            margin: 0;
            padding: 0;
        }
        .evenCls td{
            background-color: #E6E6E6;
        }
        #footer{
            height: 30px;
            clear: both;
        }
        
        .optBtns {
          float:right;
          padding:0;
          margin:0;
          list-style:none;
        }
        
        .optBtns li{
          padding:0;
          float:left;
          margin:0;
          padding-right:5px;
        }
        
        .optBtns li input {
           border:1px solid #E6E6E6;
        }
        
        input.checkVal {
           width:20px;
           border:0;
           background-color:transparent;
        }
    </style>
    <script type="text/javascript">
        function showInfo(id){
            var url = "<%=contentPath%>/configInfo.htm?act=showInfo&id="+ id;
            var width = 850;
            var top = 20;
            window.open(url,
                    "shoeDetailConfig",
                            "height="+(window.screen.height-2*top)+"px,width="+width+"px,top="+top+"px,left="+((window.screen.width - width)/2)+"px,toolbar=no,menubar=no,scrollbars=YES,location=no,status=no");
            return false;
        }
        function editInfo(id){
            var url = "<%=contentPath%>/configInfo.htm?act=addInfo&id="+ id;
            var width = 850;
            var top = 20;
            window.open(url,
                    "editConfig",
                            "height="+(window.screen.height-2*top)+"px,width="+width+"px,top="+top+"px,left="+((window.screen.width - width)/2)+"px,toolbar=no,menubar=no,scrollbars=YES,location=no,status=no");
            return false;
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
        function addConfigInfo(){
            var width = 850;
            var top = 20;
            window.open("<%=contentPath%>/configInfo.htm?act=addInfo",
                    "addNewConfig",
                    "height="+(window.screen.height-2*top)+"px,width="+width+"px,top="+top+"px,left="+((window.screen.width - width)/2)+"px,toolbar=no,menubar=no,scrollbars=YES,location=no,status=no");
            return false;
        }
        function initInfo(){
            var currHeight = document.getElementById("contentWrap").clientHeight;
            var minHeight = window.screen.availHeight-170;
            if(currHeight < minHeight){
                document.getElementById("contentWrap").style.height = minHeight+"px";
            }
        }
        function createXMLHttpRequest() {
            var xmlhttp;
            try {
                xmlhttp = new ActiveXObject('Msxml2.XMLHTTP');
            } catch(e) {
                try {
                    xmlhttp = new ActiveXObject('Microsoft.XMLHTTP');
                } catch(e) {
                    try {
                        xmlhttp = new XMLHttpRequest();
                    } catch(e) {
                        alert("创建XMLHttpRequest对象失败！");
                    }
                }
            }
            return xmlhttp;
        }
        function updateSynFlag(id){
            if(!id) return;
            var url= '<%=contentPath%>/configInfo.htm';
            var params = "stamp="+(new Date())+"&act=modifySynFlag&id="+id;
            var httpRequestObject = createXMLHttpRequest();
            httpRequestObject.onreadystatechange = function(){
                if(httpRequestObject.readyState == 4) {
                    if (httpRequestObject.status == 200) {
                        var resTxt = httpRequestObject.responseText;
                        if(resTxt=="Y"){
                            alert("设置成功！");
                        }
                    }
                }
            };
            httpRequestObject.open("POST", url, false);
            httpRequestObject.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            httpRequestObject.setRequestHeader("content-length",params.length);
            httpRequestObject.send( params);
        }
        
        function modifySynFlag(id){
            var idElem = document.getElementById(id);
            if(idElem){
                if(idElem.checked == true){
                    updateSynFlag(id+":Y");
                }else{
                    updateSynFlag(id+":N");
                }
            }else{
                return false;
            }
        }
        
        function modifyAllSynFlag(optType){
            var retVal="";
            var synFlags = document.getElementsByName("synFlag");
            var checkVals = document.getElementsByName("checkVal");
            var selected = false;
            for(var i= 0;i < synFlags.length;i++){
                if(synFlags[i].checked){
                   selected = true;
                   if(optType == 1) { 
                      retVal+= "&id="+synFlags[i].id+":Y";
                      checkVals[i].value ="是";
                   }else {
                      retVal+= "&id="+synFlags[i].id+":N";
                      checkVals[i].value ="否";
                   }
                }
            }
            
            if(!selected) {
               alert("请先选择目标库!");
               return;
            }
            
            if(retVal){
                updateSynFlag(retVal.substr(4));
            }
            return false;
        }
        
        function deleteAll() {
            var url = "<%=contentPath%>/configInfo.htm?act=deleteInfo&";
            var ids = "";
            var synFlags = document.getElementsByName("synFlag");
            var selected = false;
            for(var i=0;i<synFlags.length;i++) {
               if(synFlags[i].checked) {
                  selected = true;  
                  ids += "ids=" + synFlags[i].id + "&";
               }
            }
            
            if(!selected) {
               alert("请先选择目标库!");
               return;
            }
            
            url += ids;
            window.location.href = url;
        }
        
        function seleOrNoseleAll() {
            var titleSynFlag =  document.getElementById("synFlagTitle").checked;
            var synFlags = document.getElementsByName("synFlag");
            for(var i=0;i<synFlags.length;i++) {
               synFlags[i].checked = titleSynFlag;
            }
        }
    </script>
</head>
<body onload="initInfo();">

<div id="contentWrap">
    <div id="header">
    </div>
    <div id="navDiv">
        <ul><span>功能</span>
            <li><a>查询</a></li>
            <li><a href="javascript:void(0);" onclick="addConfigInfo();">新增</a></li>
            <li><a target="syn" href="index.jsp">手工同步</a></li>
        </ul>
    </div>
    <div id="contentDiv">
        <div id="searchDiv">
            <div class="titleCls">查询条件</div>
            <div class="searchCls">
                <form id="configInfo" name="configInfo" action="<%=contentPath%>/configInfo.htm" method="post">
                <div class="inputSingleBorder">
                    <label for="schoolName" class="labelInfo">目标库名称:</label>
                    <input type="hidden" name="act" value="query" />
                    <input class="inputSingle" style="width: 300px" type="text" id="schoolName" name="schoolName" value="<%=CommonTools.getStr(request.getAttribute("schoolName"))%>" />
                    <input type="submit" value="查询" />
                </div>
                </form>
            </div>
        </div>
        <div id="resultDiv">
            <div class="titleCls"><span>内容</span>
              <ul class="optBtns">
                <li><input type="button" value="开启同步" onclick="modifyAllSynFlag(1);"/></li>
                <li><input type="button" value="停止同步" onclick="modifyAllSynFlag(2);"/></li>
                <li><input type="button" value="删除" onclick="deleteAll();"/></li>
              </ul>
            </div>
            <div class="tblDivCls">
                <table class="tblCls" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="50px" style=""/>
                        <col width="50px" style=""/>
                        <col width="80px" style="text-align: center;"/>
                        <col width="400px" style="color: #0000ff;text-align: center;"/>
                        <col  style=""/>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th><input type="checkbox" id="synFlagTitle" name="synFlagTitle" onclick="seleOrNoseleAll();"/></th>
                        <th>序号</th>
                        <th>是否同步</th>
                        <th>目标库名称</th>
                        <th>操作</th>
                    </tr>
                    <%
                        Map<String,ServerConfigForm> configInfoMap = (HashMap<String,ServerConfigForm>)(request.getAttribute("configInfoMap"));
                        if(configInfoMap==null){
                    %>
                    <tr>
                        <td colspan="3" style="text-align: center;">请点击“<a href="javascript:search();">查询</a>”进行查询 或 单据“<a href="<%=contentPath%>/configInfo.htm?act=addInfo">新增</a>”按钮添加目标库信息。</td>
                    </tr>
                    <%
                    }else{

                        if(configInfoMap != null && !configInfoMap.isEmpty()){
                            int i = 1;
                            String check ="是";
                            for(String key:configInfoMap.keySet()){
                                ServerConfigForm scf = configInfoMap.get(key);
                                if( "Y".equals( scf.getSynFlag()) ) {
                                     check ="是";
                                }else {
                                     check ="否";
                                }
                    %>
                    <tr class="<%=(i%2==1)?"":"evenCls"%>">
                        <td style="text-align: center;">
                          <input type="hidden" name="ids" value="<%=key%>"/>
                          <input type="checkbox" id="<%=key%>" name="synFlag"/>
                        </td>
                        <td style="text-align: center;"><%=i%></td>
                        <td style="text-align: center;">
                            <input type="text" class="checkVal" name="checkVal" value="<%=check%>" readonly/>
                        </td>
                        <td style="text-align: center;"><a href="javascript:void(0);" onclick="showInfo('<%=key%>');" ><%=scf.getDesc()%></a></td>
                        <td style="text-align: center;"><a href="javascript:void(0);" onclick="editInfo('<%=key%>');" ><img width="20px" height="20px" border="0px" src="<%=contentPath%>/images/edit.gif" alt="点击进行编辑"/></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=contentPath%>/configInfo.htm?act=deleteInfo&ids=<%=key%>" onclick="return deleteInfo('<%=key%>','<%=scf.getSynFlag()%>');"><img width="20px" height="20px" border="0px" src="<%=contentPath%>/images/delete.jpg" alt="点击进行删除"/></a>
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
        </div>
    </div>
    <div id="footer"></div>
</div>

</body>
</html>