package com.spring.AtoZ.message.dto;

public class MessageDetailCommand {
	private int msg_no;
	private String cl_code;
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public String getCl_code() {
		return cl_code;
	}
	public void setCl_code(String cl_code) {
		this.cl_code = cl_code;
	}
	@Override
	public String toString() {
		return "MessageDetailCommand [msg_no=" + msg_no + ", cl_code=" + cl_code + "]";
	}
}
