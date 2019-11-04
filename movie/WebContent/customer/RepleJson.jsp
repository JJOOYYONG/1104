<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.vo.RepleVO"%>
<%@page import="com.exam.dao.RepleDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="repleVO" class="com.exam.vo.RepleVO" />

<jsp:setProperty property="*" name="repleVO"/>


    <%
    
    String id = (String) session.getAttribute("id");
    repleVO.setId(id);
    

    
   	//DAO객체준비
    RepleDao repleDao= RepleDao.getInstance();
    
   	int num = repleDao.nextBoardNum();
   	repleVO.setNum(num);
   	
    //글 삽입하기....
    repleDao.insertReple(repleVO);
    
    
    int bno = repleVO.getBno();
    List<RepleVO> repleList = repleDao.getReples(bno);
    
    
    Gson gson = new Gson();
    String strJson = gson.toJson(repleList);
    
    %>

    <%=strJson%>