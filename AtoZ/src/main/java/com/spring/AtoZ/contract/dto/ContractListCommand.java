package com.spring.AtoZ.contract.dto;


public class ContractListCommand {
	
	private String cl_code; //기업이면 물류센터코드, 물류센터면 기업코드
	private String cl_name;
	private String cr_ymd;
	private String exp_ymd;
	private int cr_area;
	private String reg_date; // 계약 요청일
	private String req_date;
	private int rownum;
	private String cm_name;
	private int cc_no;	
	
	public String getReq_date() {
		return req_date;
	}
	public void setReq_date(String req_date) {
		this.req_date = req_date;
	}
	public int getCc_no() {
		return cc_no;
	}
	public void setCc_no(int cc_no) {
		this.cc_no = cc_no;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
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
	public String getCr_ymd() {
		return cr_ymd;
	}
	public void setCr_ymd(String cr_ymd) {
		this.cr_ymd = cr_ymd;
	}
	public String getExp_ymd() {
		return exp_ymd;
	}
	public void setExp_ymd(String exp_ymd) {
		this.exp_ymd = exp_ymd;
	}
	public int getCr_area() {
		return cr_area;
	}
	public void setCr_area(int cr_area) {
		this.cr_area = cr_area;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
}
