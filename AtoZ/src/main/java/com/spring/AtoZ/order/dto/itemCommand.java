package com.spring.AtoZ.order.dto;

public class itemCommand {
	private String item_no   ;
	private String qty       ;
	public String getItem_no() {
		return item_no;
	}
	public void setItem_no(String item_no) {
		this.item_no = item_no;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	@Override
	public String toString() {
		return "itemCommand [item_no=" + item_no + ", qty=" + qty + "]";
	}
	
	
}
