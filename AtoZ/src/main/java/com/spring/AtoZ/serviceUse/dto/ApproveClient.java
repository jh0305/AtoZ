package com.spring.AtoZ.serviceUse.dto;

import com.spring.AtoZ.vo.ClientVO;

public class ApproveClient {
	private String cl_code;
	private String id;
	private String sts_code;
	private int act_yn;
	
	public String getCl_code() {
		return cl_code;
	}
	public void setCl_code(String cl_code) {
		this.cl_code = cl_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSts_code() {
		return sts_code;
	}
	public void setSts_code(String sts_code) {
		this.sts_code = sts_code;
	}
	public int getAct_yn() {
		return act_yn;
	}
	public void setAct_yn(int act_yn) {
		this.act_yn = act_yn;
	}
	
public ClientVO toAPClient() {
		
		ClientVO client = new ClientVO();
		client.setCl_code(cl_code);
		client.setId(id);
		client.setAct_yn(act_yn);
		client.setSts_code(sts_code);
		return client;
	}
}
