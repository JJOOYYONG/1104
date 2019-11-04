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
</head>

<body>
	<div id="wrap">
		
		
		<jsp:include page ="../include/header.jsp"/>
   
  		<h1 id="company"><div>company</div></h1>
  		<article>
  			<h2>ceo 인사말</h2>
  			 <figure> 
				<img src="../imgs/ceo.jpg" alt="ceo">
				<figcaption>ceo y.s. yang</figcaption> 
  			</figure>
  			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget mi arcu. Praesent bibendum turpis at quam porta a bibendum nulla venenatis. Nulla in metus at velit gravida condimentum vitae sit amet urna. Donec bibendum erat placerat turpis pretium eget aliquet massa lobortis. Proin placerat nisi vitae dui aliquet dignissim. Integer in leo vel augue consequat gravida. Donec lobortis dictum justo, at convallis ligula pretium vitae. Sed eget lorem quis risus iaculis dictum. Curabitur velit enim, aliquet nec egestas non, ultricies ut felis. Praesent elit urna, dictum a congue at, elementum quis risus.
Ut bibendum aliquet lectus id dictum. Vestibulum lectus metus, aliquet sed iaculis sed, consequat vitae quam. Curabitur orci orci, fringilla vehicula fringilla mollis, hendrerit fringilla est. Praesent posuere vehicula blandit. </p>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget mi arcu. Praesent bibendum turpis at quam porta a bibendum nulla venenatis. Nulla in metus at velit gravida condimentum vitae sit amet urna. Donec bibendum erat placerat turpis pretium eget aliquet massa lobortis. Proin placerat nisi vitae dui aliquet dignissim. Integer in leo vel augue consequat gravida. Donec lobortis dictum justo, at convallis ligula pretium vitae. Sed eget lorem quis risus iaculis dictum. Curabitur velit enim, aliquet nec egestas non, ultricies ut felis. Praesent elit urna, dictum a congue at, elementum quis risus.
Ut bibendum aliquet lectus id dictum. Vestibulum lectus metus, aliquet sed iaculis sed, consequat vitae quam. Curabitur orci orci, fringilla vehicula fringilla mollis, hendrerit fringilla est. Praesent posuere vehicula blandit. </p>
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