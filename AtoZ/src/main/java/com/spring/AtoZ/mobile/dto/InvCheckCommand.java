package com.spring.AtoZ.mobile.dto;

public class InvCheckCommand {
	private int chk_no   ;
	private int chk_qty  ;
	private int cur_qty  ;
	private String chk_ymd  ;
	private String rsn_code ;
	private String reg_name ;
	private String reg_ymd  ;
	private String upd_name ;
	private String upd_ymd  ;
	private int inv_no   ;
	private String bfr_loc  ;
	private String item_name;
	private String std_name ;
	public int getChk_no() {
		return chk_no;
	}
	public void setChk_no(int chk_no) {
		this.chk_no = chk_no;
	}
	public void setChk_no(String chk_no) {
		this.chk_no = Integer.parseInt(chk_no);
	}
	public int getChk_qty() {
		return chk_qty;
	}
	public void setChk_qty(int chk_qty) {
		this.chk_qty = chk_qty;
	}
	public void setChk_qty(String chk_qty) {
		this.chk_qty = Integer.parseInt(chk_qty);
	}
	public int getCur_qty() {
		return cur_qty;
	}
	public void setCur_qty(int cur_qty) {
		this.cur_qty = cur_qty;
	}
	public void setCur_qty(String cur_qty) {
		this.cur_qty = Integer.parseInt(cur_qty);
	}
	public String getChk_ymd() {
		return chk_ymd;
	}
	public void setChk_ymd(String chk_ymd) {
		this.chk_ymd = chk_ymd;
	}
	public String getRsn_code() {
		return rsn_code;
	}
	public void setRsn_code(String rsn_code) {
		this.rsn_code = rsn_code;
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
	public int getInv_no() {
		return inv_no;
	}
	public void setInv_no(int inv_no) {
		this.inv_no = inv_no;
	}
	public void setInv_no(String inv_no) {
		this.inv_no = Integer.parseInt(inv_no);
	}
	public String getBfr_loc() {
		return bfr_loc;
	}
	public void setBfr_loc(String bfr_loc) {
		this.bfr_loc = bfr_loc;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getStd_name() {
		return std_name;
	}
	public void setStd_name(String std_name) {
		this.std_name = std_name;
	}
	@Override
	public String toString() {
		return "InvCheckCommand [chk_no=" + chk_no + ", chk_qty=" + chk_qty + ", cur_qty=" + cur_qty + ", chk_ymd="
				+ chk_ymd + ", rsn_code=" + rsn_code + ", reg_name=" + reg_name + ", reg_ymd=" + reg_ymd + ", upd_name="
				+ upd_name + ", upd_ymd=" + upd_ymd + ", inv_no=" + inv_no + ", bfr_loc=" + bfr_loc + ", item_name="
				+ item_name + ", std_name=" + std_name + "]";
	}
	
}
