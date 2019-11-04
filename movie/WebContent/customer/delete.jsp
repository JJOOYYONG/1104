<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

		<%
	//파라미터값 가져오기
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	//DAO 객체 준비
	BoardDao boardDao = BoardDao.getInstance();
	
	//수정할 글 가져오기
	BoardVO boardVO = boardDao.getBoard(num);
	
	//세션값 가져오기
	String id = (String)session.getAttribute("id");
	
	
	%>
	<%!
	
	//jsp 자체적으로 가지는 선언문
	public boolean hasNotAuth(String id,BoardVO boardVO){
		
		boolean result =
			id == null && boardVO.getPasswd() == null
			|| id != null && boardVO.getPasswd() != null
			|| id != null && !id.equals(boardVO.getUsername());
		
		return result;
	}
	%>
	
	<%
	if(id == null && boardVO.getPasswd() == null
			|| id != null && boardVO.getPasswd() != null
			|| id != null && !id.equals(boardVO.getUsername())){
		%>
		<script>
		alert('삭제 권한이 없습니다.');
		history.back();
		</script>
		
		
		<%
		return;
	}
	
	%>
	
	<head>
	<meta charset="UTF-8">
	<title>무비리뷰에 오신 여러분을 환영합니다.</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
	
		<script>
		function check() {
			var objpasswd = document.frm.passwd;
			if(objpasswd!= null){
				if(objpasswd.value.length==0){
					alert('패스워드는 필수입력사항입니다.');
					objpasswd.focus();
					return false;
				}
			}
		}
	</script>

	
</head>


<body>
	<div id="wrap">
		
		<!-- 헤더영역 -->
		<jsp:include page ="../include/header.jsp"/>
		


  		<h1 id="customer"><div>notice Write</div></h1>
  		
  		
  		
  		
  	<article>
  	<h2>글쓰기</h2>
  		
  	
		
  	<% if(id==null){ %>		
  	<form action="deleteProcess.jsp" method="post" name="frm" onsubmit="return check();">
  	<input type ="hidden" name="num" value="<%=num%>">
	<input type ="hidden" name="pageNum" value="<%=pageNum%>"> 
    <table id="cbbs">
    

 
    	
    	<tr>
    	<th class="twrite">패스워드</th>
    	<td class="left" width="300">
    	<input type ="password" name ="passwd" placeholder ="작성자 확인을 위한 패스워드 입력하세요"></td>
    	</tr>

      	</table>
        

        
        
        <div class="btn">
        <input type ="submit" value="글삭제" class="btn2">
        <input type ="button" value="목록보기" class="btn2" onclick="location.href='customer.jsp'"></div>
   
    	</form>
    	 	<%
   		}else{
   			response.sendRedirect("deleteProcess.jsp?num="+num+"&pageNum="+pageNum);
   		}
   	%>
    	</article>

		<%--aside 영역 --%>
		<jsp:include page ="../include/sidebar_customer.jsp"/>
  		

        <div class="clear"></div>

		<jsp:include page ="../include/footer.jsp"/>       

	</div>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../scripts/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="../scripts/prettify.packed.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function() {
			$(".fancybox").fancybox({
				openEffect	: 'none',
				closeEffect	: 'none'
			});
		});
  	</script>
</body>
</html>