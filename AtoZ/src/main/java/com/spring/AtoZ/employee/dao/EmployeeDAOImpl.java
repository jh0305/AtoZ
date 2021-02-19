package com.spring.AtoZ.employee.dao;

import org.apache.ibatis.session.SqlSession;

public class EmployeeDAOImpl implements EmployeeDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
}	
