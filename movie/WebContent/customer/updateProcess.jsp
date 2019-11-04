<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%--post 파라미터값 한글처리--%>
    <% request.setCharacterEncoding("utf-8");%>
    
    <%--boardVO 자바빈 객체생성--%>
    <jsp:useBean id = "boardVO" class ="com.exam.vo.BoardVO"/>
    
    <%--자바빈 객체에 파라미터값 찾아서 저장--%>
    <jsp:setProperty property = "*" name ="boardVO"/>
    
    <%--pageNum 파라미터값 가져오기--%>
    <% String pageNum = request.getParameter("pageNum"); %>
    
    <%
    //DAO 객체 준비
    BoardDao boardDao = BoardDao.getInstance();
    
    //세션값 가져오기(로그인 여부 확인)
    String id = (String) session.getAttribute("id");
    
    if(id ==null){
    	boolean isPasswdEqual = boardDao.isPasswdEqual(boardVO.getNum(),boardVO.getPasswd());

    	if(!isPasswdEqual){
    		%>
    		<script>
    		alert('글 패스워드가 다릅니다.');
    		history.back();
    		
    		</script>
    		
    		<%
    		return;
    	}
	}
    
    //게시글 수정하기 메소드 호출
    boardDao.updateBoard(boardVO);
    %>
    
    <script>
   	alert('글 수정 성공!');
   	location.href='content.jsp?num=<%=boardVO.getNum()%>';
    </script>