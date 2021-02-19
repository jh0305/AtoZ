package com.spring.AtoZ.stock.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.stock.dto.StockCheckCommand;

public interface StockService {

	// 물류센터 재고 목록
	public Map<String, Object> getWhsStockList(SearchMap sm) throws SQLException;
	
	// 물류센터 상세 재고 목록
	public Map<String, Object> getDetailStockList(SearchMap sm) throws SQLException;
	
	// 기업 재고 목록
	public Map<String, Object> getCoStockList(SearchMap sm) throws SQLException;
	
	// 기업 재고 상세 이력 목록
	public Map<String, Object> getCoStockDetailList(SearchMap sm) throws SQLException;
	
	// 물류센터 실사 현황 목록
	public Map<String, Object> getWhsStockCheckList(SearchMap sm) throws SQLException;
	
	// 물류센터에서 재고 실사 결과 재고에 반영
	public void modifyInventoryByCheck(List<StockCheckCommand> cmd) throws SQLException;
	
	// 물류센터 재고 번호 별 상세 이력 목록
	public Map<String, Object> getDetailStockListByInvNo(SearchMap sm) throws SQLException;
	
	
}
