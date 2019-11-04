<%@page import="com.exam.vo.Attach2VO"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.dao.Attach2Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<%--헤드영역 --%>
<head>
	<meta charset="UTF-8">
	<title>무비리뷰에 오신 여러분을 환영합니다.</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
</head>
<%
	
	String strPageNum = request.getParameter("pageNum");
	if(strPageNum==null){
		strPageNum="1";
	}
	//페이지번호
	int pageNum = Integer.parseInt(strPageNum);

	//DAO객체 준비
	Attach2Dao attachDao = Attach2Dao.getInstance();
	
	//한페이지 보여줄 글 개수
	int pageSize = 9;
	
	//시작행 번호 구하기
	int startRow =(pageNum-1)*pageSize +1;
	
	//테이블 전체 글자수 가져오기
	int count = attachDao.getlistCount();
	//해당 넘버 글 내용 리스트로된 배열 메소드 호출
	List<Attach2VO> attachList = attachDao.getAttaches(startRow,pageSize);


%>

<body>
	<div id="wrap">
		
		<%--헤더영역 --%>
		<jsp:include page ="../include/header.jsp"/>
   
  		<h1 id="community"><div>community</div></h1>
  		<article>
  			<h2>인증샷</h2>
  			<article id="gallery">
  			<%
  			  				if(count>0){
  			  			  				
  			  			  			for(Attach2VO attachVO :attachList ){
  			  			  				if(attachVO.getFiletype().equals("I")){
  			  			%>
  					
  					<figure><a class="fancybox" data-fancybox-group="gallery"  href="../upload_community/<%=attachVO.getFilename() %>?num=<%=attachVO.getNum() %>>" title="<%=attachVO.getSubject()%>">
  					<img src="../upload_community/<%=attachVO.getFilename() %>" style="width: 200px; height: 200px;"> <figcaption><%=attachVO.getSubject()%> </figcaption></a></figure>
  					
  					<%
  				}
  			}
  			%>
  			</article>
  			<%
  			}else{
  				%>
  			<article id="gallery">
  				<figure>
  				<ul>
  				<li>게시판 글이 없습니다.</li>  				
  				</ul>
  				</figure>
  				</article>
  				
  				
  				
  				<%
  			}
  			
  			%>
  			
			<div class="clear"></div>		
			<div id="page">
				<ul class="paging">
				<%
				if(count > 0){
					int pageCount =  count / pageSize + (count % pageSize == 0 ? 0 : 1);
					//페이지 설정
					int pageBlock = 5;
					
					int startPage = ((pageNum - 1)/pageBlock) * pageBlock + 1;
					
					int endPage = startPage + pageBlock - 1;
					if(endPage > pageCount){
						endPage = pageCount;
					}
					
					//이전 출력
					if(startPage > pageBlock){
						%>
						
						<li><a href="community.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a></li>
						<%
					}//이전if
					for(int i=startPage; i<=endPage;i++){
						%>
						<li><a href="community.jsp?pageNum=<%=i%>">
						<%
						if(i==pageNum){
							%>
							<span style="font-weight: bold;">[<%=i %>]</span>
							<%
						}else{
							%>
							<%=i %>
							<%
						}
						%>
						</a></li>
						
						<%
					}//for
				
					//[다음]출력
					if(endPage<pageCount){
						%>
						<li><a href="community.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a></li>
						<%
					}
					
					
				}// count if%>
					
				
<!-- 					<li><a href="#">1</a></li> -->
<!-- 					<li><a href="#">2</a></li> -->
<!-- 					<li><a href="#">3</a></li>	 -->
<!-- 					<li><a href="#">4</a></li> -->
<!-- 					<li><a href="#">5</a></li> -->
<!-- 					<li><a href="#">6</a></li> -->
				</ul>		
			</div>		
							

				
				<div class="btn">
				<input type="button" value="사진업로드" onclick="logincheck();">
				</div>
				
				

		
			
  		</article>


  		<%--aside 영역 --%>
		<jsp:include page ="../include/sidebar_community.jsp"/>
  		

        <div class="clear"></div>
        
		<%--푸터영역--%>
		<jsp:include page="../include/footer.jsp"/>


	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script>
  	function logincheck(){
 	
  		$.ajax({
  			url: '../members/loginCheckJson.jsp',
  			success: function (isLogin) {
  				
  				if(isLogin == false){
  		  			alert('로그인후 이용가능합니다.');
  		  			location.href="../members/loginform.jsp";
  		  		} else {
  		  			location.href="photo_upload.jsp";
  		  		}
  			}
  		});
  		
  	} // logincheck()
  	
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