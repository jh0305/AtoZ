package com.spring.AtoZ.receive.dto;

public class ReceiveCommand {
	private int ord_no  ;
	private String co_name ; // 기업 이름
	private String co_code ; // 기업 이름
	private String wh_name ; // 센터 이름
	private String wh_code ; // 센터 이름
	private String item_name;
	private int pay_no  ; 
	private String req_ymd ;
	private String deli_ymd;
	private String ord_dsc ;
	private String ord_mngr;
	private String wh_mngr ;
	private String emp_name;
	private String in_ymd  ;
	private String sts_code;
	private int in_chrg ;
	private String upd_name;
	private String upd_ymd ;
	private int qty;
	private int in_qty;
	private int cnt;
	private int item_no;
	
	
	
	public int getIn_qty() {
		return in_qty;
	}
	public void setIn_qty(int in_qty) {
		this.in_qty = in_qty;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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
	public String getWh_code() {
		return wh_code;
	}
	public void setWh_code(String wh_code) {
		this.wh_code = wh_code;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getReq_ymd() {
		return req_ymd;
	}
	public void setReq_ymd(String req_ymd) {
		this.req_ymd = req_ymd;
	}
	public String getDeli_ymd() {
		return deli_ymd;
	}
	public void setDeli_ymd(String deli_ymd) {
		this.deli_ymd = deli_ymd;
	}
	public String getOrd_dsc() {
		return ord_dsc;
	}
	public void setOrd_dsc(String ord_dsc) {
		this.ord_dsc = ord_dsc;
	}
	public String getOrd_mngr() {
		return ord_mngr;
	}
	public void setOrd_mngr(String ord_mngr) {
		this.ord_mngr = ord_mngr;
	}
	public String getWh_mngr() {
		return wh_mngr;
	}
	public void setWh_mngr(String wh_mngr) {
		this.wh_mngr = wh_mngr;
	}
	public String getIn_ymd() {
		return in_ymd;
	}
	public void setIn_ymd(String in_ymd) {
		this.in_ymd = in_ymd;
	}
	public String getSts_code() {
		return sts_code;
	}
	public void setSts_code(String sts_code) {
		this.sts_code = sts_code;
	}
	public int getIn_chrg() {
		return in_chrg;
	}
	public void setIn_chrg(int in_chrg) {
		this.in_chrg = in_chrg;
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
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}
	

}
