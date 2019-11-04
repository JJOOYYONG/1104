package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.exam.vo.Board2VO;

public class Board2Dao {
	
	private static Board2Dao instance = new Board2Dao();
	public static Board2Dao getInstance() {
		return instance;
	}
	private Board2Dao() {
		
	}
	
	//데이터 베이스에 insert 할때 레코드 변호 생성 메소드
	public int nextBoardNum(){
		int num = 0;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs= null;
		
		try {
			con=DBManager.getConnection();
			String sql = "select max(num) from board2";
			stmt = con.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, stmt, rs);
		}
		return num;
	}//nextBoardNum
	
	
	

	
	
	//게시글 한개 등록하는 메소드
	public void insertBoard(Board2VO board2VO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			
			con = DBManager.getConnection();
			sb.append("insert into board2( num, username, passwd, subject, content, ip, re_ref, re_lev, re_seq, uploadpath, filename, filetype, type, actor ,director, year,readcount)");
			sb.append(" values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setInt(1, board2VO.getNum());
			pstmt.setString(2, board2VO.getUsername());
			pstmt.setString(3, board2VO.getPasswd());
			pstmt.setString(4, board2VO.getSubject());
			pstmt.setString(5, board2VO.getContent());
			pstmt.setString(6, board2VO.getIp());
			pstmt.setInt(7,board2VO.getRe_Ref());
			pstmt.setInt(8, board2VO.getRe_Lev());
			pstmt.setInt(9, board2VO.getRe_seq());
			pstmt.setString(10, board2VO.getUploadpath());
			pstmt.setString(11, board2VO.getFilename());
			pstmt.setString(12, board2VO.getFiletype());
			pstmt.setString(13,board2VO.getType());
			pstmt.setString(14, board2VO.getActor());
			pstmt.setString(15, board2VO.getDirector());
			pstmt.setString(16, board2VO.getYear());
			pstmt.setInt(17, board2VO.getReadcount());

			
			//실행
			pstmt.executeUpdate();
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt);		
		}

	}//insert

	
	
	
	//타입에 해당하는 글 리시트로 가져오기 + 페이징
	public List<Board2VO>getBoards(int startRow, int pageSize,String type){
		List<Board2VO>list = new ArrayList<Board2VO>();
		
		int endRow = startRow + pageSize -1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT aa.* ");
		sb.append("FROM ");
		sb.append("    (SELECT ROWNUM AS rnum, a.* ");
		sb.append("    FROM ");
		sb.append("        (SELECT * ");
		sb.append("        FROM board2");
		sb.append("        WHERE type =?");
		sb.append("        ORDER BY num DESC) a ");
		sb.append("    WHERE ROWNUM <= ?) aa ");
		sb.append("WHERE rnum >= ? ");
		//위에 것은 이미 한페이지당 앉힐 수 있는 페이징 메소드
		// 카운트를 걸더라도 페이지가 3으로 나온다.
		
		try {
			
			con=DBManager.getConnection();
//			String sql = "select * from board2 where type=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, type);
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1,type);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3,startRow);
			//실행
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board2VO board2VO = new Board2VO();
				board2VO.setNum(rs.getInt("num"));
				board2VO.setUsername(rs.getString("username"));
				board2VO.setPasswd(rs.getString("passwd"));
				board2VO.setSubject(rs.getString("subject"));
				board2VO.setContent(rs.getString("content"));
				board2VO.setIp(rs.getString("ip"));
				board2VO.setRe_Ref(rs.getInt("re_ref"));
				board2VO.setRe_Lev(rs.getInt("re_lev"));
				board2VO.setRe_seq(rs.getInt("re_seq"));
				board2VO.setUploadpath(rs.getString("uploadpath"));
				board2VO.setFilename(rs.getString("filename"));
				board2VO.setFiletype(rs.getString("filetype"));
				board2VO.setType(rs.getString("type"));
				board2VO.setActor(rs.getString("actor"));
				board2VO.setDirector(rs.getString("director"));
				board2VO.setYear(rs.getString("year"));
				board2VO.setReadcount(rs.getInt("readcount"));
				
//				String strreadcount= rs.getString("readcount");
//				if(strreadcount==null) {
//					strreadcount="0";
//					board2VO.setReadcount(Integer.parseInt(strreadcount));
//				}else {
//					board2VO.setReadcount(Integer.parseInt(strreadcount));
//				}
				
				
				//리스트에 vo객체 한개 추가
				list.add(board2VO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		return list;

	}//getBoards

	
	
	
	
	// 경로에 있는 이미지를 배열로 가져오는 메소드
	public List<Board2VO>getImages() {
		List<Board2VO>list = new ArrayList<Board2VO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			con=DBManager.getConnection();
			String sql = "";
			sql="select filename from board2";
			pstmt=con.prepareStatement(sql);
			//실행
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board2VO board2VO = new Board2VO();
				board2VO.setFilename(rs.getString("filename"));
				
				list.add(board2VO);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return list;
		
		
		
	}//getImages
	
	
	//
	
	
	
	
	
	//전체글 카운트
	//boardList.size()를 썻더니 한페이지 int page = 3로 설정하니까
	//전체글이 아닌 한 페이지에 들어가는 3개의 게시판만 나옴
	
	
	
	public int getBoardCount(String type){
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		
		try {
			con = DBManager.getConnection();
			String sql ="select count(*) from board2 where type=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, type);
			//실행
			rs=pstmt.executeQuery();
			rs.next(); // 커서 옮겨서 행 존재유무/ true,false 리턴
			
			count = rs.getInt(1);
			} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		return count;
	}//getBoardCount
	
	
	
	
	
	// 해당 번호 글 타입이 뭔지
	public String getType(int num){
		String type = "";
		Connection con = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		
		try {
			con = DBManager.getConnection();
			String sql ="select type from board2 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//실행
			rs=pstmt.executeQuery();
			rs.next(); // 커서 옮겨서 행 존재유무/ true,false 리턴
			
			type = rs.getString(1);
			} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		return type;
	}//getBoardCount
	
	
	
	
	
	
	
	
	
	
	
	
	//번호에 해당하는 글 한개 가져오기(수정/삭제)
	//혹은 게시판 리스트를 클릭하면 리스트 해당 번호에 맞는 게시글 내용
	// 1개를 가져다주는 메소드

	public Board2VO getBoard(int num) {
		
		Board2VO board2VO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=DBManager.getConnection();
			String sql = "select * from board2 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			//실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board2VO = new Board2VO();
				board2VO.setNum(rs.getInt("num"));
				board2VO.setUsername(rs.getString("username"));
				board2VO.setPasswd(rs.getString("passwd"));
				board2VO.setSubject(rs.getString("subject"));
				board2VO.setContent(rs.getString("content"));
				board2VO.setIp(rs.getString("ip"));
				board2VO.setRe_Ref(rs.getInt("re_ref"));
				board2VO.setRe_Lev(rs.getInt("re_lev"));
				board2VO.setRe_seq(rs.getInt("re_seq"));
				board2VO.setUploadpath(rs.getString("uploadpath"));
				board2VO.setFilename(rs.getString("filename"));
				board2VO.setFiletype(rs.getString("filetype"));
				board2VO.setType(rs.getString("type"));
				board2VO.setActor(rs.getString("actor"));
				board2VO.setDirector(rs.getString("director"));
				board2VO.setYear(rs.getString("year"));
				board2VO.setReadcount(rs.getInt("readcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		return board2VO;
		
		
		
	}//getBoard
	
	//특정레코드의 조회수를 1 증가시키는 메소드
	public void updateReadcount(int num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			con= DBManager.getConnection();
			sb.append("update board2 ");
			sb.append("set readcount = readcount +1 ");
			sb.append("where num = ?");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			//실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt);
		}
		
	}//updateReadcount
	

}//Board2Dao
