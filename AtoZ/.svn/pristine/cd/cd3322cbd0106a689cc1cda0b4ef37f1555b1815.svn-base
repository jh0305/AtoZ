package com.spring.AtoZ.notice.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.AtoZ.vo.NoticeVO;

public class NoticeRegist {
	private int ntc_no;
	private String title;
	private String content;
	private String admin_id;
	private String upd_id;
	private List<MultipartFile> uploadFile;
	
	public int getNtc_no() {
		return ntc_no;
	}
	public void setNtc_no(int ntc_no) {
		this.ntc_no = ntc_no;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public String getUpd_id() {
		return upd_id;
	}
	public void setUpd_id(String upd_id) {
		this.upd_id = upd_id;
	}
	@Override
	public String toString() {
		return "NoticeRegist [ntc_no=" + ntc_no + ", title=" + title + ", content=" + content + ", admin_id=" + admin_id
				+ ", uploadFile=" + uploadFile + "]";
	}
	public NoticeVO toNoticeVO() {
		NoticeVO notice = new NoticeVO();
		notice.setNtc_no(this.ntc_no);
		notice.setAdmin_id(this.admin_id);
		notice.setUpd_id(this.upd_id);
		notice.setTitle(this.title);
		notice.setContent(this.content);
		
		return notice;
	}
	
	
	
}
