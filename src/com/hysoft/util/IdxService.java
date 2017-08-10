package com.hysoft.util;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by dell on 2015-03-26.
 */
public class IdxService extends HttpServlet {
    private String nextPage = "/targetSearch.jsp";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean isAjax = false;
        String act = CommonTools.getStr(req.getParameter("act"));
        if(CommonTools.isEmpty(act)){
             nextPage = "/targetSearch.jsp";
        }else if("query".equals(act)){ //查询
            nextPage = getServerInfo(req, resp);
        }else if("addInfo".equals(act)){ //添加,编辑
            nextPage =getEditInfo(req,resp);
        }else if("saveInfo".equals(act)){ //保存
            nextPage = editServerInfo(req, resp);
        }else if("deleteInfo".equals(act)){
            nextPage = deleteInfo(req, resp);
        }else if("showInfo".equals(act)){
            nextPage = showInfo(req, resp);
        }else if("modifySynFlag".equals(act)){
            resp.setContentType("text/html;charset=gbk");
            PrintWriter out = resp.getWriter();
            out.print(updateSynFlag(req.getParameterValues("id")));
            if(out!=null){
                out.flush();
                out.close();
            }
            nextPage = "";
            isAjax = true;
        }else if("checkPk".equals(act)){
            resp.setContentType("text/html;charset=gbk");
            PrintWriter out = resp.getWriter();
            out.print(checkPk(req.getParameter("id"), req.getParameter("serverCode")));
            if(out!=null){
                out.flush();
                out.close();
            }
            nextPage = "";
            isAjax = true;
        }
        if(!isAjax) {
            req.getRequestDispatcher(nextPage).forward(req, resp);
        }
    }

    private String checkPk(String id, String serverCode) {
        return XmlUtil.checkPk(id,serverCode);
    }

    private String updateSynFlag(String[] ids) {
        String retVal="N";
        for(String id:ids){
            String[] args= id.split(":");
            XmlUtil.updateSynFlag(args[0],args[1]);
        }
        retVal = "Y";
        return retVal;
    }

    private String showInfo(HttpServletRequest req, HttpServletResponse resp) {
        String nextPage = "";
        String id = req.getParameter("id");
        req.setAttribute("id",id);
        nextPage = "/detailServerInfo.jsp?id="+id;
        return nextPage;
    }

    private String deleteInfo(HttpServletRequest req, HttpServletResponse resp) {
        String[] ids = req.getParameterValues("ids");
        for(int i = 0; i <ids.length;i++) {
	        if(CommonTools.isNotEmpty(ids[i])){
	            XmlUtil.deleteSever(ids[i]);
	        }
        }
        return "/targetSearch.jsp";
    }

    private String getEditInfo(HttpServletRequest req, HttpServletResponse resp) {
        String id= req.getParameter("id");
        req.setAttribute("id",id);
        return "/editServerInfo.jsp";
    }

    private String getServerInfo(HttpServletRequest req, HttpServletResponse resp) {
        String schoolName = CommonTools.getStr(req.getParameter("schoolName"));
        req.setAttribute("configInfoMap", XmlUtil.getServerMap(schoolName));
        req.setAttribute("schoolName",schoolName);
        return "/targetSearch.jsp";
    }

    public String editServerInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nextPage = "";
        Map<String,String> map = new HashMap<String, String>();
        
        String schoolName = req.getParameter("schoolName");
        map.put("schoolName",schoolName);

        String serverCode = req.getParameter("serverCode");
        map.put("serverCode",serverCode);

        String serverIp = req.getParameter("serverIp");
        map.put("serverIp",serverIp);

        String serverPort = req.getParameter("serverPort");
        map.put("serverPort",serverPort);

        String DBLoginName = req.getParameter("DBLoginName");
        map.put("DBLoginName",DBLoginName);

        String dbPwd = req.getParameter("dbPwd");
        map.put("dbPwd",dbPwd);

        String ftpIp = req.getParameter("ftpIp");
        map.put("ftpIp",ftpIp);

        String ftpPort = req.getParameter("ftpPort");
        map.put("ftpPort",ftpPort);
        
        String ftpDir = req.getParameter("ftpDir");
        map.put("ftpDir",ftpDir);

        String ftpUserName = req.getParameter("ftpUserName");
        map.put("ftpUserName",ftpUserName);

        String ftpPwd = req.getParameter("ftpPwd");
        map.put("ftpPwd",ftpPwd);

        String webServiceAddr = req.getParameter("webServiceAddr");
        map.put("webServiceAddr",webServiceAddr);

        String synType = req.getParameter("synType");
        map.put("synType",synType);

        String synInterval = req.getParameter("synInterval");
        map.put("synInterval",synInterval);

        String synFlag = req.getParameter("synFlag");
        map.put("synFlag",synFlag);

        String[] synContent =  req.getParameterValues("synContent");
        map.put("synContent",CommonTools.trimArray(Arrays.toString(synContent)));

        String connectDate = req.getParameter("connectDate");
        map.put("connectDate",connectDate);


        String endDate = req.getParameter("endDate");
        map.put("endDate",endDate);

        String databaseName = req.getParameter("databaseName");
        map.put("databaseName",databaseName);

        String databaseCharSet = req.getParameter("databaseCharSet");
        map.put("databaseCharSet",databaseCharSet);

        String[] level =  req.getParameterValues("level");
        map.put("level",CommonTools.trimArray(Arrays.toString(level)));

        String[] subject =  req.getParameterValues("subject");
        map.put("subject",CommonTools.trimArray(Arrays.toString(subject)));

        String[] version =  req.getParameterValues("version");
        map.put("version",CommonTools.trimArray(Arrays.toString(version)));

        String[] area =  req.getParameterValues("area");
        map.put("area",CommonTools.trimArray(Arrays.toString(area)));

        String[] from =  req.getParameterValues("from");
        map.put("from",CommonTools.trimArray(Arrays.toString(from)));


        String[] attr =  req.getParameterValues("attr");
        map.put("attr",CommonTools.trimArray(Arrays.toString(attr)));


        String id = req.getParameter("id");
        if(CommonTools.isEmpty(id)){ //add
            map.put("createTime",new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime()));
            id=XmlUtil.createServer(map);
            req.setAttribute("alertMsg","添加成功!");
        }else{ //update
            XmlUtil.updateServer(id,map);
            req.setAttribute("alertMsg","保存成功!");
        }
        req.setAttribute("needExit",req.getParameter("needExit"));
        req.setAttribute("id",id);
        nextPage = "/editServerInfo.jsp?id="+id;
        return nextPage;
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
