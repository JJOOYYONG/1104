<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	
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
		
		<%//세션값 가져오기
		
		String id=(String)session.getAttribute("id");
		%>



  		<h1 id="customer"><div>notice Write</div></h1>
  		
  		
  		
  		
  	<article>
  	<h2>글쓰기</h2>
  		
  		
  			
  	<form action="writeProcess.jsp" method="post" name="frm" onsubmit="return check();">
    <table id="cbbs">
    
    <% 
    
    if(id==null) { // 로그인 안했을때 
   
    %>
    	<tr>
    	<th class="twrite">이름</th>
    	<td class="left" width="300">
    	<input type ="text" name ="username"></td>
    	</tr>
    	
    	<tr>
    	<th class="twrite">패스워드</th>
    	<td class="left" width="300">
    	<input type ="password" name ="passwd"></td>
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
    	<input type ="text" name="subject"></td>
    	</tr>
    	
    	<tr>
    	<th class="twrite">내용</th>
    	<td class="left">
    	<textarea name="content" rows="13" cols="40"></textarea>
    	</td>
    	</tr>

      	
        </table>
        
		<div id ="table_search">
		<input type ="submit" value="글쓰기" class="btn2">
        <input type ="reset" value="다시작성" class="btn2">
        <input type ="button" value="목록보기" class="btn2" onclick="location.href='customer.jsp'">
		</div>
        
   
    	
    	</form>
    	</article>

		<%--aside 영역 --%>
		<jsp:include page ="../include/sidebar_customer.jsp"/>
  		

        <div class="clear"></div>

		<jsp:include page ="../include/footer.jsp"/>       

	</div>

	 	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script>
  	function check(){
  
  		if(frm.username.value.length==0){
  			alert('유저네임을 적어주세요');
  			frm.username.focus();
  			return false;
  		}
  
  		if(frm.passwd.value.length==0){
  			alert('비밀번호를 입력해주세요');
  			frm.passwd.focus();
  			return false;
  			
  		}
  		if(frm.subject.value.length==0){
  			alert('제목을 적어주세요');
  			frm.subject.focus();
  			return false;
  		}
  		if(frm.content.value.length==0){
  			alert('내용을 입력해주세요');
  			frm.subject.focus();
  			return false;
  			
  		}
  		return true;
  	}//function

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