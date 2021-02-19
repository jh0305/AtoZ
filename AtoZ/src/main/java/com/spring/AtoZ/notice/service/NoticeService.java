package com.spring.AtoZ.notice.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.vo.NoticeVO;

public interface NoticeService {
	
	// 공지사항 리스트
	Map<String, Object> getNoticeList(SearchMap sm) throws SQLException;
	
	// 공지사항 상세정보
	NoticeVO getNotice(int ntc_no) throws SQLException;
	
	// 공지사항 등록
	void write(NoticeVO notice) throws Exception;
	
	// 공지사항 수정
	void modify(NoticeVO notice) throws Exception;
	
	// 공지사항 삭제
	void remove(int ntc_no) throws Exception;
	
	// file 찾기
	NoticeVO fildNotice(String file_name) throws SQLException;
}
