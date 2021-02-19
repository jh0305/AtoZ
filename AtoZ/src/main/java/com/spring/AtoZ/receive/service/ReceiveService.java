package com.spring.AtoZ.receive.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.receive.dto.ReceiveCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;
import com.spring.AtoZ.vo.OrderItemVO;

public interface ReceiveService {

	Map<String, Object> getReceivePlanList(SearchMap sm) throws SQLException;

	Map<String, Object> getReceiveComplList(SearchMap sm) throws SQLException;

	Map<String, Object> getReceiveReqList(SearchMap sm) throws SQLException;

	void modifyManager(Map<String, String>[] arr) throws SQLException;

	Map<String, Object> getEmployeeList(SearchMap sm) throws SQLException;

	List<OrderItemVO> getOrderItemList(String ord_no) throws SQLException;

	void decide(Map<String, Object> dataMap) throws SQLException;

	List<ReceiveCommand> getTodayReceiveList() throws SQLException;
	
	Map<String, Object> getTodayReceiveList(String wh_code, SearchMap sm) throws SQLException;

	Map<String,Object> getTempStockList(String ord_no) throws SQLException;

	String getOrderSts(String ord_no) throws SQLException;

	Map<String, Object> getZoneByCode(Map<String, String> search) throws SQLException;

	void modifyInvLoc(Map<String, String> data) throws SQLException;
}
