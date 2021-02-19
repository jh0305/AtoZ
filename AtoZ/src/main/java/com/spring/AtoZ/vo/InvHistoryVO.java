package com.spring.AtoZ.vo;

public class InvHistoryVO {
	
	private int ih_no;
	private int inv_no;
	private String reg_ymd;
	private int ih_qty;
	private int cng_qty;
	private String ih_loc;
	private String ih_type;
	private String reg_name;
	
	public int getCng_qty() {
		return cng_qty;
	}
	public void setCng_qty(int cng_qty) {
		this.cng_qty = cng_qty;
	}
	public int getIh_no() {
		return ih_no;
	}
	public void setIh_no(int ih_no) {
		this.ih_no = ih_no;
	}
	public int getInv_no() {
		return inv_no;
	}
	public void setInv_no(int inv_no) {
		this.inv_no = inv_no;
	}
	public String getReg_ymd() {
		return reg_ymd;
	}
	public void setReg_ymd(String reg_ymd) {
		this.reg_ymd = reg_ymd;
	}
	public int getIh_qty() {
		return ih_qty;
	}
	public void setIh_qty(int ih_qty) {
		this.ih_qty = ih_qty;
	}
	public String getIh_loc() {
		return ih_loc;
	}
	public void setIh_loc(String ih_loc) {
		this.ih_loc = ih_loc;
	}
	public String getIh_type() {
		return ih_type;
	}
	public void setIh_type(String ih_type) {
		this.ih_type = ih_type;
	}
	public String getReg_name() {
		return reg_name;
	}
	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}
	
}
