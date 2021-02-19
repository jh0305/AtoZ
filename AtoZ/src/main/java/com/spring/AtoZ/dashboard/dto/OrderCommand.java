package com.spring.AtoZ.dashboard.dto;

public class OrderCommand {
	private String co_code ;
	private String wh_code ;
	private String req_ymd ;
	private String deli_ymd;
	private String ord_mngr;
	private String wh_mngr ;
	private String sts_code;
	private String cl_name ;
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
	public String getSts_code() {
		return sts_code;
	}
	public void setSts_code(String sts_code) {
		this.sts_code = sts_code;
	}
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	@Override
	public String toString() {
		return "OrderCommand [co_code=" + co_code + ", wh_code=" + wh_code + ", req_ymd=" + req_ymd + ", deli_ymd="
				+ deli_ymd + ", ord_mngr=" + ord_mngr + ", wh_mngr=" + wh_mngr + ", sts_code=" + sts_code + ", cl_name="
				+ cl_name + "]";
	}
	
}
