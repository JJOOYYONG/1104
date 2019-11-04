<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%--post 파라미터값 한글처리--%>
	<%request.setCharacterEncoding("utf-8");%>
	 <%--boardVO 자바빈 객체생성--%>
    <jsp:useBean id = "boardVO" class ="com.exam.vo.BoardVO"/>
    
    <%--자바빈 객체에 파라미터값 찾아서 저장--%>
    <jsp:setProperty property = "*" name ="boardVO"/>

    
    <%--pageNum 파라미터값 가져오기--%>
    <% String pageNum = request.getParameter("pageNum");%>
    
    <%
    int num = Integer.parseInt(request.getParameter("num"));
    //passwd 파라미터값은 로그인 사용자일 경우 null
    String passwd = request.getParameter("passwd");
    //DAO객체 준비
    BoardDao boardDao = BoardDao.getInstance();
    
    //세션값 가져오기
    String id =(String) session.getAttribute("id");
    
   
	
	if(id==null){//로그인 안한 사용자
		if(!boardDao.isPasswdEqual(num, passwd)){
			%>
			
			<Script>
			alert('글패스워드가 다릅니다.');
			history.back();
			</Script>
			
			<%
			return;
		}//if2
		
	}
    
	//게시글 삭제하기 메소드
	boardDao.deleteBoard(num);
	

	
    %>
 	<script>
   	alert('삭제되었습니다.!');
   	location.href='customer.jsp?num=<%=boardVO.getNum()%>';
    </script>