package com.exam.vo;

public class Board2VO {

	
	

	private int num;
	private  String username;
	private  String passwd;
	private  String subject;
	private  String content;
	private  String ip;
	private  int re_Ref;
	private  int re_Lev;
	private  int re_seq;
	private  String uploadpath;
	private  String filename;
	private  String filetype;
	private  String type;
	private  String actor;
	private  String director;
	private  String year;
	private int readcount;
	

	/**
	 * @return the num
	 */
	public int getNum() {
		return num;
	}
	/**
	 * @param num the num to set
	 */
	public void setNum(int num) {
		this.num = num;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the passwd
	 */
	public String getPasswd() {
		return passwd;
	}
	/**
	 * @param passwd the passwd to set
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}
	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the ip
	 */
	public String getIp() {
		return ip;
	}
	/**
	 * @param ip the ip to set
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}
	/**
	 * @return the re_Ref
	 */
	public int getRe_Ref() {
		return re_Ref;
	}
	/**
	 * @param re_Ref the re_Ref to set
	 */
	public void setRe_Ref(int re_Ref) {
		this.re_Ref = re_Ref;
	}
	/**
	 * @return the re_Lev
	 */
	public int getRe_Lev() {
		return re_Lev;
	}
	/**
	 * @param re_Lev the re_Lev to set
	 */
	public void setRe_Lev(int re_Lev) {
		this.re_Lev = re_Lev;
	}
	/**
	 * @return the re_seq
	 */
	public int getRe_seq() {
		return re_seq;
	}
	/**
	 * @param re_seq the re_seq to set
	 */
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	/**
	 * @return the uploadpath
	 */
	public String getUploadpath() {
		return uploadpath;
	}
	/**
	 * @param uploadpath the uploadpath to set
	 */
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}
	/**
	 * @return the filename
	 */
	public String getFilename() {
		return filename;
	}
	/**
	 * @param filename the filename to set
	 */
	public void setFilename(String filename) {
		this.filename = filename;
	}
	/**
	 * @return the filetype
	 */
	public String getFiletype() {
		return filetype;
	}
	/**
	 * @param filetype the filetype to set
	 */
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the actor
	 */
	public String getActor() {
		return actor;
	}
	/**
	 * @param actor the actor to set
	 */
	public void setActor(String actor) {
		this.actor = actor;
	}
	/**
	 * @return the director
	 */
	public String getDirector() {
		return director;
	}
	/**
	 * @param director the director to set
	 */
	public void setDirector(String director) {
		this.director = director;
	}
	/**
	 * @return the year
	 */
	public String getYear() {
		return year;
	}
	/**
	 * @param year the year to set
	 */
	public void setYear(String year) {
		this.year = year;
	}
	/**
	 * @return the readcount
	 */
	public int getReadcount() {
		return readcount;
	}
	/**
	 * @param readcount the readcount to set
	 */
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Board2VO [num=").append(num).append(", username=").append(username).append(", passwd=")
				.append(passwd).append(", subject=").append(subject).append(", content=").append(content)
				.append(", ip=").append(ip).append(", re_Ref=").append(re_Ref).append(", re_Lev=").append(re_Lev)
				.append(", re_seq=").append(re_seq).append(", uploadpath=").append(uploadpath).append(", filename=")
				.append(filename).append(", filetype=").append(filetype).append(", type=").append(type)
				.append(", actor=").append(actor).append(", director=").append(director).append(", year=").append(year)
				.append(", readcount=").append(readcount).append("]");
		return builder.toString();
	}
	
	

	
	
} //board2VO
