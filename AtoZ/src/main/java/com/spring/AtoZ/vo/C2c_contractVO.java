package com.spring.AtoZ.vo;

public class C2c_contractVO {
	
	private int cc_no     ;
	private String co_code   ;
	private String wh_code   ;
	private String cr_ymd    ;
	private String exp_ymd   ;
	private int cr_area   ;
	private int mnth_chrg ;
	private String sts_code  ;
	private String cc_dsc    ;
	
	public int getCc_no() {
		return cc_no;
	}
	public void setCc_no(int cc_no) {
		this.cc_no = cc_no;
	}
	public String getCo_code() {
		return co_code;
	}
	public void setCo_code(String co_code) {
		this.co_code = co_code;
	}
	public String getWh_code() {
		return wh_code;
	}
	public void setWh_code(String wh_code) {
		this.wh_code = wh_code;
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
	public int getMnth_chrg() {
		return mnth_chrg;
	}
	public void setMnth_chrg(int mnth_chrg) {
		this.mnth_chrg = mnth_chrg;
	}
	public String getSts_code() {
		return sts_code;
	}
	public void setSts_code(String sts_code) {
		this.sts_code = sts_code;
	}
	public String getCc_dsc() {
		return cc_dsc;
	}
	public void setCc_dsc(String cc_dsc) {
		this.cc_dsc = cc_dsc;
	}
	
	@Override
	public String toString() {
		return "C2c_contractVO [cc_no=" + cc_no + ", co_code=" + co_code + ", wh_code=" + wh_code + ", cr_ymd=" + cr_ymd
				+ ", exp_ymd=" + exp_ymd + ", cr_area=" + cr_area + ", mnth_chrg=" + mnth_chrg + ", sts_code="
				+ sts_code + ", cc_dsc=" + cc_dsc + "]";
	}
	
	
	
	

}
