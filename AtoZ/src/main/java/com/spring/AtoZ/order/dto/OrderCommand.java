package com.spring.AtoZ.order.dto;

import java.util.Arrays;
import java.util.List;

import com.spring.AtoZ.vo.OrderItemVO;

public class OrderCommand {

	private int ord_no;
	private String co_code;
	private String wh_code;
	private int pay_no;
	private String req_ymd;
	private String deli_ymd;
	private String ord_dsc;
	private String ord_mngr;
	private String wh_mngr;
	private String in_ymd;
	private String sts_code;
	private int in_chrg;
	private String upd_name;
	private String upd_ymd;
	private OrderItemVO[] itemArray;

	public int getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
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

	public OrderItemVO[] getItemArray() {
		return itemArray;
	}

	public void setItemArray(OrderItemVO[] itemArray) {
		this.itemArray = itemArray;
	}

	@Override
	public String toString() {
		return "OrderCommand [ord_no=" + ord_no + ", co_code=" + co_code + ", wh_code=" + wh_code + ", pay_no=" + pay_no
				+ ", req_ymd=" + req_ymd + ", deli_ymd=" + deli_ymd + ", ord_dsc=" + ord_dsc + ", ord_mngr=" + ord_mngr
				+ ", wh_mngr=" + wh_mngr + ", in_ymd=" + in_ymd + ", sts_code=" + sts_code + ", in_chrg=" + in_chrg
				+ ", upd_name=" + upd_name + ", upd_ymd=" + upd_ymd + ", itemArray=" + Arrays.toString(itemArray) + "]";
	}

}
