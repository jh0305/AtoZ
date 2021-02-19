package com.spring.AtoZ.branch.dao;

import org.apache.ibatis.session.SqlSession;

public class BranchDAOImpl implements BranchDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
