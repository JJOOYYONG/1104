<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
	<meta charset="UTF-8">
	<title>뮤비리뷰에 오신 여러분을 환영합니다.</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
    <style>
    h2{
		width:200px; left:0; right:0; margin-left:auto; margin-right:auto;

	}
    
    p{
    	font-size : 20px;
    
    }
    </style>
    
</head>

<body>
	<div id="wrap">
		
		
		<jsp:include page ="../include/header.jsp"/>
   
  		<h1 id="company"><div>manager</div></h1>
  		<article>
  		
  		<h2>전체 방문자</h2>
  		
  	
<%--   		<jsp:useBean id="counter" class ="com.exam.vo.CounterBean" scope="application"></jsp:useBean> --%>
<%--   		<jsp:setProperty name="counter" property="newVisit" value="1"/> --%>
  		
		
<%-- 		<h1>방문자수 : <jsp:getProperty property="visitCount" name ="counter"/></h1> --%>
		
			<jsp:useBean id="Counter" class="com.exam.vo.CounterBean" scope="application"/>
			<%
			int count;
			Counter.setNewVisit();
			count = Counter.getVisitCount();
			
			%>
			<p>방문자수 : <%=count %></p>
		</article>
  	<jsp:include page="../include/sidebar_company.jsp"/>


        <div class="clear"></div>
       
       <jsp:include page = "../include/footer.jsp"/>
       
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