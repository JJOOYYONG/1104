<%@page import="java.util.List"%>
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

<%
	//파라미터값 search page num가져오기
	String search = request.getParameter("search"); // 검색어
	if (search == null) {
		search = "";
	}
	
	String strPageNum = request.getParameter("pageNum");
	if (strPageNum == null) {
		strPageNum = "1";
	}
	// 페이지 번호
	int pageNum = Integer.parseInt(strPageNum);
	
	// DAO 객체 준비
	BoardDao boardDao = BoardDao.getInstance();
	
	// 한페이지(화면)에 보여줄 글 개수
	int pageSize = 10;
	
	// 시작행번호 구하기
	int startRow = (pageNum - 1) * pageSize + 1;
	
	// board테이블 전체글개수 가져오기 메소드 호출
	int count = boardDao.getBoardCount(search);
	
	// 글목록 가져오기 메소드 호출
	List<BoardVO> boardList = boardDao.getBoards(startRow, pageSize, search);
	
	// 날짜 포맷 준비 SimpleDateFormat
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");


%>




<body>
	<div id="wrap">
		
		
		<jsp:include page ="../include/header.jsp"/>
   
  		<h1 id="customer"><div>recommend Content</div></h1>
  		<article>
  			<h2>자유게시판</h2>
      <table id="cbbs">
      	<tr>
      		<th scope="col" class="tno">글번호</th>
      		
      		<th scope="col" class="title" >제목</th>
      		
      		<th scope="col" class="twrite">게시자</th>
      		
      		<th scope="col" class="tdate">게시일</th>
      		
      		<th scope="col" class="tread">조회수</th>
      		
      	</tr>
      	<%
  if (count > 0) {
	  for (BoardVO boardVO : boardList) {
		  %>
		  <tr onclick="location.href='content.jsp?num=<%=boardVO.getNum() %>&pageNum=<%=pageNum %>';">
		  	<td><%=boardVO.getNum() %></td>
		  	<td class="left">
		  		<%
		  		if (boardVO.getRe_Lev() > 0) { // 답글
		  			int level = boardVO.getRe_Lev() * 10;
		  			%>
		  			<img src="../images/center/level.gif" width="<%=level %>" height="13">
		  			<img src="../images/center/icon_re.gif">
		  			<%
		  		}
		  		%>
		  		<%=boardVO.getSubject() %>
		  	</td>
		  	<td><%=boardVO.getUsername() %></td>
		  	<td><%=sdf.format(boardVO.getRegDate()) %></td>
		  	<td><%=boardVO.getReadcount() %></td>
		  </tr>
		  <%
	  }
  } else { // count == 0
	  %>
	  <tr>
	  	<td colspan="5">게시판 글이 없습니다.</td>
	  </tr>
	  <%
  }
  %>   
        </table>
        
        
        	
        <div id="page">
        <ul class="paging">
        <%
	if (count > 0) {
	// 총 페이지 개수 구하기
	//  전체 글개수 / 한페이지당 글개수 (+ 1 : 나머지 있을때)
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	
	// 페이지블록 수 설정
	int pageBlock = 5;
	int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
	
	// 끝페이지번호 endPage 구하기
	int endPage = startPage + pageBlock - 1;
	if (endPage > pageCount) {
		endPage = pageCount;
	}
	
	// [이전] 출력
	if (startPage > pageBlock) {
		%>
		<a href="customer.jsp?pageNum=<%=startPage-pageBlock %>&search=<%=search %>">[이전]</a>
		<%
	}
	
	// 페이지블록 페이지5개 출력
	for (int i=startPage; i<=endPage; i++) {
		%>
		<a href="customer.jsp?pageNum=<%=i %>&search=<%=search %>">
		<%
		if (i == pageNum) {
			%><span style="font-weight: bold;">[<%=i %>]</span><%
		} else {
			%><%=i %><%
		}
		%>
		</a>
		<%
	} // for
	
	// [다음] 출력
	if (endPage < pageCount) {
		%>
		<a href="customer.jsp?pageNum=<%=startPage+pageBlock %>&search=<%=search %>">[다음]</a>
		<%
	}
	
} // if
%>
        </ul>		
        </div>		
       
       
       
       
       
       
       
       
       
       
        <div class="clear"></div>
        <form action="customer.jsp" metod="get" id="searchbbs">
<%--         	<input type="text" name="search" value="<%=search%>" class="input_box"> --%>
<!--         	<input type="submit" value="제목검색" class="btn"> -->
        	
        </form>

       
        <div class="btn"><a href="../customer/write.jsp">글쓰기</a></div>
        
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