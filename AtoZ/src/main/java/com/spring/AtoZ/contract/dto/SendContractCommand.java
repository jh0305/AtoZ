package com.spring.AtoZ.contract.dto;

import java.util.List;

public class SendContractCommand {

	private List<Integer> wz_no;
	private int pre_priod;
	private String wh_code; 
	private String co_code; 
	
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
	
	public List<Integer> getWz_no() {
		return wz_no;
	}
	public void setWz_no(List<Integer> wz_no) {
		this.wz_no = wz_no;
	}
	public int getPre_priod() {
		return pre_priod;
	}
	public void setPre_priod(int pre_priod) {
		this.pre_priod = pre_priod;
	}
	
}
