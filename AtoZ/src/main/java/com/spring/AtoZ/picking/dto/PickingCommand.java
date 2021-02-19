package com.spring.AtoZ.picking.dto;

public class PickingCommand {
	//대리키(pk),출고번호(fk), 재고번호(fk), 갯수, 상태
	private String pik_no;
	private String rls_no;
	private String inv_no;
	private int pik_qty;
	private int qty;
	private String sts_code;
	private String wh_mngr;
	
	private String co_name;
	private String item_name;
	private String std_name;
	private String inv_loc;
	private String inv_name;
	
	
	
	public String getInv_name() {
		return inv_name;
	}
	public void setInv_name(String inv_name) {
		this.inv_name = inv_name;
	}
	public String getInv_loc() {
		return inv_loc;
	}
	public void setInv_loc(String inv_loc) {
		this.inv_loc = inv_loc;
	}
	public String getWh_mngr() {
		return wh_mngr;
	}
	public void setWh_mngr(String wh_mngr) {
		this.wh_mngr = wh_mngr;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
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
	public String getPik_no() {
		return pik_no;
	}
	public void setPik_no(String pik_no) {
		this.pik_no = pik_no;
	}
	public String getRls_no() {
		return rls_no;
	}
	public void setRls_no(String rls_no) {
		this.rls_no = rls_no;
	}
	public void setRls_no(int rls_no) {
		this.rls_no = Integer.toString(rls_no);
	}
	public String getInv_no() {
		return inv_no;
	}
	public void setInv_no(String inv_no) {
		this.inv_no = inv_no;
	}
	public void setInv_no(int inv_no) {
		this.inv_no = Integer.toString(inv_no);
	}
	public int getPik_qty() {
		return pik_qty;
	}
	public void setPik_qty(int pik_qty) {
		this.pik_qty = pik_qty;
	}
	public String getSts_code() {
		return sts_code;
	}
	public void setSts_code(String sts_code) {
		this.sts_code = sts_code;
	}
	
	
}
