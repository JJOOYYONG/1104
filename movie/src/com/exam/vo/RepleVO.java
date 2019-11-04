package com.exam.vo;

public class RepleVO {
	

	private int num;
	private String id;
	private String content;
	private int bno;
	
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RepleVO [num=");
		builder.append(num);
		builder.append(", id=");
		builder.append(id);
		builder.append(", content=");
		builder.append(content);
		builder.append(", bno=");
		builder.append(bno);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}//reple
