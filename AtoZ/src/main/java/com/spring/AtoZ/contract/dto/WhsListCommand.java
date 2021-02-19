package com.spring.AtoZ.contract.dto;

import java.util.List;

public class WhsListCommand {

	private String cl_code;
	private String cl_name;
	private String wh_addr;
	private String cl_ceo;
	private String cl_tel;
	private String cl_email;
	private String cl_regno;
	private int rownum;	
	private int tot_area;
	private List<String> cm_name; // 취급유형명	
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getCl_code() {
		return cl_code;
	}
	public void setCl_code(String cl_code) {
		this.cl_code = cl_code;
	}
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public String getWh_addr() {
		return wh_addr;
	}
	public void setWh_addr(String cl_addr) {
		this.wh_addr = cl_addr;
	}
	public String getCl_ceo() {
		return cl_ceo;
	}
	public void setCl_ceo(String cl_ceo) {
		this.cl_ceo = cl_ceo;
	}
	public String getCl_tel() {
		return cl_tel;
	}
	public void setCl_tel(String cl_tel) {
		this.cl_tel = cl_tel;
	}
	public String getCl_email() {
		return cl_email;
	}
	public void setCl_email(String cl_email) {
		this.cl_email = cl_email;
	}
	public int getTot_area() {
		return tot_area;
	}
	public void setTot_area(int tot_area) {
		this.tot_area = tot_area;
	}
	public String getCl_regno() {
		return cl_regno;
	}
	public void setCl_regno(String cl_regno) {
		this.cl_regno = cl_regno;
	}
	public List<String> getCm_name() {
		return cm_name;
	}
	public void setCm_name(List<String> cm_name) {
		this.cm_name = cm_name;
	}
	

}
