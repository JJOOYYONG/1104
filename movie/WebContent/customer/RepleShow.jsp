<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.vo.RepleVO"%>
<%@page import="com.exam.dao.RepleDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    int bno = Integer.parseInt(request.getParameter("bno"));
    
   	//DAO객체준비
    RepleDao repleDao= RepleDao.getInstance();
   
    List<RepleVO> repleList = repleDao.getReples(bno);
    
    
    Gson gson = new Gson();
    String strJson = gson.toJson(repleList);
    
    %>
    
    <%=strJson%>