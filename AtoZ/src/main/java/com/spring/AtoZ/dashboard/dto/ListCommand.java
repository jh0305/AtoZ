package com.spring.AtoZ.dashboard.dto;
 
public class ListCommand {
	
	private String cl_name  ;
	private String title    ;
	private String content  ;
	private String wrt_ymd  ;
	private String pay_amt  ;
	
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrt_ymd() {
		return wrt_ymd;
	}
	public void setWrt_ymd(String wrt_ymd) {
		this.wrt_ymd = wrt_ymd;
	}
	public String getPay_amt() {
		return pay_amt;
	}
	public void setPay_amt(String pay_amt) {
		this.pay_amt = pay_amt;
	}
	
	@Override
	public String toString() {
		return "ListCommand [cl_name=" + cl_name + ", title=" + title + ", content=" + content + ", wrt_ymd=" + wrt_ymd
				+ ", pay_amt=" + pay_amt + "]";
	}
	
	
	
}
