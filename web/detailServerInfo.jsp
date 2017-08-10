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
    <title>�޸�Ŀ�����Ϣ</title>
    <meta content="text/html;charset=GBK" http-equiv="Content-Type">
    <%
        String contentPath = request.getContextPath();
        String id = CommonTools.getStr(request.getAttribute("id"));
        Map<String,String> configInfoMap = XmlUtil.getServerParam(id);
        if(configInfoMap == null){
            configInfoMap = new HashMap<String, String>();
        }
    %>
    <style type="text/css">
        body{
            font: 13px "΢���ź�","����","����";
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
        .infoCls,.bigInfoCls{
            display: block;
            float: left;
            border:solid 0 #fff;
            border-bottom:solid 1px #000;
            font-style: italic;
            width: 220px;

        }

        .bigInputSingleBorder{
            clear: both;
            width: 700px;
        }
        .bigInfoCls{
            width: 570px;
        }
        .wrapDiv{
            width: 750px;
            clear: both;
            background-color: #fff;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10px;
            margin-bottom: 10px;
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
            -webkit-border-radius: 8px; /* Safari �� Chrome */
            border-radius: 8px; /* Opera 10.5+, �Լ�ʹ����IE-CSS3��IE����� */
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
        function $g(elemName){
            return document.getElementById(elemName);
        }

        function onSubmitCheck(){
            var eId = $g("schoolName");
            if(eId){
                if(!eId.value){
                    alert("����дĿ�������!");
                    eId.focus();
                    return false;
                }
            }
            eId = $g("serverIp");
            if(eId){
                if(!eId.value){
                    alert("����дIP��ַ!");
                    eId.focus();
                    return false;
                }else{
                    var reg = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
                    if (!reg.test(eId.value)) {
                        eId.focus();
                        alert("��������ȷ��IP��ַ��");
                        return false;
                    }
                }
            }

            eId = $g("DBLoginName");
            if(eId){
                if(!eId.value){
                    alert("����д��½��!");
                    eId.focus();
                    return false;
                }
            }

            eId = $g("dbPwd");
            if(eId){
                if(!eId.value){
                    alert("����д����!");
                    eId.focus();
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body >
<div class="wrapDiv">
<div class="titleDiv">Ŀ�����ϸ��Ϣ</div>
<hr/>
<form id="configInfo" name="configInfo" action="<%=contentPath%>/configInfo.htm" method="post" onsubmit="return onSubmitCheck();">
<div style="text-align: right;">
    <input type="button" onclick="window.close();" value="�ر�" />
</div>
<input type="hidden" name="id" value="<%=id%>" />
<div class="checkOptionBorder" style="">
    <fieldset>
        <legend>������Ϣ:</legend>
    <div class="bigInputSingleBorder"><label >Ŀ�������:</label>
        <span class="bigInfoCls" ><%=CommonTools.getStr(configInfoMap.get("schoolName"))%>&nbsp;</span></div>
        <div class="inputSingleBorder" ><label>�����ʶ:</label>
            <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("serverCode"))%>&nbsp;</span>
        </div>
        <div class="inputSingleBorder">
            <label>ͬ������:</label>
            <div style="display: inline;">
                <input type="checkbox" id="testPager" name="synContent" value="testPager" disabled
                    <%=CommonTools.getStr(configInfoMap.get("synContent")).indexOf("testPager")>=0?"checked":""%>
                        >
                <label for="testPager">�Ծ�</label>
                <input type="checkbox" id="testQuestion" name="synContent" value="testQuestion" disabled
                    <%=CommonTools.getStr(configInfoMap.get("synContent")).indexOf("testQuestion")>=0?"checked":""%>   >
                <label for="testQuestion">����</label>
            </div>
        </div>


        <div class="inputSingleBorder"><label>����ʱ��:</label>
            <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("connectDate"))%>&nbsp;</span></div>
                <div class="inputSingleBorder"><label>ֹͣʱ��:</label>
            <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("endDate"))%>&nbsp;</span></div>
        <div class="inputSingleBorder" style="width:340px;"><label>ͬ����ʽ:</label>
        <span class="infoCls" >
            <%=CommonTools.getStr(configInfoMap.get("synType")).equals("DB")?"���ݿ�":""%>
            <%=CommonTools.getStr(configInfoMap.get("synType")).equals("ftp")?"ftp":""%>
            <%=CommonTools.getStr(configInfoMap.get("synType")).equals("webService")?"webService":""%>
            &nbsp;
        </span></div>
        <div class="inputSingleBorder" ><label>ͬ������:</label>
            <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("synInterval"))%>&nbsp;</span>
        </div>
        <div class="inputSingleBorder">
            <label>�Ƿ�ͬ��:</label>
            <div style="display: inline;">
                <input type="hidden" id="synFlag" name="synFlag" value="<%=CommonTools.getStr(configInfoMap.get("synFlag"))%>" />
                <input type="checkbox" id="synFlagChk" name="synFlagChk" disabled
                    <%="Y".equals(CommonTools.getStr(configInfoMap.get("synFlag")))?"checked":""%>
                        >
                <label for="testPager">ͬ��</label>
            </div>
        </div>

        <%--<div class="inputSingleBorder"><label>���ͬ��ʱ��:</label>--%>
                <%--<span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("lastSynDate"))%></span></div>--%>


        </fieldset>
        <fieldset>
            <legend>���ݿ���Ϣ:</legend>
        <div class="inputSingleBorder"><label>IP��ַ:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("serverIp"))%>&nbsp;</span></div>

    <div class="inputSingleBorder"><label>�˿�:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("serverPort"))%>&nbsp;</span></div>

    <div class="inputSingleBorder"><label>��½��:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("DBLoginName"))%>&nbsp;</span></div>
    <div class="inputSingleBorder"><label>����:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("dbPwd"))%>&nbsp;</span></div>
    <div class="inputSingleBorder"><label>���ݿ�����:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("databaseName"))%>&nbsp;</span></div>
    <div class="inputSingleBorder"><label>���ݿ����:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("databaseCharSet"))%>&nbsp;</span></div>
        </fieldset>
        <fieldset>
            <legend>FTP��Ϣ:</legend>
    <div class="inputSingleBorder"><label>FTP IP��ַ:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("ftpIp"))%>&nbsp;</span></div>
    <div class="inputSingleBorder"><label>FTP �˿�:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("ftpPort"))%>&nbsp;</span></div>
    <div class="inputSingleBorder"><label>ftp�û���:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("ftpUserName"))%>&nbsp;</span></div>
    <div class="inputSingleBorder"><label>ftp����:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("ftpPwd"))%>&nbsp;</span></div>
    <div class="inputSingleBorder"><label>FTPĿ¼:</label>
        <span class="infoCls" ><%=CommonTools.getStr(configInfoMap.get("ftpDir"))%></span></div>
        </fieldset>

        <fieldset><legend>web service��Ϣ</legend>
    <div class="bigInputSingleBorder"><label >web service��ַ:</label>
        <span class="bigInfoCls" ><%=CommonTools.getStr(configInfoMap.get("webServiceAddr"))%>&nbsp;</span></div>
        </fieldset>


</div>
<div class="checkOptionBorder" style="">
    <fieldset>
        <legend>ͬ���꼶��</legend>
    <% Connection conn = DBUtil.getConn();
        String sql = "SELECT ft.`name`,ft.`id` from fz_type ft where ft.upid = 2 order by 2";
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
    <div class="checkOption" ><input class="" type="checkbox" id="level<%=i%>" <%=isChecked%> name="level" value="<%=rs.getString(1)%>"><label for="level<%=i%>"><%=rs.getString(1)%></label></div>
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
        <legend>ͬ��ѧ�ƣ�</legend>
    <%  sql = "SELECT ft.`name`,ft.`id`,ft.stat from fz_type ft where ft.upid = 1 order by 2";
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
                    currVal += "(����)";
                } else if("1".equals(stat)) {
                    currVal += "(����)";
                } else if("2".equals(stat)) {
                    currVal += "(Сѧ)";
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
        <input class="" type="checkbox" id="subject<%=i%>" <%=isChecked%> name="subject" value="<%=currVal%>">
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

<div class="checkOptionBorder" style="">
    <fieldset>
        <legend>ͬ���汾��</legend>
    <% sql = "SELECT ft.`name`,ft.`id` from fz_type ft where ft.upid = 3 order by 2";
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
        <input class="" type="checkbox" id="version<%=i%>" <%=isChecked%> name="version" value="<%=rs.getString(1)%>"><label for="version<%=i%>"><%=rs.getString(1)%></label></div>
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
        <legend>ͬ��������</legend>
    <% sql = "SELECT ft.`name`,ft.`id` from fz_type ft where ft.upid = 91 order by 2";
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
        <input class="" type="checkbox" id="area<%=i%>" <%=isChecked%> name="area" value="<%=rs.getString(1)%>"><label for="area<%=i%>"><%=rs.getString(1)%></label></div>
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
        <legend>ͬ����Դ��</legend>
    <% sql = "SELECT ft.`name`,ft.`id` from fz_type ft where ft.upid = 123 order by 2";
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
        <input class="" type="checkbox" id="from<%=i%>" <%=isChecked%> name="from" value="<%=rs.getString(1)%>"><label for="from<%=i%>"><%=rs.getString(1)%></label></div>
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
        <legend>ͬ�����ԣ�</legend>
    <%  sql = "SELECT ft.`name`,ft.`id` from fz_type ft where ft.upid = 43 order by 2";
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
    <div class="checkOption" ><input class="" type="checkbox" id="attr<%=i%>" <%=isChecked%> name="attr" value="<%=rs.getString(1)%>"><label for="attr<%=i%>"><%=rs.getString(1)%></label></div>
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
</div>

<div style="clear: both"/>

</form>
</div>
</body>
</html>
