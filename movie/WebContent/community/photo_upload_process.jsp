<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="com.exam.dao.Attach2Dao"%>
<%@page import="com.exam.vo.Attach2VO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//COS 라이브러리를 이용한 파일업로드
	//MultipartRequest 생성자 호출시에 파일업로드가 완료됨
	
	//필요한 매개값 5개
	//1 request
	
	//2 saveDirectory (업로드할경로)
	String realPath = application.getRealPath("/upload_community");
	System.out.println("realPath : " + realPath);
	
	//3 최대 업로드 파일크기
	int maxSize = 1024 * 1024 * 10; // 10MB
	
	//4 파일이름 한글처리  "utf-8"
	
	//5 파일이름중복 처리
	
	//파일업로드 수행 완료!
	MultipartRequest multi = new MultipartRequest(
	request, realPath, maxSize, "utf-8", 
	new DefaultFileRenamePolicy());
	
	
	
	//================게시판 글 등록 처리 시작 ===================
	// 자바빈 board2VO 객체 생성
	Attach2VO attachVO = new Attach2VO();
	// 파라미터값 찾아서 자바빈에 저장
	attachVO.setSubject(multi.getParameter("subject"));
	
	//글+그림 합체 DAO 임
	//attachDao 객체준비
	Attach2Dao attachDao = Attach2Dao.getInstance();
	
	int num = attachDao.nextBoarnum();
	attachVO.setNum(num);
	
	//==========첨부파일 등록 처리 시작==========================
	String realFileName = multi.getFilesystemName("filename");
	
	if(realFileName != null){
		attachVO.setFilename(realFileName);
		attachVO.setNum(num);
		
	//이미지 파일여부 확인
	File file = new File(realPath, realFileName);
	String contenType = Files.probeContentType(file.toPath());
	boolean isImage = contenType.startsWith("image");
	if(isImage){
		attachVO.setFiletype("I");
	}else{
		attachVO.setFiletype("O");
	}
	
	}
	
	//게시글 한개 등록하는 메소드 호출
	attachDao.insertAttach(attachVO);
	
	//==========첨부파일 등록처리 종료 ============================
	response.sendRedirect("community.jsp");		
	
// 	//파라미터 값 가져오기
// 	String title = multi.getParameter("title");
%>



	