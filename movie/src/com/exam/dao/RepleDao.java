package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.exam.vo.RepleVO;



public class RepleDao {

	private static RepleDao instance = new RepleDao();
	public static RepleDao getInstance() {
		return instance;
	}
	private RepleDao() {
		
	}
	
	//데이터 베이스에 insert할때0 레코드 번호 생성
	public int nextBoardNum() {
		int num = 0;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con=DBManager.getConnection();
			String sql = "select nvl(max(num), 0)+1 from reple";
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				num=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, stmt,rs);
		}
		return num;
		
	}//insertBoardNum
	
	//게시글 한개 등록하는 메소드
	public void insertReple(RepleVO repleVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			sb.append("insert into reple(num,id,content,bno)");
			sb.append(" values(?,?,?,?)");
			pstmt=con.prepareStatement((sb.toString()));
			pstmt.setInt(1, repleVO.getNum());
			pstmt.setString(2, repleVO.getId());
			pstmt.setString(3, repleVO.getContent());
			pstmt.setInt(4, repleVO.getBno());
			
			//실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt);
		}
		
	}//insertReple
	
	//댓글 리스트로 가져오기
	public List<RepleVO> getReples(int bno){
		List<RepleVO>list = new ArrayList<RepleVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * ");
		sb.append("FROM reple ");
		sb.append("WHERE bno = ? ");
		sb.append("ORDER BY num DESC ");
        
        try {
			con=DBManager.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			//실행
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RepleVO repleVO = new RepleVO();
				repleVO.setNum(rs.getInt("num"));
				repleVO.setId(rs.getString("id"));
				repleVO.setContent(rs.getString("content"));
				repleVO.setBno(rs.getInt("bno"));
				
				//리스트에 vo객체 한개추가
				list.add(repleVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
        return list;
	}//list
	 
	
	
	
	
}//repleDao
