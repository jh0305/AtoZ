package com.spring.AtoZ.member.dto;

public class UpdateMemberCommand {
	private String id;
	private String cl_name;
	private String cl_ceo;
	private String cl_regno;
	private String cl_email;
	private String cl_tel;
	private String co_addr;
	private String wh_addr;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public String getCl_ceo() {
		return cl_ceo;
	}
	public void setCl_ceo(String cl_ceo) {
		this.cl_ceo = cl_ceo;
	}
	public String getCl_regno() {
		return cl_regno;
	}
	public void setCl_regno(String cl_regno) {
		this.cl_regno = cl_regno;
	}
	public String getCl_email() {
		return cl_email;
	}
	public void setCl_email(String cl_email) {
		this.cl_email = cl_email;
	}
	public String getCl_tel() {
		return cl_tel;
	}
	public void setCl_tel(String cl_tel) {
		this.cl_tel = cl_tel;
	}
	public String getCo_addr() {
		return co_addr;
	}
	public void setCo_addr(String co_addr) {
		this.co_addr = co_addr;
	}
	public String getWh_addr() {
		return wh_addr;
	}
	public void setWh_addr(String wh_addr) {
		this.wh_addr = wh_addr;
	}
	@Override
	public String toString() {
		return "UpdateMemberCommand [id=" + id + ", cl_name=" + cl_name + ", cl_ceo=" + cl_ceo + ", cl_regno="
				+ cl_regno + ", cl_email=" + cl_email + ", cl_tel=" + cl_tel + ", co_addr=" + co_addr + ", wh_addr="
				+ wh_addr + "]";
	}
	
}
