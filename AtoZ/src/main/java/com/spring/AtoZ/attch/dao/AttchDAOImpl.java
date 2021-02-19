package com.spring.AtoZ.attch.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.vo.AttchVO;

public class AttchDAOImpl implements AttchDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	@Override
	public List<AttchVO> selectAttchByNtc_no(int ntc_no) throws SQLException {
		List<AttchVO> attchList = sqlSession.selectList("Notice-Mapper.selectAttchByNtc_no", ntc_no);
		
		return attchList;
	}
	@Override
	public AttchVO selectAttchByFile_no(int file_no) throws SQLException {
		AttchVO attch = sqlSession.selectOne("Notice-Mapper.selectAttchByFile_no", file_no);
		return attch;
	}

	@Override
	public void insertAttch(AttchVO attch) throws SQLException {
		sqlSession.update("Notice-Mapper.insertNoticeFile", attch);
		
	}
	@Override
	public void deleteAttach(int file_no) throws SQLException {
		sqlSession.update("Notice-Mapper.deleteAttch", file_no);
		
	}
	@Override
	public void deleteAllAttach(int ntc_no) throws SQLException {
		sqlSession.update("Notice-Mapper.deleteAllAttch", ntc_no);
	}
}
