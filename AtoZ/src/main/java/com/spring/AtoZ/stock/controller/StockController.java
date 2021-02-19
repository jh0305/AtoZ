package com.spring.AtoZ.stock.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.stock.service.StockService;
import com.spring.AtoZ.vo.ClientVO;

@Controller
public class StockController {
	
	@Autowired
	private StockService service;
	
	@RequestMapping(value="/WH/stock/wh_list")
	public String getWhStockList() throws SQLException{		
		String url = "/stock/wh_stock_list.frame";		
		return url;
	}
	
	@RequestMapping(value="/CO/stock/com_list")
	public String getComStockList() {
		String url = "/stock/co_stock_list.frame";
		return url;
	}
	
	@RequestMapping(value="/WH/stock/wh_check")
	public ModelAndView getWhsStockCheckList(ModelAndView mnv, HttpSession session, SearchMap sm,
			@RequestParam(defaultValue="") String searchType,
			@RequestParam(defaultValue="") String keyword) throws SQLException{
		String url = "stock/check_stock.frame";
		ClientVO vo = (ClientVO)session.getAttribute("loginUser");
		String wh_code = vo.getCl_code();
		sm.setUrl("/WH/stock/wh_check");
		sm.put("wh_code", wh_code);
		sm.put("searchType", searchType);
		sm.put("keyword", keyword);
		mnv.addAllObjects(service.getWhsStockCheckList(sm));
		mnv.setViewName(url);
		return mnv;
	}

	
	@RequestMapping(value="/wh_stock_his")
	public String getWhStockHistory() {
		String url = "/stock/wh_stock_history.frame";
		return url;
	}
}
