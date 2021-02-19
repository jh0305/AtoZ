package com.spring.AtoZ.common.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.vo.MenuVO;

public interface CommonDAO {

	MenuVO selectMenuByMcode(String mCode) throws SQLException;

	List<MenuVO> selectMenuList() throws SQLException;

	List<MenuVO> selectSubMenuList() throws SQLException;

}
