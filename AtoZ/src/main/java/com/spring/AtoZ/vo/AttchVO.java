package com.spring.AtoZ.vo;

import java.sql.Date;

public class AttchVO {
	private int file_no;
	private int ntc_no;
	private String file_name;
	private String upload_path;
	private String attcher;
	private String file_type;
	private Date regDate;
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public int getNtc_no() {
		return ntc_no;
	}
	public void setNtc_no(int ntc_no) {
		this.ntc_no = ntc_no;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getUpload_path() {
		return upload_path;
	}
	public void setUpload_path(String upload_path) {
		this.upload_path = upload_path;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getAttcher() {
		return attcher;
	}
	public void setAttcher(String attcher) {
		this.attcher = attcher;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "AttchVO [file_no=" + file_no + ", ntc_no=" + ntc_no + ", file_name=" + file_name + ", upload_path="
				+ upload_path + ", attcher=" + attcher + ", file_type=" + file_type + ", regDate=" + regDate + "]";
	}
	
	
}
