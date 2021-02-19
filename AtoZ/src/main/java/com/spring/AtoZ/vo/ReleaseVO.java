package com.spring.AtoZ.vo;

public class ReleaseVO {
	private String end_date;
	private String start_date;
	private String emp_id;
	private int pck_loc;
	private String task_code;
	private String rls_date;
	private String plan_ymd;
	private String dst_addr;
	private String dst_code;
	private String co_code;
	private String wh_code;
	private int rls_no;
	private String sts_code;
	
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public int getPck_loc() {
		return pck_loc;
	}
	public void setPck_loc(int pck_loc) {
		this.pck_loc = pck_loc;
	}
	public String getTask_code() {
		return task_code;
	}
	public void setTask_code(String task_code) {
		this.task_code = task_code;
	}
	public String getRls_date() {
		return rls_date;
	}
	public void setRls_date(String rls_date) {
		this.rls_date = rls_date;
	}
	public String getPlan_ymd() {
		return plan_ymd;
	}
	public void setPlan_ymd(String plan_ymd) {
		this.plan_ymd = plan_ymd;
	}
	public String getDst_addr() {
		return dst_addr;
	}
	public void setDst_addr(String dst_addr) {
		this.dst_addr = dst_addr;
	}
	public String getDst_code() {
		return dst_code;
	}
	public void setDst_code(String dst_code) {
		this.dst_code = dst_code;
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
	public int getRls_no() {
		return rls_no;
	}
	public void setRls_no(int rls_no) {
		this.rls_no = rls_no;
	}
	public String getSts_code() {
		return sts_code;
	}
	public void setSts_code(String sts_code) {
		this.sts_code = sts_code;
	}
	
	@Override
	public String toString() {
		return "ReleaseVO [end_date=" + end_date + ", start_date=" + start_date + ", emp_id=" + emp_id + ", pck_loc="
				+ pck_loc + ", task_code=" + task_code + ", rls_date=" + rls_date + ", plan_ymd=" + plan_ymd
				+ ", dst_addr=" + dst_addr + ", dst_code=" + dst_code + ", co_code=" + co_code + ", wh_code=" + wh_code
				+ ", rls_no=" + rls_no + ", sts_code=" + sts_code + "]";
	}
	
	
}
