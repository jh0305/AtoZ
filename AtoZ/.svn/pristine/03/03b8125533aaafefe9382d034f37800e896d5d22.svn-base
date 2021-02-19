package com.spring.AtoZ.commoncode.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.vo.CommonCodeVO;

public class CommonCodeDAOImpl implements CommonCodeDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	@Override
	public List<CommonCodeVO> selectCodeTypeList() throws SQLException {
		List<CommonCodeVO> typeList = sqlSession.selectList("CommonCode-Mapper.selectCodeTypeList");
		return typeList;
	}
	
	@Override
	public List<CommonCodeVO> selectCodeListByType(String type) throws SQLException {
		List<CommonCodeVO> codeList = sqlSession.selectList("CommonCode-Mapper.selectCodeListByType",type);
		return codeList;
	}
	@Override
	public List<CommonCodeVO> selectTypeListByAct() throws SQLException {
		List<CommonCodeVO> codeList = sqlSession.selectList("CommonCode-Mapper.selectTypeListByAct");
		return codeList;
	}
	@Override
	public void updateCodeType(CommonCodeVO object) throws SQLException {
		sqlSession.update("CommonCode-Mapper.updateCodeType", object);
		
	}
	@Override
	public void updateCode(CommonCodeVO code) throws SQLException {
		sqlSession.update("CommonCode-Mapper.updateCode", code);
		
	}
	@Override
	public void insertCodeType(CommonCodeVO codeVO) throws SQLException {
		sqlSession.update("CommonCode-Mapper.insertCodeType", codeVO);
		
	}
	@Override
	public void insertCode(CommonCodeVO codeVO) throws SQLException {
		sqlSession.update("CommonCode-Mapper.insertCode", codeVO);
		
	}
	@Override
	public int selectDuplicationType(CommonCodeVO codeVO) throws SQLException {
		int cnt = sqlSession.selectOne("CommonCode-Mapper.selectDuplicationType",codeVO);
		return cnt;
	}
	@Override
	public int selectDuplicationCode(CommonCodeVO codeVO) throws SQLException {
		int cnt = sqlSession.selectOne("CommonCode-Mapper.selectDuplicationCode",codeVO);
		return cnt;
	}
	@Override
	public int selectDuplicationCodeForList(CommonCodeVO codeVO) throws SQLException {
		int cnt = sqlSession.selectOne("CommonCode-Mapper.selectDuplicationCodeForList",codeVO);
		return cnt;
	}
	@Override
	public int selectDuplicationTypeForList(CommonCodeVO codeVO) throws SQLException {
		int cnt = sqlSession.selectOne("CommonCode-Mapper.selectDuplicationTypeForList",codeVO);
		return cnt;
	}
}
