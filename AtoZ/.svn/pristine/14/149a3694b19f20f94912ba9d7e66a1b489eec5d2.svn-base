package com.spring.AtoZ.notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.vo.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	
	//공지사항 시퀀스 번호
	@Override
	public int noticeSeq() throws SQLException {
		int notice_seq=sqlSession.selectOne("Notice-Mapper.selectNoticeGetSeqValue");
		return notice_seq;
	}
	// 공지사항 리스트
	@Override
	public List<NoticeVO> selectSearchNoticeList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> noticelist = sqlSession.selectList("Notice-Mapper.selectSearchTitleList", sm.getSearch(), rowBounds);
		return noticelist;
	}
	
	// 공지사항 상세화면
	@Override
	public NoticeVO selectNoticeBytitle(int ntc_no) throws SQLException {
		NoticeVO notice = sqlSession.selectOne("Notice-Mapper.selectNoticeBytitle", ntc_no);
		return notice;
	}

	@Override
	public int selectNoticeListCount(SearchMap sm) throws SQLException {
		int cnt = 0;
		cnt = sqlSession.selectOne("Notice-Mapper.selectSearchNoticeListCount", sm.getSearch());
		return cnt;
	}
	// 공지사항 등록
	@Override
	public void insertNoitce(NoticeVO notice) throws SQLException {
		sqlSession.update("Notice-Mapper.insertNotice", notice);
	}

	@Override
	public NoticeVO selectNoticeByContent(String file_name) throws SQLException {
		NoticeVO notice = sqlSession.selectOne("Notice-Mapper.selectNoticeByContent", file_name);
		return notice;
	}

	@Override
	public void updateNoitce(NoticeVO notice) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.update("Notice-Mapper.updateNotice", notice);
		
	}

	@Override
	public void deleteNotice(int ntc_no) throws SQLException {
		sqlSession.update("Notice-Mapper.deleteNotice", ntc_no);
		
	}
	
}
