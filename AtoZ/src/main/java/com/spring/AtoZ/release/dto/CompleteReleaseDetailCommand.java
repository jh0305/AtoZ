package com.spring.AtoZ.release.dto;

public class CompleteReleaseDetailCommand {
	private int rls_no;
	private int item_no;
	private String co_code;
	private int plan_qty;
	private int rls_qty;
	private int rls_order;
	private String sts_code;
	private String reg_name;
	private String reg_ymd;
	private String upd_name;
	private String upd_ymd;
	private String item_name;
	private String std_name;
	public String getStd_name() {
		return std_name;
	}
	public void setStd_name(String std_name) {
		this.std_name = std_name;
	}
	public int getRls_no() {
		return rls_no;
	}
	public void setRls_no(int rls_no) {
		this.rls_no = rls_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getCo_code() {
		return co_code;
	}
	public void setCo_code(String co_code) {
		this.co_code = co_code;
	}
	public int getPlan_qty() {
		return plan_qty;
	}
	public void setPlan_qty(int plan_qty) {
		this.plan_qty = plan_qty;
	}
	public int getRls_qty() {
		return rls_qty;
	}
	public void setRls_qty(int rls_qty) {
		this.rls_qty = rls_qty;
	}
	public int getRls_order() {
		return rls_order;
	}
	public void setRls_order(int rls_order) {
		this.rls_order = rls_order;
	}
	public String getSts_code() {
		return sts_code;
	}
	public void setSts_code(String sts_code) {
		this.sts_code = sts_code;
	}
	public String getReg_name() {
		return reg_name;
	}
	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}
	public String getReg_ymd() {
		return reg_ymd;
	}
	public void setReg_ymd(String reg_ymd) {
		this.reg_ymd = reg_ymd;
	}
	public String getUpd_name() {
		return upd_name;
	}
	public void setUpd_name(String upd_name) {
		this.upd_name = upd_name;
	}
	public String getUpd_ymd() {
		return upd_ymd;
	}
	public void setUpd_ymd(String upd_ymd) {
		this.upd_ymd = upd_ymd;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
}
