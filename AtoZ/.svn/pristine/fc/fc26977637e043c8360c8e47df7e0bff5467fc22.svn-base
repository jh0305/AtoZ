package com.spring.AtoZ.common.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.common.dao.CommonDAO;
import com.spring.AtoZ.vo.MenuVO;

public class CommonServiceImpl implements CommonService {
	private CommonDAO commonDAO;
	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}
	
	@Override
	public MenuVO getMenuByMcode(String mCode) throws SQLException {
		
		MenuVO menu = commonDAO.selectMenuByMcode(mCode);
		
		return menu;
	}

	@Override
	public List<MenuVO> getMenuList() throws SQLException {
		List<MenuVO> menuList = commonDAO.selectMenuList();
		
		return menuList;
	}

	@Override
	public List<MenuVO> getSubMenuList() throws SQLException {
		List<MenuVO> subList = commonDAO.selectSubMenuList();
		return subList;
	}
	
	
	
}
