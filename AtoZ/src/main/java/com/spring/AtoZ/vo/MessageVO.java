package com.spring.AtoZ.vo;

public class MessageVO {
	private int msg_no;
	private String sd_code;
	private String rc_code;
	private String content;
	private String wrt_ymd;
	private int read_yn;
	private int sd_del_gb;
	private int rc_del_gb;
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public String getSd_code() {
		return sd_code;
	}
	public void setSd_code(String sd_code) {
		this.sd_code = sd_code;
	}
	public String getRc_code() {
		return rc_code;
	}
	public void setRc_code(String rc_code) {
		this.rc_code = rc_code;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrt_ymd() {
		return wrt_ymd;
	}
	public void setWrt_ymd(String wrt_ymd) {
		this.wrt_ymd = wrt_ymd;
	}
	public int getRead_yn() {
		return read_yn;
	}
	public void setRead_yn(int read_yn) {
		this.read_yn = read_yn;
	}
	public int getSd_del_gb() {
		return sd_del_gb;
	}
	public void setSd_del_gb(int sd_del_gb) {
		this.sd_del_gb = sd_del_gb;
	}
	public int getRc_del_gb() {
		return rc_del_gb;
	}
	public void setRc_del_gb(int rc_del_gb) {
		this.rc_del_gb = rc_del_gb;
	}
	@Override
	public String toString() {
		return "MessageVO [msg_no=" + msg_no + ", sd_code=" + sd_code + ", rc_code=" + rc_code + ", content=" + content
				+ ", wrt_ymd=" + wrt_ymd + ", read_yn=" + read_yn + ", sd_del_gb=" + sd_del_gb + ", rc_del_gb="
				+ rc_del_gb + "]";
	}
}
