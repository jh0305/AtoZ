package com.spring.AtoZ.notice.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.attch.dao.AttchDAO;
import com.spring.AtoZ.common.dto.PageMaker;
import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.notice.dao.NoticeDAO;
import com.spring.AtoZ.vo.AttchVO;
import com.spring.AtoZ.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService{
	private NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	private AttchDAO attchDAO;
	public void setAttchDAO(AttchDAO attchDAO) {
		this.attchDAO = attchDAO;
	}
	
	@Override
	public Map<String, Object> getNoticeList(SearchMap sm) throws SQLException {
		List<NoticeVO> noticelist = noticeDAO.selectSearchNoticeList(sm);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(sm);
		pageMaker.setTotalCount(noticeDAO.selectNoticeListCount(sm));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("noticelist", noticelist);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	@Override
	public NoticeVO getNotice(int ntc_no) throws SQLException {
		NoticeVO notice = noticeDAO.selectNoticeBytitle(ntc_no);
		List<AttchVO> attchList=attchDAO.selectAttchByNtc_no(ntc_no);
		notice.setAttchList(attchList);
		return notice;
	}
	
	@Override
	public void write(NoticeVO notice) throws Exception {
		int ntc_no = noticeDAO.noticeSeq();
		notice.setNtc_no(ntc_no);
		noticeDAO.insertNoitce(notice);
		
		for(AttchVO attch:notice.getAttchList()) {
			attch.setNtc_no(ntc_no);
			attch.setAttcher(notice.getAdmin_id());
			attchDAO.insertAttch(attch);
		}
		
	}
	@Override
	public NoticeVO fildNotice(String file_name) throws SQLException {
		NoticeVO notice = noticeDAO.selectNoticeByContent(file_name);
		return notice;
	}

	@Override
	public void modify(NoticeVO notice) throws Exception {
		noticeDAO.updateNoitce(notice);
		for(AttchVO attch:notice.getAttchList()) {
			attch.setNtc_no(notice.getNtc_no());
			attch.setAttcher(notice.getUpd_id());
			attchDAO.insertAttch(attch);
		}
		
	}

	@Override
	public void remove(int ntc_no) throws Exception {
		noticeDAO.deleteNotice(ntc_no);
		
	}
	
}
