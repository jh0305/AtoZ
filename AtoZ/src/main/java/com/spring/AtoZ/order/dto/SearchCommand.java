package com.spring.AtoZ.order.dto;

public class SearchCommand {
	
	private int item_no    ;
	private String item_name  ;
	private String cp_code    ;
	private String cp_name    ;
	private String std_name   ;
	
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getCp_code() {
		return cp_code;
	}
	public void setCp_code(String cp_code) {
		this.cp_code = cp_code;
	}
	public String getCp_name() {
		return cp_name;
	}
	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}
	public String getStd_name() {
		return std_name;
	}
	public void setStd_name(String std_name) {
		this.std_name = std_name;
	}
	
	@Override
	public String toString() {
		return "SearchCommand [item_no=" + item_no + ", item_name=" + item_name + ", cp_code=" + cp_code + ", cp_name="
				+ cp_name + ", std_name=" + std_name + "]";
	}
}
