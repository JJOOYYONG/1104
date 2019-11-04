<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<%
	//파라미터값 가져오기
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	
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
		alert('수정 권한이 없습니다.');
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
	
	
</head>


<body>
	<div id="wrap">
		
		<!-- 헤더영역 -->
		<jsp:include page ="../include/header.jsp"/>
		


  		<h1 id="customer"><div>notice Write</div></h1>
  		
  		
  		
  		
  	<article>
  	<h2>글쓰기</h2>
  		
  		
  			
  	<form action="updateProcess.jsp" method="post" name="frm" onsubmit="return check();">
  	<input type ="hidden" name="num" value="<%=num%>">
	<input type ="hidden" name="pageNum" value="<%=pageNum%>"> 
    <table id="cbbs">
    
    <% 
    
    if(id==null) { // 로그인 안했을때 
   
    %>
    	<tr>
    	<th class="twrite">이름</th>
    	<td class="left" width="300">
    	<input type ="text" name ="username" value="<%=boardVO.getUsername()%>" readonly="readonly"></td>
    	</tr>
    	
    	<tr>
    	<th class="twrite">패스워드</th>
    	<td class="left" width="300">
    	<input type ="password" name ="passwd" placeholder ="작성자 확인을 위한 패스워드 입력하세요"></td>
    	</tr>
    	
    	<%
    }else{
    	%>
    	<tr>
    	<th class="twrite">아이디</th>
    	<td class="left" width="300">
    	<input type="text" name ="username" value="<%=id %>"readonly></td>
    	</tr>
    	
    	<%
    	
    	
    }
    	%>
    	
    	<tr>
    	<th class="twrite">제목</th>
    	<td class="left">
    	<input type ="text" name="subject" value="<%=boardVO.getSubject()%>"></td>
    	</tr>
    	
    	<tr>
    	<th class="twrite">내용</th>
    	<td class="left">
    	<textarea name="content" rows="13" cols="40"><%=boardVO.getContent() %></textarea>
    	</td>
    	</tr>

      	
        </table>
        

        
        
        <div class="btn">
        <input type ="submit" value="글수정" class="btn2">
        <input type ="submit" value="글쓰기" class="btn2">
        <input type ="reset" value="다시작성" class="btn2">
        <input type ="button" value="목록보기" class="btn2" onclick="location.href='customer.jsp'"></div>
    	
    	</form>
    	</article>

		<%--aside 영역 --%>
		<jsp:include page ="../include/sidebar_customer.jsp"/>
  		

        <div class="clear"></div>

		<jsp:include page ="../include/footer.jsp"/>       

	</div>

	<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	function check(){
		var objPasswd = document.frm.passwd;
		if(objPasswd != null){
			if(objPasswd.value.length ==0){
				alert('게시글 패스워드는 필수 입력사항 입니다.');
				objPasswd.focus();
			}
		}
		
		//글 수정 의도 확인
		var result = confirm('<%=num%>번 글을 정말로 수정하시겠습니까?');
		if (result == false){
			return false;
		}
	}
	
	
	
	</script>

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