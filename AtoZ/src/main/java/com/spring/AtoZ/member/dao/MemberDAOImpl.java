package com.spring.AtoZ.member.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.member.dto.DetailMemberCommand;
import com.spring.AtoZ.member.dto.UpdateMemberCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.WHPictureVO;

public class MemberDAOImpl implements MemberDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<ClientVO> selectSearchClientList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ClientVO> clientlist = sqlSession.selectList("Member-Mapper.selectSearchClientList",sm.getSearch(),rowBounds);
		return clientlist;
	}

	@Override
	public int selectClientListCount(SearchMap sm) throws SQLException {
		int cnt = 0;
		cnt = sqlSession.selectOne("Member-Mapper.selectSearchClientListCount", sm.getSearch());
		return cnt;
	}

	@Override
	public DetailMemberCommand selectClientBycl_code(String cl_code) throws SQLException {
		DetailMemberCommand client = sqlSession.selectOne("Member-Mapper.selectClientBycl_code", cl_code);
		return client;
	}

	@Override
	public void updateCompany(UpdateMemberCommand umc) throws SQLException {
		sqlSession.update("Member-Mapper.updateCompany", umc);
	}

	@Override
	public void updateWarehouse(UpdateMemberCommand umc) throws SQLException {
		sqlSession.update("Member-Mapper.updateWarehouse", umc);
	}

	@Override
	public List<WHPictureVO> selectWHPicture(String cl_code) throws SQLException {
		List<WHPictureVO> pictureList = sqlSession.selectList("Member-Mapper.selectWHPicture", cl_code);
		return pictureList;
	}
}
