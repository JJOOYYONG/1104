package com.exam.dao;

import java.sql.*;

public class DBManager {

	public static Connection getConnection() throws Exception{
		
		Connection con = null;
		
		//DB접속정보
		String url ="jdbc:oracle:thin:@localhost:1521:orcl";
		String user="scott";
		String password="tiger";
		
		//1단계 : DB 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
		//2단계 : DB 연결
		con = DriverManager.getConnection(url,user,password);
		
		
		return con;
	}
	
	//select문을 수행한 후 리소스 해제를 위한 메소드
	public static void close(Connection con,Statement stmt,ResultSet rs ) {
		if(rs != null) {
			
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if
		
		if(stmt != null) {
			try {
				stmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}//if
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}// close
	
	//INSERT, UPDATE, DELET문을 수행한 후 리소스 해제를 위한 메소드
	
	public static void close(Connection con, Statement stmt) {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}//close
	
	
	
	
	
}//DBManager
