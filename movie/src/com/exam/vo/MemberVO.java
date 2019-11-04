package com.exam.vo;

import java.sql.Timestamp;

public class MemberVO {
	
	//value Object(VO) = 자바빈(java been)클래스
	
	private String id;
	private String passwd;
	private String names;
	private Timestamp reg_date;
	private String address;
	private String tel;
	
	
	
	public String getId() {
		return id;
	}
	
	
	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getPasswd() {
		return passwd;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getNames() {
		return names;
	}
	
	public void setNames(String names) {
		this.names = names;
	}
	
	public Timestamp getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberVO [id=").append(id).append(", passwd=").append(passwd).append(", names=").append(names)
				.append(", reg_date=").append(reg_date).append(", address=").append(address).append(", tel=")
				.append(tel).append("]");
		return builder.toString();
	}
	

	
	
}//memberVO
