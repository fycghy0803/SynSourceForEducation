package com.hysoft.util;

import com.hysoft.util.forms.ServerConfigForm;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import java.io.File;
import java.util.*;


public class XmlUtil {

    private static String xmlPath = XmlUtil.class.getResource("/Config/TargetServerConfig.xml").getFile();
    //private static String xmlPath = "E:/sinoprof/out/production/exam/config/targetInfo.xml";

    public static Map<String,String> getServerParam(String id) {
        if(null == id || "".equals(id)) return null;
        Map retMap = new HashMap();
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setIgnoringElementContentWhitespace(true);
        try {
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(xmlPath); // 使用dom解析xml文件

            NodeList serverList = doc.getElementsByTagName("server");
            for (int i = 0; i < serverList.getLength(); i++) // 循环处理对象
            {
                String currId = serverList.item(i).getAttributes().getNamedItem("id").getNodeValue();
                if (!id.equals(currId.trim())) {
                    continue;
                }
                Element son = (Element) serverList.item(i);
                for (Node node = son.getFirstChild(); node != null; node = node.getNextSibling()) {
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        String name = node.getNodeName();
                        if ("desc".equals(name)) {
                            String mapName = "schoolName";
                            retMap.put(mapName, "");
                            if (node.getFirstChild() != null) {
                                String value = node.getFirstChild().getNodeValue();
                                retMap.put(mapName, value);
                            }
                        }

                        if ("serverCode".equals(name)) {
                            String mapName = "serverCode";
                            retMap.put(mapName, "");
                            if (node.getFirstChild() != null) {
                                String value = node.getFirstChild().getNodeValue();
                                retMap.put(mapName, value);
                            }
                        }

                        if ("connectDate".equals(name)) {
                            String mapName = "connectDate";
                            retMap.put(mapName, "");
                            if (node.getFirstChild() != null) {
                                String value = node.getFirstChild().getNodeValue();
                                retMap.put(mapName, value);
                            }
                        }
                        if ("endDate".equals(name)) {
                            String mapName = "endDate";
                            retMap.put(mapName, "");
                            if (node.getFirstChild() != null) {
                                String value = node.getFirstChild().getNodeValue();
                                retMap.put(mapName, value);
                            }
                        }

                        if ("synContent".equals(name)) {
                            String mapName = "synContent";
                            retMap.put(mapName, "");
                            if (node.getFirstChild() != null) {
                                String value = node.getFirstChild().getNodeValue();
                                retMap.put(mapName, value);
                            }
                        }

                        if ("createTime".equals(name)) {
                            String mapName = "createTime";
                            retMap.put(mapName, "");
                            if (node.getFirstChild() != null) {
                                String value = node.getFirstChild().getNodeValue();
                                retMap.put(mapName, value);
                            }
                        }



                        if ("synType".equals(name)) {
                            String mapName = "synType";
                            retMap.put(mapName, "");
                            if (node.getFirstChild() != null) {
                                String value = node.getFirstChild().getNodeValue();
                                retMap.put(mapName, value);
                            }
                        }

                        if ("synInterval".equals(name)) {
                            String mapName = "synInterval";
                            retMap.put(mapName, "");
                            if (node.getFirstChild() != null) {
                                String value = node.getFirstChild().getNodeValue();
                                retMap.put(mapName, value);
                            }
                        }

                        if ("synFlag".equals(name)) {
                            String mapName = "synFlag";
                            retMap.put(mapName, "");
                            if (node.getFirstChild() != null) {
                                String value = node.getFirstChild().getNodeValue();
                                retMap.put(mapName, value);
                            }
                        }
                        
                        if ("webServicePath".equals(name)) {
                            String mapName = "webServiceAddr";
                            retMap.put(mapName, "");
                            if (node.getFirstChild() != null) {
                                String value = node.getFirstChild().getNodeValue();
                                retMap.put(mapName, value);
                            }
                        }

                        if ("ftp".equals(name)) {
                            for (Node ftpNode = node.getFirstChild(); ftpNode != null; ftpNode = ftpNode.getNextSibling()) {
                                if (ftpNode.getNodeType() == Node.ELEMENT_NODE) {
                                    String fptNodeName = ftpNode.getNodeName();
                                    if ("IpAddress".equals(fptNodeName)) {
                                        String mapName = "ftpIp";
                                        retMap.put(mapName, "");
                                        if (ftpNode.getFirstChild() != null) {
                                            String value = ftpNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("port".equals(fptNodeName)) {
                                        String mapName = "ftpPort";
                                        retMap.put(mapName, "");
                                        if (ftpNode.getFirstChild() != null) {
                                            String value = ftpNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("loginName".equals(fptNodeName)) {
                                        String mapName = "ftpUserName";
                                        retMap.put(mapName, "");
                                        if (ftpNode.getFirstChild() != null) {
                                            String value = ftpNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("pwd".equals(fptNodeName)) {
                                        String mapName = "ftpPwd";
                                        retMap.put(mapName, "");
                                        if (ftpNode.getFirstChild() != null) {
                                            String value = ftpNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("ftpPath".equals(fptNodeName)) {
                                        String mapName = "ftpDir";
                                        retMap.put(mapName, "");
                                        if (ftpNode.getFirstChild() != null) {
                                            String value = ftpNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                }
                            }
                        }
                        if ("database".equals(name)) {
                            for (Node dbNode = node.getFirstChild(); dbNode != null; dbNode = dbNode.getNextSibling()) {
                                if (dbNode.getNodeType() == Node.ELEMENT_NODE) {
                                    String dbNodeName = dbNode.getNodeName();
                                    if ("IpAddress".equals(dbNodeName)) {
                                        String mapName = "serverIp";
                                        retMap.put(mapName, "");
                                        if (dbNode.getFirstChild() != null) {
                                            String value = dbNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("port".equals(dbNodeName)) {
                                        String mapName = "serverPort";
                                        retMap.put(mapName, "");
                                        if (dbNode.getFirstChild() != null) {
                                            String value = dbNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("loginName".equals(dbNodeName)) {
                                        String mapName = "DBLoginName";
                                        retMap.put(mapName, "");
                                        if (dbNode.getFirstChild() != null) {
                                            String value = dbNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("pwd".equals(dbNodeName)) {
                                        String mapName = "dbPwd";
                                        retMap.put(mapName, "");
                                        if (dbNode.getFirstChild() != null) {
                                            String value = dbNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("databaseName".equals(dbNodeName)) {
                                        String mapName = "databaseName";
                                        retMap.put(mapName, "");
                                        if (dbNode.getFirstChild() != null) {
                                            String value = dbNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("databaseCharSet".equals(dbNodeName)) {
                                        String mapName = "databaseCharSet";
                                        retMap.put(mapName, "");
                                        if (dbNode.getFirstChild() != null) {
                                            String value = dbNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }
                                }
                            }
                        }
                        if ("filter".equals(name)) {
                            for (Node filterNode = node.getFirstChild(); filterNode != null; filterNode = filterNode.getNextSibling()) {
                                if (filterNode.getNodeType() == Node.ELEMENT_NODE) {
                                    String filterNodeName = filterNode.getNodeName();
                                    if ("level".equals(filterNodeName)) {
                                        String mapName = "level";
                                        retMap.put(mapName, "");
                                        if (filterNode.getFirstChild() != null) {
                                            String value = filterNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("subject".equals(filterNodeName)) {
                                        String mapName = "subject";
                                        retMap.put(mapName, "");
                                        if (filterNode.getFirstChild() != null) {
                                            String value = filterNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("version".equals(filterNodeName)) {
                                        String mapName = "version";
                                        retMap.put(mapName, "");
                                        if (filterNode.getFirstChild() != null) {
                                            String value = filterNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("area".equals(filterNodeName)) {
                                        String mapName = "area";
                                        retMap.put(mapName, "");
                                        if (filterNode.getFirstChild() != null) {
                                            String value = filterNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                    if ("from".equals(filterNodeName)) {
                                        String mapName = "from";
                                        retMap.put(mapName, "");
                                        if (filterNode.getFirstChild() != null) {
                                            String value = filterNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }
                                    if ("attr".equals(filterNodeName)) {
                                        String mapName = "attr";
                                        retMap.put(mapName, "");
                                        if (filterNode.getFirstChild() != null) {
                                            String value = filterNode.getFirstChild().getNodeValue();
                                            retMap.put(mapName, value);
                                        }
                                    }

                                }
                            }
                        }
                        
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return retMap;
    }

    public static void modifyTargetInfo(String id,String tagName,String value) {
        if(null==tagName || tagName.equals("") )
            return ;
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setIgnoringElementContentWhitespace(true);
        try {

            DocumentBuilder db = dbf.newDocumentBuilder();
            Document xmlDoc = db.parse(xmlPath);

            Element root = xmlDoc.getDocumentElement();
            Element per =null;
            if(tagName.equals("serverIp") || tagName.equals("serverPort")
                    || tagName.equals("DBLoginName") || tagName.equals("dbPwd")
                    || tagName.equals("databaseName") || tagName.equals("databaseCharSet")) {
                per = (Element) selectSingleNode("/targetInfo/server[@id='" + id + "']/database", root);
            }else if(tagName.equals("ftpIp") || tagName.equals("ftpPort")
                        || tagName.equals("ftpUserName") || tagName.equals("ftpPwd")
                        || tagName.equals("ftpDir")){
                per = (Element) selectSingleNode("/targetInfo/server[@id='"+id+"']/ftp", root);
            }else if(tagName.equals("level") || tagName.equals("subject")
                    || tagName.equals("version") || tagName.equals("area")
                    || tagName.equals("from") || tagName.equals("attr")){
                per = (Element) selectSingleNode("/targetInfo/server[@id='"+id+"']/filter", root);
            }else{
                per = (Element) selectSingleNode("/targetInfo/server[@id='"+id+"']", root);
            }
            String mapTagName = tagName;
            if(tagName.equals("serverIp") || tagName.equals("ftpIp")){
                mapTagName = "IpAddress";
            }else if(tagName.equals("serverPort") || tagName.equals("ftpPort")){
                mapTagName = "port";
            }else if(tagName.equals("DBLoginName") || tagName.equals("ftpUserName")){
                mapTagName = "loginName";
            }else if(tagName.equals("dbPwd") || tagName.equals("ftpPwd")){
                mapTagName = "pwd";
            }else if(tagName.equals("schoolName")){
                mapTagName = "desc";
            }else if(tagName.equals("webServicePath")) {
                mapTagName = "webServiceAddr";
            }else if(tagName.equals("ftpDir")) {
                mapTagName = "ftpPath";
            }else if(tagName.equals("webServiceAddr")) {
                mapTagName = "webServicePath";
            }
            try{
                per.getElementsByTagName(mapTagName).item(0).setTextContent(value);
            }catch (Exception e){
                throw new Exception("请在id="+id+"的服务中添加标签:"+mapTagName+",值为："+value);
            }

            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer former = factory.newTransformer();
            former.transform(new DOMSource(xmlDoc), new StreamResult(new File(xmlPath)));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteSever(String id) {
        if(null==id || "".equals(id)) return ;
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setIgnoringElementContentWhitespace(true);

        try {

            DocumentBuilder db = dbf.newDocumentBuilder();
            Document xmlDoc = db.parse(xmlPath);

            Element root = xmlDoc.getDocumentElement();

            Element son = (Element) selectSingleNode("/targetInfo/server[@id='"+id+"']", root);
            root.removeChild(son);

            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer former = factory.newTransformer();
            former.transform(new DOMSource(xmlDoc), new StreamResult(new File(xmlPath)));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String createServer(Map<String,String> serverInfo) {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setIgnoringElementContentWhitespace(false);
        String id = UUID.randomUUID().toString();
        try {
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document xmlDoc = db.parse(xmlPath);
            Element root = xmlDoc.getDocumentElement();

            Element server = xmlDoc.createElement("server");
            server.setAttribute("id", id);

            Element  desc = xmlDoc.createElement("desc");
            desc.setTextContent(serverInfo.get("schoolName"));
            server.appendChild(desc);

            Element  serverCode = xmlDoc.createElement("serverCode");
            serverCode.setTextContent(serverInfo.get("serverCode"));
            server.appendChild(serverCode);

            Element  connectDate = xmlDoc.createElement("connectDate");
            connectDate.setTextContent(serverInfo.get("connectDate"));
            server.appendChild(connectDate);

            Element  endDate = xmlDoc.createElement("endDate");
            endDate.setTextContent(serverInfo.get("endDate"));
            server.appendChild(endDate);

            Element  synContent = xmlDoc.createElement("synContent");
            synContent.setTextContent(serverInfo.get("synContent"));
            server.appendChild(synContent);

            Element  createTime = xmlDoc.createElement("createTime");
            createTime.setTextContent(serverInfo.get("createTime"));
            server.appendChild(createTime);

            Element  synType = xmlDoc.createElement("synType");
            synType.setTextContent(serverInfo.get("synType"));
            server.appendChild(synType);

            Element  synInterval = xmlDoc.createElement("synInterval");
            synInterval.setTextContent(serverInfo.get("synInterval"));
            server.appendChild(synInterval);

            Element  synFlag = xmlDoc.createElement("synFlag");
            synFlag.setTextContent(serverInfo.get("synFlag"));
            server.appendChild(synFlag);
            
            Element  webServiceAddr = xmlDoc.createElement("webServicePath");
            webServiceAddr.setTextContent(serverInfo.get("webServiceAddr"));
            server.appendChild(webServiceAddr);


            Element  ftp = xmlDoc.createElement("ftp");

            Element  ftpIp = xmlDoc.createElement("IpAddress");
            ftpIp.setTextContent(serverInfo.get("ftpIp"));
            ftp.appendChild(ftpIp);

            Element  ftpPort = xmlDoc.createElement("port");
            ftpPort.setTextContent(serverInfo.get("ftpPort"));
            ftp.appendChild(ftpPort);

            Element  ftpUserName = xmlDoc.createElement("loginName");
            ftpUserName.setTextContent(serverInfo.get("ftpUserName"));
            ftp.appendChild(ftpUserName);

            Element  ftpPwd = xmlDoc.createElement("pwd");
            ftpPwd.setTextContent(serverInfo.get("ftpPwd"));
            ftp.appendChild(ftpPwd);

            Element  ftpDir = xmlDoc.createElement("ftpPath");
            ftpDir.setTextContent(serverInfo.get("ftpDir"));
            ftp.appendChild(ftpDir);
            server.appendChild(ftp);

            Element  database = xmlDoc.createElement("database");

            Element  serverIp = xmlDoc.createElement("IpAddress");
            serverIp.setTextContent(serverInfo.get("serverIp"));
            database.appendChild(serverIp);

            Element  serverPort = xmlDoc.createElement("port");
            serverPort.setTextContent(serverInfo.get("serverPort"));
            database.appendChild(serverPort);

            Element  DBLoginName = xmlDoc.createElement("loginName");
            DBLoginName.setTextContent(serverInfo.get("DBLoginName"));
            database.appendChild(DBLoginName);

            Element  dbPwd = xmlDoc.createElement("pwd");
            dbPwd.setTextContent(serverInfo.get("dbPwd"));
            database.appendChild(dbPwd);

            Element  databaseName = xmlDoc.createElement("databaseName");
            databaseName.setTextContent(serverInfo.get("databaseName"));
            database.appendChild(databaseName);


            Element  databaseCharSet = xmlDoc.createElement("databaseCharSet");
            databaseCharSet.setTextContent(serverInfo.get("databaseCharSet"));
            database.appendChild(databaseCharSet);

            server.appendChild(database);

            Element  filter = xmlDoc.createElement("filter");

            Element  level = xmlDoc.createElement("level");
            level.setTextContent(serverInfo.get("level"));
            filter.appendChild(level);

            Element  subject = xmlDoc.createElement("subject");
            subject.setTextContent(serverInfo.get("subject"));
            filter.appendChild(subject);

            Element  version = xmlDoc.createElement("version");
            version.setTextContent(serverInfo.get("version"));
            filter.appendChild(version);

            Element  area = xmlDoc.createElement("area");
            area.setTextContent(serverInfo.get("area"));
            filter.appendChild(area);

            Element  from = xmlDoc.createElement("from");
            from.setTextContent(serverInfo.get("from"));
            filter.appendChild(from);

            Element  attr = xmlDoc.createElement("attr");
            attr.setTextContent(serverInfo.get("attr"));
            filter.appendChild(attr);

            server.appendChild(filter);


            root.appendChild(server);
            //保存
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer former = factory.newTransformer();
            StreamResult sr = new StreamResult(new File(xmlPath));
            DOMSource dm = new DOMSource(xmlDoc);
//            former.transform(new DOMSource(xmlDoc), new StreamResult(new File(xmlPath)));
            former.transform(dm, sr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public static Node selectSingleNode(String express, Element source) {
        Node result = null;
        XPathFactory xpathFactory = XPathFactory.newInstance();
        XPath xpath = xpathFactory.newXPath();
        try {
            result = (Node) xpath.evaluate(express, source, XPathConstants.NODE);
        } catch (XPathExpressionException e) {
            e.printStackTrace();
        }

        return result;
    }

    public static List<Map<String,String>> getAllServer(){
        List<Map<String,String>> retVal = new ArrayList<Map<String,String>>();
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setIgnoringElementContentWhitespace(true);
        try {
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(xmlPath); // 使用dom解析xml文件

            NodeList serverList = doc.getElementsByTagName("server");
            for (int i = 0; i < serverList.getLength(); i++) // 循环处理对象
            {
                String id = serverList.item(i).getAttributes().getNamedItem("id").getNodeValue();
                retVal.add(getServerParam(id));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return retVal;
    }

    public static Map<String,ServerConfigForm> getServerMap(String querySchool){
        Map<String,ServerConfigForm> retVal = new HashMap<String,ServerConfigForm>();
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setIgnoringElementContentWhitespace(true);
        try {
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(xmlPath); // 使用dom解析xml文件

            NodeList serverList = doc.getElementsByTagName("server");
            for (int i = 0; i < serverList.getLength(); i++) // 循环处理对象
            {
                Element son = (Element) serverList.item(i);
                String id = serverList.item(i).getAttributes().getNamedItem("id").getNodeValue();
                String isNeedAddFlag = ""; //是否满足条件.
                for (Node node = son.getFirstChild(); node != null; node = node.getNextSibling()) {
                    ServerConfigForm serverConfigForm = new ServerConfigForm();
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        String name = node.getNodeName();
                        if("desc".equals(name)){
                            if(CommonTools.isEmpty(querySchool)){
                                if(node.getFirstChild()!=null){
                                    serverConfigForm.setDesc(node.getFirstChild().getNodeValue());
                                    retVal.put(id,serverConfigForm);
                                }else{
                                    serverConfigForm.setDesc("");
                                    retVal.put(id,serverConfigForm);
                                }
                            }else{
                                if(node.getFirstChild()!=null && node.getFirstChild().getNodeValue().indexOf(querySchool)>-1){
                                    serverConfigForm.setDesc(node.getFirstChild().getNodeValue());
                                    retVal.put(id,serverConfigForm);
                                }
                            }
                        }else if("synFlag".equals(name)){
                            ServerConfigForm tmp = retVal.get(id);
                            if(tmp!=null){
                                if(node.getFirstChild()!=null){
                                    tmp.setSynFlag(node.getFirstChild().getNodeValue());
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        return retVal;
    }

    public static void main(String[] args) {

//        System.out.println(xmlPath);
//        getAllServer();
        String id = "";
        Map<String,String> newServer = new HashMap<String, String>();
        newServer.put("dbIp","10.87.9.165");
        newServer.put("dbPort","1521");
        newServer.put("ftpIp","10.87.9.165");
        newServer.put("ftpPort","21");
        id = createServer(newServer);
//
        getServerParam(id);
//        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//        modifyTargetInfo(id, "dbIp", "127.0.0.1");
//        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//        getServerParam(id);
//        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//        deleteSever(id);
//        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//        getServerParam(id);
//        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//        id = createServer(newServer);
//        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//        getServerParam(id);
    }

    public static void updateServer(String id ,Map<String, String> serverInfo) {
        for(String key:serverInfo.keySet()){
            modifyTargetInfo(id,key,serverInfo.get(key));
        }
    }

    public static void updateSynFlag(String id, String flag) {
//        System.out.println(id+"===>"+flag);
        modifyTargetInfo(id,"synFlag",flag);
    }

    public static String checkPk(String serverId, String serverCode) {
        String retVal = "N";
//        System.out.println(serverId+"===>"+serverCode);
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setIgnoringElementContentWhitespace(true);
        try {
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(xmlPath); // 使用dom解析xml文件

            NodeList serverList = doc.getElementsByTagName("server");
            for (int i = 0; i < serverList.getLength(); i++) // 循环处理对象
            {
                Element son = (Element) serverList.item(i);
                String id = serverList.item(i).getAttributes().getNamedItem("id").getNodeValue();
                if(serverId.equals(id)) continue;
                for (Node node = son.getFirstChild(); node != null; node = node.getNextSibling()) {
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        String name = node.getNodeName();
                        if("serverCode".equals(name)){
                            if(node.getFirstChild()!=null && serverCode.equals(node.getFirstChild().getNodeValue())){
                                retVal = "Y";
                                break;
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return retVal;
    }
}

