package com.spring.AtoZ.notice.dto;

import com.spring.AtoZ.vo.NoticeVO;

public class NoticeModifyRequest extends NoticeRegist {
	private int ntc_no;
	private int[] deleteFile;
	public int getNtc_no() {
		return ntc_no;
	}
	
	public void setNtc_no(int ntc_no) {
		this.ntc_no = ntc_no;
	}
	public int[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}

	@Override
	public NoticeVO toNoticeVO() {
		NoticeVO notice = super.toNoticeVO();
		notice.setNtc_no(ntc_no);
		return notice;
	}
	
}
