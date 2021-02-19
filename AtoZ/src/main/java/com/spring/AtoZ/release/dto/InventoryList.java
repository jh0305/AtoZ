package com.spring.AtoZ.release.dto;

public class InventoryList {
	private int item_no;
	private int qty;
	private String item_name;
	private String std_name;
	private String wh_code;
	private String co_code;
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
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
	public String getWh_code() {
		return wh_code;
	}
	public void setWh_code(String wh_code) {
		this.wh_code = wh_code;
	}
	public String getCo_code() {
		return co_code;
	}
	public void setCo_code(String co_code) {
		this.co_code = co_code;
	}
	
	
	
}
