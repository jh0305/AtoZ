package com.spring.AtoZ.vo;

import java.util.List;

public class NoticeVO {
	private String upd_id;
	private String upd_ymd;
	private String wrt_ymd;
	private String content;
	private String title;
	private String admin_id;
	private int ntc_no;
	private int rn;
	private List<AttchVO> attchList;
	public String getUpd_id() {
		return upd_id;
	}
	public void setUpd_id(String upd_id) {
		this.upd_id = upd_id;
	}
	public String getUpd_ymd() {
		return upd_ymd;
	}
	public void setUpd_ymd(String upd_ymd) {
		this.upd_ymd = upd_ymd;
	}
	public String getWrt_ymd() {
		return wrt_ymd;
	}
	public void setWrt_ymd(String wrt_ymd) {
		this.wrt_ymd = wrt_ymd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public int getNtc_no() {
		return ntc_no;
	}
	public void setNtc_no(int ntc_no) {
		this.ntc_no = ntc_no;
	}
	public List<AttchVO> getAttchList() {
		return attchList;
	}
	public void setAttchList(List<AttchVO> attchList) {
		this.attchList = attchList;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	@Override
	public String toString() {
		return "NoticeVO [upd_id=" + upd_id + ", upd_ymd=" + upd_ymd + ", wrt_ymd=" + wrt_ymd + ", content=" + content
				+ ", title=" + title + ", admin_id=" + admin_id + ", ntc_no=" + ntc_no + ", rn=" + rn + ", attchList="
				+ attchList + ", getUpd_id()=" + getUpd_id() + ", getUpd_ymd()=" + getUpd_ymd() + ", getWrt_ymd()="
				+ getWrt_ymd() + ", getContent()=" + getContent() + ", getTitle()=" + getTitle() + ", getAdmin_id()="
				+ getAdmin_id() + ", getNtc_no()=" + getNtc_no() + ", getAttchList()=" + getAttchList() + ", getRn()="
				+ getRn() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
}
