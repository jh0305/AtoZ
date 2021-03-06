package com.spring.AtoZ.receive.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.receive.dto.ReceiveCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;
import com.spring.AtoZ.vo.EmployeeVO;
import com.spring.AtoZ.vo.OrderItemVO;

public interface ReceiveDAO {

	List<ReceiveCommand> selectSearchReceivePlanList(SearchMap sm) throws SQLException;

	int selectReceiveListPlanCount(SearchMap sm) throws SQLException;
	
	public List<ReceiveCommand> selectSearchReceiveComplList(SearchMap sm) throws SQLException;
	
	public int selectReceiveListComplCount(SearchMap sm) throws SQLException;
	
	public List<ReceiveCommand> selectSearchReceiveReqList(SearchMap sm) throws SQLException;
	
	public int selectReceiveListReqCount(SearchMap sm) throws SQLException;

	int updateManager(Map<String, String> map) throws SQLException;

	List<EmployeeVO> selectEmployeeList(SearchMap sm) throws SQLException;

	List<OrderItemVO> selectOrderItemList(String ord_no) throws SQLException;

	int selectEmployeeListCount(SearchMap sm) throws SQLException;

	int updateDecision(Map<String, Object> dataMap) throws SQLException;

	List<ReceiveCommand> selectTodayReceiveList() throws SQLException;
	
	List<ReceiveCommand> selectTodayReceiveList(String wh_code, SearchMap sm) throws SQLException;

	List<StrategyStockCommand> selectTempStockList(String ord_no) throws SQLException;

	String selectOrderSts(String ord_no) throws SQLException;

	List<StrategyStockCommand> selectTempItemList(String ord_no) throws SQLException;

	List<String> selectZoneByCode(Map<String, String> search) throws SQLException;

	void updateInvLoc(Map<String, String> data) throws SQLException;

	int selectTodayReceiveCount(String wh_code) throws SQLException;
	

}
