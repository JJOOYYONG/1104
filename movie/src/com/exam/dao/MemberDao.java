package com.exam.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.exam.vo.MemberVO;

public class MemberDao {

	private static final MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {
		
	}
	
	public boolean joinDupCheck2(String id) {
		//중복이면 true 아니면 false
		boolean joinDupCheck2=false;
		
		int count =0; //id값이 일치하는 행의 갯수
		
		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs =null;
		String sql="";
		
		try {
			con=DBManager.getConnection();
			sql="SELECT COUNT(*) AS cnt FROM alone WHERE id =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
			if(count==1) {
				joinDupCheck2 = true;// 중복이다.
			}else {
				joinDupCheck2=false; //중복이 아니다.
			}
			

			} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
		
		
		return joinDupCheck2;
		
	}//아이디 중복 체크
	
	public int insertMember(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount=0;
		
		try {
			con = DBManager.getConnection();
			String sql ="INSERT INTO alone (id,passwd,names,reg_date,address,tel)";
			sql+="values(?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getNames());
			pstmt.setTimestamp(4, vo.getReg_date());
			pstmt.setString(5, vo.getAddress());
			pstmt.setString(6, vo.getTel());
			
			//실행
			
			rowCount = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt);
		}
		
		
		return rowCount;
	} //insertMember
	
	
	//로그인정보 가져오기
	public MemberVO getMember(String id) {
		
		MemberVO memberVO =null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql="";
		
		try {
			con = DBManager.getConnection();
			sql="SELECT * FROM alone WHERE id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			//실행
			rs=pstmt.executeQuery();
			//사용
			if(rs.next()) {
				memberVO = new MemberVO();
				
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setNames(rs.getString("names"));
				memberVO.setReg_date(rs.getTimestamp("reg_date"));
				memberVO.setAddress(rs.getString("address"));			
				memberVO.setTel(rs.getString("tel"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBManager.close(con, pstmt, rs);
		}
		
		return memberVO;
	}//getMember
	
	//로그인)유저확인
	public int userCheck(String id, String passwd) {
		int check =-1; //-1 아이디 불일치 , 0 패스워드 불일치, 1 일치함
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=DBManager.getConnection();
			
			
			String sql ="SELECT passwd FROM alone where id=?";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, id);
			// sql문 실행
			rs = pstmt.executeQuery();
			//사용
			if(rs.next()) {
				if(passwd.equals(rs.getString("passwd"))) {
					check= 1; // 아이디,패스워드 일치
				}else {
					check= 0; //패스워드 불일치
				}
			}else {//아이디 없음
				check=-1;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}//try캐치문
		
		
		return check;
		
	}//usercheck
	
	
	
	//수정문
	public void updateMember(MemberVO memberVO) throws SQLException{
		
		Connection con = null;
		PreparedStatement pstmt = null;

		
		
		try {
			StringBuffer sb = new StringBuffer();
			sb.append("update alone set");
			sb.append(" passwd=?,names=?,address=?,tel=?");
			sb.append(" WHERE ID=?");
			
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, memberVO.getPasswd());
			pstmt.setString(2, memberVO.getNames());
			pstmt.setString(3, memberVO.getAddress());
			pstmt.setString(4, memberVO.getTel());
			pstmt.setString(5, memberVO.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt);
		}
		
		
	}//upadate
	
	
	//데이터 삭제문
	public boolean deleteMember(String id, String passwd) throws SQLException{
		
		boolean result=false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		ResultSet rs =null;
		try {
			
			//로그인한 아이디의 패스워드 불러오기
			sql ="select passwd from alone where id =?";
			
			con=DBManager.getConnection();
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			//실행문장
			rs=pstmt.executeQuery();
			
			if(rs.next()) { //아이디가 있고 그 아이디의 비번이 일치하면 삭제실행
				if(passwd.equals(rs.getString("passwd"))) {
					pstmt.close();
					//삭제문 실행
					sql ="delete from alone where id =?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					
					pstmt.executeUpdate();
					
					result= true;
				}
				
			}//if
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			DBManager.close(con, pstmt,rs);
		}
		return result;

		
	}//삭제문
	
	//회원전체 리스트 가져오기
	public List<MemberVO>getMembers(){
		
		List<MemberVO>list = new ArrayList<MemberVO>();
		

		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql="";
		
		try {
			
			con=DBManager.getConnection();
			
			sql="select * from alone order by id asc";
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberVO memberVO = new MemberVO();
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setNames(rs.getString("names"));
				memberVO.setReg_date(rs.getTimestamp("reg_date"));
				memberVO.setAddress(rs.getString("address"));
				memberVO.setTel(rs.getString("tel"));
				
				list.add(memberVO);
				
			}//while
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, stmt, rs);
		}
			
		return list;
	}//전체리스트
	
	
	
	
	
	
	
	
	
	
	
	
}//memberdao
