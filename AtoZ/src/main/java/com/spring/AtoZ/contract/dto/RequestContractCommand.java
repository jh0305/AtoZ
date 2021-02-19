package com.spring.AtoZ.contract.dto;

public class RequestContractCommand {
	private int cc_no;
	private String reg_date;
	private String cm_code;
	private String cm_name;
	private String co_code;
	private String cl_name;
	private int cr_area;
	private int pre_priod;
	private int rownum; 
	
	public String getCo_code() {
		return co_code;
	}
	public void setCo_code(String co_code) {
		this.co_code = co_code;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getCc_no() {
		return cc_no;
	}
	public void setCc_no(int cc_no) {
		this.cc_no = cc_no;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getCm_code() {
		return cm_code;
	}
	public void setCm_code(String cm_code) {
		this.cm_code = cm_code;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public int getCr_area() {
		return cr_area;
	}
	public void setCr_area(int cr_area) {
		this.cr_area = cr_area;
	}
	public int getPre_priod() {
		return pre_priod;
	}
	public void setPre_priod(int pre_priod) {
		this.pre_priod = pre_priod;
	}
	
	
}
