package com.spring.AtoZ.common.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.vo.MenuVO;

public class CommonDAOImpl implements CommonDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	@Override
	public MenuVO selectMenuByMcode(String mCode) throws SQLException {
		MenuVO menu = sqlSession.selectOne("Common-Mapper.selectMenuByMcode", mCode);
		return menu;
	}
	@Override
	public List<MenuVO> selectMenuList() throws SQLException {
		List<MenuVO> menuList = sqlSession.selectList("Common-Mapper.selectMenuList");
		return menuList;
	}
	@Override
	public List<MenuVO> selectSubMenuList() throws SQLException {
		List<MenuVO> subList = sqlSession.selectList("Common-Mapper.selectSubMenuList");
		return subList;
	}
}
