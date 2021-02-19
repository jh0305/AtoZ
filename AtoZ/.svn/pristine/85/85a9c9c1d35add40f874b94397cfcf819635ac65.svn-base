package com.spring.AtoZ.notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.vo.NoticeVO;

public interface NoticeDAO {
	// 공지사항 시퀀스
	int noticeSeq() throws SQLException;
	
	// 공지사항 카운트
	int selectNoticeListCount(SearchMap sm) throws SQLException;
	
	// 공지사항 리스트
 	List<NoticeVO> selectSearchNoticeList(SearchMap sm) throws SQLException;
	
 	//공지사항 상세화면
	NoticeVO selectNoticeBytitle(int ntc_no) throws SQLException;
	
	// 공지사항 등록
	void insertNoitce(NoticeVO notice) throws SQLException;
	
	// 공지사항 수정
	void updateNoitce(NoticeVO notice) throws SQLException;
	
	// 공지사항 삭제
	void deleteNotice(int ntc_no) throws SQLException;
	
	// 파일 찾기
	NoticeVO selectNoticeByContent(String file_name) throws SQLException;
}
