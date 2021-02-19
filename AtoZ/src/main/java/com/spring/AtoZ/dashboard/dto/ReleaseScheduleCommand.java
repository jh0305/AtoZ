package com.spring.AtoZ.dashboard.dto;

import java.util.Date;

public class ReleaseScheduleCommand {
	private String wh_code;
	private String dst_name;
	private String plan_ymd;
	public String getPlan_ymd() {
		return plan_ymd;
	}
	public void setPlan_ymd(String plan_ymd) {
		this.plan_ymd = plan_ymd;
	}
	private String co_code;
	private String cl_name;
	
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
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
	public String getDst_name() {
		return dst_name;
	}
	public void setDst_name(String dst_name) {
		this.dst_name = dst_name;
	}
	
}
