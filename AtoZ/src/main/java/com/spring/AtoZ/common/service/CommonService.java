package com.spring.AtoZ.common.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.vo.MenuVO;

public interface CommonService {

	public MenuVO getMenuByMcode(String mCode) throws SQLException;

	public List<MenuVO> getMenuList() throws SQLException;

	public List<MenuVO> getSubMenuList() throws SQLException;
	
}
