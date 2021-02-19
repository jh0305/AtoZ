package com.spring.AtoZ.contract.dto;

public class ContractDetailCommand{
	
	private String cl_name;
	private int cc_no;
	private int wz_area; // 구역면적
	private int cr_area; // 총 면적
	private String cm_name; //계약 상태 이름
	private int pre_priod;
	private String reg_date;
	private String cr_ymd;
	private String exp_ymd;
	private String wz_loc; // 구역이름
	private String type_name; // 취급유형 이름	
	private boolean is_Req; //요청건인지 여부 
	private int mnth_chrg;
	private String dm_content; // 적요
	private String cl_code; // 마지막으로 등록,요청한 주체
	private int dm_no;
	private String wh_addr;
	private String cc_dsc;	
	private String co_code; 
		
	public String getCo_code() {
		return co_code;
	}
	public void setCo_code(String co_code) {
		this.co_code = co_code;
	}
	public String getCc_dsc() {
		return cc_dsc;
	}
	public void setCc_dsc(String cc_dsc) {
		this.cc_dsc = cc_dsc;
	}
	public String getWh_addr() {
		return wh_addr;
	}
	public void setWh_addr(String wh_addr) {
		this.wh_addr = wh_addr;
	}
	public int getDm_no() {
		return dm_no;
	}
	public void setDm_no(int dm_no) {
		this.dm_no = dm_no;
	}
	public String getCl_code() {
		return cl_code;
	}
	public void setCl_code(String cl_code) {
		this.cl_code = cl_code;
	}
	public String getDm_content() {
		return dm_content;
	}
	public void setDm_content(String dm_content) {
		this.dm_content = dm_content;
	}
	public int getMnth_chrg() {
		return mnth_chrg;
	}
	public void setMnth_chrg(int mnth_chrg) {
		this.mnth_chrg = mnth_chrg;
	}	
	public boolean isIs_Req() {
		return is_Req;
	}
	public void setIs_Req(boolean is_Req) {
		this.is_Req = is_Req;
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
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public int getCc_no() {
		return cc_no;
	}
	public void setCc_no(int cc_no) {
		this.cc_no = cc_no;
	}
	public int getWz_area() {
		return wz_area;
	}
	public void setWz_area(int wz_area) {
		this.wz_area = wz_area;
	}
	public int getCr_area() {
		return cr_area;
	}
	public void setCr_area(int cr_area) {
		this.cr_area = cr_area;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
	public int getPre_priod() {
		return pre_priod;
	}
	public void setPre_priod(int pre_priod) {
		this.pre_priod = pre_priod;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getWz_loc() {
		return wz_loc;
	}
	public void setWz_loc(String wz_loc) {
		this.wz_loc = wz_loc;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	
	
	
}