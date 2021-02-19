package com.spring.AtoZ.release.dto;

import java.util.Date;

public class CompleteReleaseListCommand {
	private int rls_no;
	private String wh_code;
	private String co_code;
	private String dst_code;
	private String dst_name;
	private String dst_addr;
	private String plan_ymd;
	private String rls_ymd;
	private String task_code;
	private int pck_loc;
	private String emp_id;
	private Date start_date;
	private Date end_date;
	private String sts_code;
	private String emp_name;
	private String wh_name;
	private int all_rls_qty;
	public int getRls_no() {
		return rls_no;
	}
	public void setRls_no(int rls_no) {
		this.rls_no = rls_no;
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
	public String getDst_name() {
		return dst_name;
	}
	public void setDst_name(String dst_name) {
		this.dst_name = dst_name;
	}
	public String getDst_addr() {
		return dst_addr;
	}
	public void setDst_addr(String dst_addr) {
		this.dst_addr = dst_addr;
	}
	public String getPlan_ymd() {
		return plan_ymd;
	}
	public void setPlan_ymd(String plan_ymd) {
		this.plan_ymd = plan_ymd;
	}
	public String getTask_code() {
		return task_code;
	}
	public void setTask_code(String task_code) {
		this.task_code = task_code;
	}
	public int getPck_loc() {
		return pck_loc;
	}
	public void setPck_loc(int pck_loc) {
		this.pck_loc = pck_loc;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}
	public int getAll_rls_qty() {
		return all_rls_qty;
	}
	public void setAll_rls_qty(int all_rls_qty) {
		this.all_rls_qty = all_rls_qty;
	}
	public String getDst_code() {
		return dst_code;
	}
	public void setDst_code(String dst_code) {
		this.dst_code = dst_code;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public String getSts_code() {
		return sts_code;
	}
	public void setSts_code(String sts_code) {
		this.sts_code = sts_code;
	}
	public String getRls_ymd() {
		return rls_ymd;
	}
	public void setRls_ymd(String rls_ymd) {
		this.rls_ymd = rls_ymd;
	}
}
