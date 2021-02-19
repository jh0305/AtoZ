package com.spring.AtoZ.mobile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.mobile.dto.InvCheckCommand;
import com.spring.AtoZ.picking.dto.PickingCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;
import com.spring.AtoZ.vo.AttendanceVO;
import com.spring.AtoZ.vo.EmployeeVO;

public interface MobileDAO {
	EmployeeVO selectEmployee(String id) throws SQLException;
	AttendanceVO selectYesterdayCheck(String id) throws SQLException;
	AttendanceVO selectAttndCheck(String id) throws SQLException;
	void insertAttnd(String id) throws SQLException;
	void updateAttnd(Map<String, Object> map) throws SQLException;
	
	List<Map<String, Object>> selectReceiveList(String id) throws SQLException;
	List<Map<String, Object>> selectOrderItemInReceive(int ordNo) throws SQLException;
	List<Map<String, Object>> selectLocOrderItem(String invLoc, int ordNo) throws SQLException;
	
	Map<String, Object> selectReceiveItem(int inv_no) throws SQLException;
	void updateInOrder(int ordNo) throws SQLException;
	void updateOrderItem(int inv_no, int in_qty, int oi_no) throws SQLException;
	void updateInventory(int inv_no, String inv_loc) throws SQLException;
	List<Map<String, Object>> selectReleaseList(String empId) throws SQLException;
	List<Map<String, Object>> selectReleaseItemList(int rlsNo) throws SQLException;
	void updateReleaseStatus(int rls_no) throws SQLException;
	void updatePicking(int in_qty, int rls_no, int inv_no) throws SQLException;
	void updateRelease(int rls_no) throws SQLException;
	void updateReleaseItem(int in_qty, int rls_no, int item_no) throws SQLException;
	void updateReleaseInv(int in_qty, int inv_no) throws SQLException;
	void insertReleaseHistory(int inv_no, int in_qty, String emp_name) throws SQLException;
	void updateReleaseStatus2(int rls_no) throws SQLException;
	
	// 피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹 
	PickingCommand selectPickingByNo(PickingCommand pick) throws SQLException;
	void updatePickingQnS(PickingCommand comm) throws SQLException;
	// 피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹 
	List<PickingCommand> selectPickingList(String rls_no) throws SQLException;
	
	// 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사
	
	InvCheckCommand selectInvCheck(InvCheckCommand icc) throws SQLException;
	void insertInvCheck(InvCheckCommand icc) throws SQLException;
	void updateInvCheck(InvCheckCommand icc) throws SQLException;
	List<InvCheckCommand> selectInvCheckList(String inv_loc) throws SQLException;
	List<InvCheckCommand> selectStockList(String inv_loc) throws SQLException;
	void insertInvCheckList(List<StrategyStockCommand> stockList) throws SQLException;
	int selectInvCheckCount(String inv_loc) throws SQLException;
	InvCheckCommand selectStock(String inv_no) throws SQLException;
	String selectLocationName(String inv_loc) throws SQLException;

	// 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사
	
}
