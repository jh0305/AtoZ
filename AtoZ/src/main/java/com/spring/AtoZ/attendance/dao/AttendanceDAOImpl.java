package com.spring.AtoZ.attendance.dao;

import org.apache.ibatis.session.SqlSession;

public class AttendanceDAOImpl implements AttendanceDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
}
