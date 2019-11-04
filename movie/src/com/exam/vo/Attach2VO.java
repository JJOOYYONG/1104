package com.exam.vo;

public class Attach2VO {



	private String uploadpath;
	private String filename;
	private String filetype;
	private int num;
	private String subject;
	

	
	
	
	public String getUploadpath() {
		return uploadpath;
	}
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AttachVO [uploadpath=");
		builder.append(uploadpath);
		builder.append(", filename=");
		builder.append(filename);
		builder.append(", filetype=");
		builder.append(filetype);
		builder.append(", num=");
		builder.append(num);
		builder.append(", subject=");
		builder.append(subject);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
	
	
	
}//attachVO
