<%@ page import="com.hysoft.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>修改目标库信息</title>
    <meta content="text/html;charset=GBK" http-equiv="Content-Type">
    <%
        String contentPath = request.getContextPath();
        String id = CommonTools.getStr(request.getAttribute("id"));
        Map<String,String> configInfoMap = XmlUtil.getServerParam(id);
        if(configInfoMap == null){
            configInfoMap = new HashMap<String, String>();
        }
    %>
    <script type="text/javascript" src="<%=contentPath%>/js/calendar.js"></script>
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
        .title{
            font-weight: bold;
        }
        .checkOptionBorder{
            width: 750px;
            clear: both;
            margin-top: 10px;;
        }
        .checkOption{
            width:140px;
            float:left;
            margin: 3px 0;
            font-weight: bold;
        }
        .inputSingleBorder{
            width: 350px;;
            margin-top: 8px;
            margin-bottom: 5px;
            float: left;
        }

        .inputSingleBorder>label,.bigInputSingleBorder>label{
            width: 110px;
            font-size: 18;
            font-weight: bold;
            display: block;
            float:left;
            text-align: left;
            margin-right: 5px;

        }
        .inputSingle,.bigInputSingle{
            border:solid 0 #fff;
            border-bottom:solid 1px #000;
            font-style: italic;
            width: 220px;

        }
        .bigInputSingleBorder{
            clear: both;
            width: 700px;
        }
        .bigInputSingle{
            width: 570px;
        }
        .wrapDiv{
            width: 750px;
            clear: both;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10px;
            margin-bottom: 10px;
            background-color: #fff;
            height: 100%;
            padding: 10px 30px;
            padding-bottom: 50px;
            position : relative;
        }
        .titleDiv{
            font-weight: bold;
            font-size: 20px;
            padding: 8px;
            text-align: center;
            background-color: #c6c6c6;
            color: #fff;

        }
        fieldset{
            border: solid 1px #cccccc;
            margin: 20px 0;
            padding: 20px;
            Border-radius: 8px;
            -moz-border-radius: 8px; /* Firefox */
            -webkit-border-radius: 8px; /* Safari 和 Chrome */
            border-radius: 8px; /* Opera 10.5+, 以及使用了IE-CSS3的IE浏览器 */
        }
        fieldset legend{
            font-size: 15px;
            color: #0000ff;
            font-weight: bold;
        }
        input[type=button],input[type=submit]{
            font-size: 15px;;
            font-weight: bold;
            color:#00f;
            margin: 0 8px;
        }
        hr{
            border: dotted 1px #E6E6E6;
            margin: 20px 0;

        }
    </style>
    <script type="text/javascript">
        var alertMsg = '<%=CommonTools.getStr(request.getAttribute("alertMsg"))%>';
        if(alertMsg){
            alert(alertMsg);
            if('<%=CommonTools.getStr(request.getAttribute("needExit"))%>' =='Y'){
                window.close();
            }
        }
        function $g(elemName){
            return document.getElementById(elemName);
        }

        function onSubmitCheck(){
            var eId = $g("schoolName");
            if(eId){
                if(!eId.value){
                    alert("请填写目标库名称!");
                    eId.focus();
                    return false;
                }
            }
            eId = $g("serverIp");
            if(eId){
                if(!eId.value){
                    alert("请填写IP地址!");
                    eId.focus();
                    return false;
                }else{
                    var reg = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
                    if (!reg.test(eId.value)) {
                        eId.focus();
                        alert("请输入正确的IP地址！");
                        return false;
                    }
                }
            }

            eId = $g("DBLoginName");
            if(eId){
                if(!eId.value){
                    alert("请填写登陆名!");
                    eId.focus();
                    return false;
                }
            }

            eId = $g("dbPwd");
            if(eId){
                if(!eId.value){
                    alert("请填写密码!");
                    eId.focus();
                    return false;
                }
            }
            eId = $g("databaseName");
            if(eId){
                if(!eId.value){
                    alert("请填写数据库名称!");
                    eId.focus();
                    return false;
                }
            }
            eId = $g("databaseCharSet");
            if(eId){
                if(!eId.value){
                    alert("请填写数据库编码!");
                    eId.focus();
                    return false;
                }
            }
            eId = $g("connectDate");
            if(eId){
                if(!eId.value){
                    alert("请填写接入时间!");
                    eId.focus();
                    return false;
                }
            }
            return true;
        }
        function submitInfo(){
            if(!document.getElementById("serverCodeUnique").value){
                alert("服务标识不能为空！");
                return false;
            }

            if(document.getElementById("serverCodeUnique").value!="Y"){
                alert("服务标识已经存在！");
                return false;
            }
            document.getElementById("needExit").value="Y";
            document.getElementById("configInfo").submit();
        }
        function modifyCheckFlag(flag){
            var titleFlag =  document.getElementById(flag+"Title").checked;
            var synFlags = document.getElementsByName(flag);
            for(var i= 0,count= synFlags.length;i<count;i++){
                var currObj = synFlags[i];
                if(titleFlag){
                    currObj.checked = true;
                }else{
                    currObj.checked = false;
                }
            }
            return false;
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
        function checkPk(){
            var id = document.getElementById("id").value;
            var serverCode = document.getElementById("serverCode").value;
            var url= '<%=contentPath%>/configInfo.htm';
            var params = "stamp="+(new Date())+"&act=checkPk&id="+id+"&serverCode="+serverCode;
            var httpRequestObject = createXMLHttpRequest();
            httpRequestObject.onreadystatechange = function(){
                if(httpRequestObject.readyState == 4) {
                    if (httpRequestObject.status == 200) {
                        var resTxt = httpRequestObject.responseText;
                        if(resTxt=="Y"){
                            document.getElementById("tipInfoDiv").innerText = "服务器标识已经存在";
                            document.getElementById("serverCodeUnique").value="N";
                        }else{
                            document.getElementById("tipInfoDiv").innerText = "";
                            document.getElementById("serverCodeUnique").value="Y";
                        }
                    }
                }
            };
            httpRequestObject.open("POST", url, false);
            httpRequestObject.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            httpRequestObject.setRequestHeader("content-length",params.length);
            httpRequestObject.send( params);
        }
        function setSynFlag(){
            if(document.getElementById("synFlagChk").checked == true){
                document.getElementById("synFlag").value = "Y";
            }else{
                document.getElementById("synFlag").value ="N";
            }
        }
    </script>
</head>
<body >
<div class="wrapDiv">
    <div class="titleDiv">目标库信息维护</div>
    <hr/>
    <form id="configInfo" name="configInfo" action="<%=contentPath%>/configInfo.htm" method="post" onsubmit="return onSubmitCheck();">
    <div style="text-align: right;">
        <span id="tipInfoDiv" style="color: red;"></span>
    <input type="submit" value="暂存" /> <input type="button" onclick="submitInfo();" value="保存" /> <input type="button" onclick="window.close();" value="关闭" />
    </div>
    <input type="hidden" id="id" name="id" value="<%=id%>" />
        <input type="hidden" name="act" value="saveInfo" />
        <input type="hidden" id="needExit" name="needExit" value="N" />
        <input type="hidden" id="serverCodeUnique" name="serverCodeUnique" value="Y" />
        <div class="checkOptionBorder" style="">
            <fieldset>
                <legend>基本信息:</legend>
                <div class="bigInputSingleBorder"><label for="schoolName">目标库名称:</label>
                    <input class="bigInputSingle" type="text" id="schoolName" name="schoolName" value="<%=CommonTools.getStr(configInfoMap.get("schoolName"))%>">
                </div>
                <div class="inputSingleBorder">
                    <label>服务标识:</label>
                    <input class="inputSingle" type="text"
                           onblur="checkPk()" onchange="checkPk()" onkeyup="checkPk()" id="serverCode" name="serverCode" value="<%=CommonTools.getStr(configInfoMap.get("serverCode"))%>"
                        <%="".equals(CommonTools.getStr(configInfoMap.get("serverCode")))?"":"disabled"%>
                            >
                </div>
                <div class="inputSingleBorder">
                    <label>同步内容:</label>
                    <div style="display: inline;">
                        <input type="checkbox" id="testPager" name="synContent" value="testPager"
                            <%=CommonTools.getStr(configInfoMap.get("synContent")).indexOf("testPager")>=0?"checked":""%>
                                >
                        <label for="testPager">试卷</label>
                        <input type="checkbox" id="testQuestion" name="synContent" value="testQuestion"
                            <%=CommonTools.getStr(configInfoMap.get("synContent")).indexOf("testQuestion")>=0?"checked":""%>>
                        <label for="testQuestion">试题</label>
                    </div>
                </div>
                <div class="inputSingleBorder">
                    <label for="connectDate">接入时间:</label>
                    <input class="inputSingle" type="text" id="connectDate" name="connectDate" value="<%=CommonTools.getStr(configInfoMap.get("connectDate"))%>"
                            onclick="gfPop.fStartPop(this,document.getElementById('endDate'));">
                </div>
                <div class="inputSingleBorder"><label for="endDate">停止时间:</label>
                    <input class="inputSingle" type="text" id="endDate" name="endDate" value="<%=CommonTools.getStr(configInfoMap.get("endDate"))%>"
                            onclick="gfPop.fEndPop(document.getElementById('connectDate'),this);"></div>
                <div class="inputSingleBorder" style="width:349px">
                    <label for="synType">同步方式:</label>
                    <select style="width: 160px;" id="synType" name="synType">
                        <option value="DB" <%=CommonTools.getStr(configInfoMap.get("synType")).equals("DB")?"selected":""%>>数据库</option>
                        <option value="ftp" <%=CommonTools.getStr(configInfoMap.get("synType")).equals("ftp")?"selected":""%>>ftp</option>
                        <option value="webService" <%=CommonTools.getStr(configInfoMap.get("synType")).equals("webService")?"selected":""%>>web service</option>
                    </select>
                </div>
                <div class="inputSingleBorder">
                    <label>同步周期:</label>
                    <input class="inputSingle" type="text" id="synInterval" name="synInterval" value="<%=CommonTools.getStr(configInfoMap.get("synInterval"))%>"><a target="_blank" href="<%=contentPath%>/cronTrigger.html"></a>
                </div>
                <div class="inputSingleBorder">
                    <label>是否同步:</label>
                    <div style="display: inline;">
                        <input type="hidden" id="synFlag" name="synFlag" value="<%=CommonTools.getStr(configInfoMap.get("synFlag"))%>" />
                        <input type="checkbox" id="synFlagChk" name="synFlagChk" onchange="setSynFlag();"
                               onkeydown="setSynFlag();" onblur="setSynFlag();"
                            <%="Y".equals(CommonTools.getStr(configInfoMap.get("synFlag")))?"checked":""%>
                                >
                        <label for="testPager">同步</label>
                    </div>
                </div>
            </fieldset>

            <fieldset>
               <legend>数据库信息:</legend>
                <div class="inputSingleBorder"><label for="serverIp">IP地址:</label>
                    <input class="inputSingle" type="text" id="serverIp" name="serverIp" value="<%=CommonTools.getStr(configInfoMap.get("serverIp"))%>"></div>

                <div class="inputSingleBorder"><label for="serverPort">端口:</label>
                    <input class="inputSingle" type="text" id="serverPort" name="serverPort" value="<%=CommonTools.getStr(configInfoMap.get("serverPort"))%>"></div>

                <div class="inputSingleBorder"><label for="DBLoginName">登陆名:</label>
                    <input class="inputSingle" type="text" id="DBLoginName" name="DBLoginName" value="<%=CommonTools.getStr(configInfoMap.get("DBLoginName"))%>"></div>
                <div class="inputSingleBorder"><label for="dbPwd">密码:</label>
                    <input class="inputSingle" type="text" id="dbPwd" name="dbPwd" value="<%=CommonTools.getStr(configInfoMap.get("dbPwd"))%>"></div>
                <div class="inputSingleBorder"><label for="databaseName">数据库名称:</label>
                    <input class="inputSingle" type="text" id="databaseName" name="databaseName" value="<%=CommonTools.getStr(configInfoMap.get("databaseName"))%>"></div>
                <div class="inputSingleBorder"><label for="databaseCharSet">数据库编码:</label>
                    <input class="inputSingle" type="text" id="databaseCharSet" name="databaseCharSet" value="<%=CommonTools.getStr(configInfoMap.get("databaseCharSet"))%>"></div>
            </fieldset>
            <fieldset>
                <legend>FTP信息:</legend>
                <div class="inputSingleBorder"><label for="ftpIp">FTP IP地址:</label>
                    <input class="inputSingle" type="text" id="ftpIp" name="ftpIp" value="<%=CommonTools.getStr(configInfoMap.get("ftpIp"))%>"></div>
                <div class="inputSingleBorder"><label for="ftpPort">FTP 端口:</label>
                    <input class="inputSingle" type="text" id="ftpPort" name="ftpPort" value="<%=CommonTools.getStr(configInfoMap.get("ftpPort"))%>"></div>
                <div class="inputSingleBorder"><label for="ftpUserName">ftp用户名:</label>
                    <input class="inputSingle" type="text" id="ftpUserName" name="ftpUserName" value="<%=CommonTools.getStr(configInfoMap.get("ftpUserName"))%>"></div>
                <div class="inputSingleBorder"><label for="ftpPwd">ftp密码:</label>
                    <input class="inputSingle" type="text" id="ftpPwd" name="ftpPwd" value="<%=CommonTools.getStr(configInfoMap.get("ftpPwd"))%>"></div>
                <div class="inputSingleBorder"><label for="ftpDir">FTP目录:</label>
                    <input class="inputSingle" type="text" id="ftpDir" name="ftpDir" value="<%=CommonTools.getStr(configInfoMap.get("ftpDir"))%>"></div>
            </fieldset>

            <fieldset><legend>web service信息</legend>
                <div class="bigInputSingleBorder"><label for="webServiceAddr">web service地址:</label>
                    <input class="bigInputSingle" type="text" id="webServiceAddr" name="webServiceAddr" value="<%=CommonTools.getStr(configInfoMap.get("webServiceAddr"))%>"></div>
            </fieldset>

        </div>
        <div class="checkOptionBorder">
            <fieldset>
                <legend><input type="checkbox" id="levelTitle" name="levelTitle" onclick="modifyCheckFlag('level');"/>同步年级：</legend>
            <% Connection conn = DBUtil.getConn();
                String sql = "SELECT ft.`name`,ft.id from fz_type ft where ft.upid = 2 order by 2";
                PreparedStatement stmt =null;
                ResultSet rs=null;
                try{
                    stmt = conn.prepareCall(sql);
                    rs = stmt.executeQuery();
                    int i=0;
                    String checkedLevels = CommonTools.getStr(configInfoMap.get("level"));
                    String isChecked = "";
                    String[] checkedLevelArr = null;
                    if(CommonTools.isNotEmpty(checkedLevels)){
                        checkedLevelArr = checkedLevels.split(",");
                    }
                    while(rs.next()){
                        isChecked = "";
                        String currVal = rs.getString(1).trim();
                        if(checkedLevelArr!=null && checkedLevelArr.length >0) {
                            for (String tmpSub : checkedLevelArr) {
                                if (rs.getString(2).trim().equals(tmpSub.trim())) {
                                    isChecked = "checked";
                                    break;
                                }
                            }
                        }
            %>
            <div class="checkOption" ><input class="" type="checkbox" id="level<%=i%>" <%=isChecked%> name="level" value="<%=rs.getString(2)%>"><label for="level<%=i%>"><%=rs.getString(1)%></label></div>
            <%
                        i++;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }finally {
                    stmt.close();
                }
            %>
                </fieldset>
        </div>
        <div style="clear: both"/>

        <div class="checkOptionBorder">
            <fieldset>
                <legend><input type="checkbox" id="subjectTitle" name="subjectTitle" onclick="modifyCheckFlag('subject');"/>同步学科：</legend>
                    <%  sql = "SELECT ft.`name`,ft.id,ft.stat from fz_type ft where ft.upid = 1 order by 3,2";
                stmt =null;
                rs=null;
                try{
                    stmt = conn.prepareCall(sql);
                    rs = stmt.executeQuery();
                    int i=0;
                    String checkedSubjects = CommonTools.getStr(configInfoMap.get("subject"));
                    String[] checkedSubjectArr = null;
                    if(CommonTools.isNotEmpty(checkedSubjects)){
                        checkedSubjectArr = checkedSubjects.split(",");
                    }
                    String isChecked = "";
                    while(rs.next()){
                        String currVal = rs.getString(1).trim();
                        String stat = rs.getString(3).trim();
                        if("0".equals(stat)) {
                            currVal += "(初中)";
                        } else if("1".equals(stat)) {
                            currVal += "(高中)";
                        } else if("2".equals(stat)) {
                            currVal += "(小学)";
                        }
                        isChecked = "";
                        if(checkedSubjectArr!=null && checkedSubjectArr.length >0) {
                            for (String tmpSub : checkedSubjectArr) {
                                if (rs.getString(2).trim().equals(tmpSub.trim())) {
                                    isChecked = "checked";
                                    break;
                                }
                            }
                        }
            %>
                <div class="checkOption" >
                    <input class="" type="checkbox" id="subject<%=i%>" <%=isChecked%> name="subject" value="<%=rs.getString(2)%>">
                    <label for="subject<%=i%>"><%=currVal%></label></div>
                    <%
                        i++;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }finally {
                    stmt.close();
                }
            %>
            </fieldset>
        </div>


        <div style="clear: both"/>

        <div class="checkOptionBorder">
            <fieldset>
                <legend><input type="checkbox" id="versionTitle" name="versionTitle" onclick="modifyCheckFlag('version');"/>同步版本：</legend>
            <% sql = "SELECT ft.`name`,ft.id from fz_type ft where ft.upid = 3 order by 2";
                stmt =null;
                rs=null;
                try{
                    stmt = conn.prepareCall(sql);
                    rs = stmt.executeQuery();
                    int i=0;
                    String checkedVersions = CommonTools.getStr(configInfoMap.get("version"));
                    String[] checkedVersionArr = null;
                    String isChecked = "";
                    if(CommonTools.isNotEmpty(checkedVersions)){
                        checkedVersionArr = checkedVersions.split(",");
                    }
                    while(rs.next()){
                        String currVal = rs.getString(1).trim();
                        isChecked = "";
                        if(checkedVersionArr!=null && checkedVersionArr.length >0) {
                            for (String tmpSub : checkedVersionArr) {
                                if (rs.getString(2).trim().equals(tmpSub.trim())) {
                                    isChecked = "checked";
                                    break;
                                }
                            }
                        }
            %>
            <div class="checkOption" >
                <input class="" type="checkbox" id="version<%=i%>" <%=isChecked%> name="version" value="<%=rs.getString(2)%>"><label for="version<%=i%>"><%=rs.getString(1)%></label></div>
            <%
                        i++;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }finally {
                    stmt.close();
                }
            %>
            </fieldset>
        </div>
        <div style="clear: both"/>
        <div class="checkOptionBorder" style="">
            <fieldset>
                <legend><input type="checkbox" id="areaTitle" name="areaTitle" onclick="modifyCheckFlag('area');"/>同步地区：</legend>
            <div class="title" ></div>
            <% sql = "SELECT ft.`name`,ft.id from fz_type ft where ft.upid = 91 order by 2";
                stmt =null;
                rs=null;
                try{
                    stmt = conn.prepareCall(sql);
                    rs = stmt.executeQuery();
                    int i=0;
                    String checkedAreas = CommonTools.getStr(configInfoMap.get("area"));
                    String[] checkedAreaArr = null;
                    String isChecked = "";
                    if(CommonTools.isNotEmpty(checkedAreas)){
                        checkedAreaArr = checkedAreas.split(",");
                    }
                    while(rs.next()){
                        String currVal = rs.getString(1).trim();
                        isChecked = "";
                        if(checkedAreaArr!=null && checkedAreaArr.length >0) {
                            for (String tmpSub : checkedAreaArr) {
                                if (rs.getString(2).trim().equals(tmpSub.trim())) {
                                    isChecked = "checked";
                                    break;
                                }
                            }
                        }
            %>
            <div class="checkOption" >
                <input class="" type="checkbox" id="area<%=i%>" <%=isChecked%> name="area" value="<%=rs.getString(2)%>"><label for="area<%=i%>"><%=rs.getString(1)%></label></div>
            <%
                        i++;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }finally {
                    stmt.close();
                }
            %>
                </fieldset>
        </div>
        <div style="clear: both"/>
        <div class="checkOptionBorder" style="">
            <fieldset>
                <legend><input type="checkbox" id="fromTitle" name="fromTitle" onclick="modifyCheckFlag('from');"/>同步来源：</legend>
            <% sql = "SELECT ft.`name`,ft.id from fz_type ft where ft.upid = 123 order by 2";
                stmt =null;
                rs=null;
                try{
                    stmt = conn.prepareCall(sql);
                    rs = stmt.executeQuery();
                    int i=0;
                    String checkedFroms = CommonTools.getStr(configInfoMap.get("from"));
                    String[] checkedFromArr = null;
                    String isChecked = "";
                    if(CommonTools.isNotEmpty(checkedFroms)){
                        checkedFromArr = checkedFroms.split(",");
                    }
                    while(rs.next()){
                        String currVal = rs.getString(1).trim();
                        isChecked = "";
                        if(checkedFromArr!=null && checkedFromArr.length >0) {
                            for (String tmpSub : checkedFromArr) {
                                if (rs.getString(2).trim().equals(tmpSub.trim())) {
                                    isChecked = "checked";
                                    break;
                                }
                            }
                        }
            %>
            <div class="checkOption" >
                <input class="" type="checkbox" id="from<%=i%>" <%=isChecked%> name="from" value="<%=rs.getString(2)%>"><label for="from<%=i%>"><%=rs.getString(1)%></label></div>
            <%
                        i++;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }finally {
                    stmt.close();
                }
            %>
                </fieldset>
        </div>
        <div style="clear: both"/>
        <div class="checkOptionBorder" >
            <fieldset>
                <legend><input type="checkbox" id="attrTitle" name="attrTitle" onclick="modifyCheckFlag('attr');"/>同步属性：</legend>
            <%  sql = "SELECT ft.`name`,ft.id from fz_type ft where ft.upid = 43 order by 2";
                stmt =null;
                rs=null;
                try{
                    stmt = conn.prepareCall(sql);
                    rs = stmt.executeQuery();
                    int i=0;
                    String checkedAttrs = CommonTools.getStr(configInfoMap.get("attr"));
                    String[] checkedAttrArr = null;
                    String isChecked = "";
                    if(CommonTools.isNotEmpty(checkedAttrs)){
                        checkedAttrArr = checkedAttrs.split(",");
                    }
                    while(rs.next()){
                        String currVal = rs.getString(1).trim();
                        isChecked = "";
                        if(checkedAttrArr!=null && checkedAttrArr.length >0) {
                            for (String tmpSub : checkedAttrArr) {
                                if (rs.getString(2).trim().equals(tmpSub.trim())) {
                                    isChecked = "checked";
                                    break;
                                }
                            }
                        }
            %>
            <div class="checkOption" ><input class="" type="checkbox" id="attr<%=i%>" <%=isChecked%> name="attr" value="<%=rs.getString(2)%>"><label for="attr<%=i%>"><%=rs.getString(1)%></label></div>
            <%
                        i++;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }finally {
                    stmt.close();
                    DBUtil.closeConn(conn);
                }
            %>
                </fieldset>
        </div>

        <div style="clear: both"/>

    </form>
</div>
<iframe width=174 height=189 name="gToday:normal:calendar.js"
        id="gToday:normal:calendar.js" src="<%=contentPath%>/js/DateHTML.htm"
        scrolling="no" frameborder="0"
        style="visibility: visible; z-index: 999; position: absolute; left: -500px; top: 0;">
</iframe>
</body>
</html>
