package com.spring.AtoZ.message.dto;

public class SendMessageCommand {
	private int msg_no;
	private String sd_code;
	private String rc_code;
	private String content;
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
	@Override
	public String toString() {
		return "SendMessageCommand [msg_no=" + msg_no + ", sd_code=" + sd_code + ", rc_code=" + rc_code + ", content="
				+ content + "]";
	}
}
