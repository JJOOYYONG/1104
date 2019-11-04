package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.exam.vo.Attach2VO;

public class Attach2Dao {

	private static Attach2Dao instance = new Attach2Dao();
	
	public static Attach2Dao getInstance() {
		return  instance;
	}
	
	private Attach2Dao() {
		
	}
	
	//데이터 베이스에 insert 할때 레코드 번호 생성 메소드
	public int nextBoarnum(){
		int num = 0;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs= null;
		
		try {
			con=DBManager.getConnection();
			String sql = "select max(num) from attach2";
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
	

	//첨부파일 정보 입력하기 메소드
	
	public void insertAttach(Attach2VO attachVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			con = DBManager.getConnection();
			String sql = "insert into attach2 (uploadpath,filename,filetype,num,subject) ";
			sql += "values(?,?,?,?,?) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, attachVO.getUploadpath());
			pstmt.setString(2, attachVO.getFilename());
			pstmt.setString(3, attachVO.getFiletype());
			pstmt.setInt(4, attachVO.getNum());
			pstmt.setString(5, attachVO.getSubject());

			
			//실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		
		
		
	}//insesrt
	
	//글번호에 해당하는 첨부파일 가져오기
	public List<Attach2VO> getAttaches(int startRow ,int pageSize){
		List<Attach2VO>list = new ArrayList<Attach2VO>();
		
		int endRow = startRow + pageSize -1;
		
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb= new StringBuilder();
		sb.append("SELECT aa.* ");
		sb.append("FROM ");
		sb.append("    (SELECT ROWNUM AS rnum, a.* ");
		sb.append("    FROM ");
		sb.append("        (SELECT * ");
		sb.append("        FROM attach2");
		sb.append("        ORDER BY num DESC) a ");
		sb.append("    WHERE ROWNUM <= ?) aa ");
		sb.append("WHERE rnum >= ? ");
		
		
		
		try {
			con = DBManager.getConnection();
			//String sql = "select * from attach2 ";
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
	
			//실행
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Attach2VO attachVO = new Attach2VO();
				attachVO.setUploadpath(rs.getString("uploadpath"));
				attachVO.setFilename(rs.getString("filename"));
				attachVO.setFiletype(rs.getString("filetype"));
				attachVO.setNum(rs.getInt("num"));
				attachVO.setSubject(rs.getString("subject"));
				
				
				list.add(attachVO);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return list;
	} // getattaches
	
	
	//보드 글 카운트
	public int getlistCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con= DBManager.getConnection();
			String sql = "select count(*) from attach2 ";
			pstmt = con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			count =rs.getInt(1);
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		return count;
	}//getlistCount
	
}//attachDao
