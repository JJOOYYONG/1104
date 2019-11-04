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
    
    <style>
	table#comments_area {
		border: 1px solid #ccc;
		width:622px;
		margin :10px00;
		font-weight: bold;
		
		vertical-align: middle;
	}
	
	table#comments_area th {
		width: 100px;
		padding: 10px;
		font-weight: bold;
		text-align:center;
		vertical-align: top;
		border: 1px solid #ccc;
	}
	
	table#comments_area td {
		width: 150px;
		padding: 10px;
		vertical-align: top;
		border: 1px solid #ccc;
	
	}


	#text{
	
		width:600px;
		height:100px;
		text-align:center;
		vertical-align:middle;
		overflow:auto;
		resize: none;
		padding:00010px;
		
	
	
	
	}
	
	.twrite{
	font-weight: bold;
	text-align:center;
	font_size:10px;
	}
	
	
	
	
</style>
    
</head>

<%
	//세션값
	String id = (String) session.getAttribute("id");

	//페이지번호 pageNum 파라미터값 가져오기
	String pageNum = request.getParameter("pageNum");

	//글 번호 num 파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));

	//DAO 객체준비
	BoardDao boardDao = BoardDao.getInstance();

	//조회소 1증가시키는 메소드 호출
	boardDao.updateReadcount(num);

	//글번호에 해당하는 레코드 한개 가져오기
	BoardVO boardVO = boardDao.getBoard(num);

	//글작성날짜 형식 "yyyy년MM월dd일 hh시mm분ss초"
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 hh시mm분ss초");
%>






<body>
	<div id="wrap">
		
		
		<jsp:include page ="../include/header.jsp"/>
   
  		<h1 id="customer"><div>recommend Content</div></h1>
  		<article>
  			<h2>자유게시판</h2>
      <table id="cbbs">
      	<tr>
      		<th class="twrite">글번호</th>
      		<td class="left" width="200"><%=boardVO.getNum() %></td>
      		<th class="twrite">조회수</th>
      		<td class="left" width="200"><%=boardVO.getReadcount() %></td>
      	</tr>
      	<tr>
      		<th class="twrite">게시일</th>
      		<td class="left"><%=sdf.format(boardVO.getRegDate()) %></td>
      		<th class="twrite">게시자</th>
      		<td class="left"><%=boardVO.getUsername() %></td>
      	</tr>
      	
      	<tr>		
      		<th class="twrite" >제목</th>
      		<td class="left" colspan="3"><%=boardVO.getSubject() %></td>
      	</tr>	
      	
      	<tr>	
      		<th class="twrite">글내용</th>
      		<td class ="left" colspan="5"><pre><%=boardVO.getContent() %></pre></td>
      	</tr>
      	
        </table>
        
        	
       
        <div class="clear"></div>
			<form id="searchbbs">
				<input type="button" value="글수정" class="btn2"
					onclick="location.href='../customer/update.jsp?num=<%=boardVO.getNum()%>&pagenum=<%=pageNum%>>';">
				<input type="button" value="글삭제" class="btn2"
					onclick="location.href='../customer/delete.jsp?num=<%=boardVO.getNum()%>&pagenum=<%=pageNum%>>';">


				
			
					<%
						if (id == null) {
					%>
					<textarea id ="text"   rows="5" cols="30" name="content" placeholder="로그인후 이용가능합니다."></textarea>
					<input type="hidden" name="bno" value="<%=boardVO.getNum()%>">
					<input type="button" value="댓글입력" id="btn3" style="display: none;">

					<%
						} else if (id != null) {
					%>
					<textarea id ="text" rows="5" cols="30" name="content" placeholder="댓글을 입력해주세요." ></textarea>
					<input type="hidden" name="bno" value="<%=boardVO.getNum()%>">
					<input type="button" value="댓글입력" id="btn3" style="float: right;">
					<%
						}
					%>

				
				
		

			</form>

   			 <!-- 댓글등록 -->
   		 <table id="comments_area"></table>
   	
        
    	</article>

		<%--aside 영역 --%>
		<jsp:include page ="../include/sidebar_customer.jsp"/>
  		

        <div class="clear"></div>

		<jsp:include page ="../include/footer.jsp"/>       

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	
	
	$.ajax({
		url:'RepleShow.jsp',
		data: { bno: <%=boardVO.getNum() %> },
		success:function(data){
			console.log(data);
			
//				$('#comments_area').empty();

			var str = '';
			
			$.each(data, function (index, item) {
				
				str += '<tr>';
				str += '<th>'+ item.id +'님의 댓글</th>';
				str += '<td>'+ item.content + '</td>';
				str += '</tr>';
			});
			
			$('#comments_area').html(str);
		}
	});
	

	
	
	
	$('#btn3').click(function(){
		
		var strData = $('form#searchbbs').serialize();
		console.log('strData : ' + strData);
		
		$.ajax({
			url:'RepleJson.jsp',
			data: strData,
			type:'post',
			success:function(data){
				console.log(data);
				
// 				$('#comments_area').empty();
				
				var str = '';
				
				$.each(data, function (index, item) {
					str += '<tr>';
					str += '<th>'+ item.id +'님의 댓글</th>';
					str += '<td>'+ item.content + '</td>';
					str += '</tr>';
					
// 					$('#comments_area').append(str);
				});
				
				$('#comments_area').html(str);

			}
		});
	});

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