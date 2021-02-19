package com.spring.AtoZ.mobile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;

import com.spring.AtoZ.exception.MissingPasswordException;
import com.spring.AtoZ.exception.NotFoundIdException;
import com.spring.AtoZ.mobile.dto.InvCheckCommand;
import com.spring.AtoZ.picking.dto.PickingCommand;

public interface MobileService {
	void login(String id, String pwd, HttpSession session) throws NotFoundIdException, MissingPasswordException, SQLException;
	String enterAndLeave(String id) throws Exception;
	Map<String, Object> getReceiveItem(int inv_no) throws Exception;
	void modifyReceive(Map<String, Object>[] mapArr, String emp_name) throws Exception;
	void modifyReceiveLast(int ordNo) throws Exception;
	List<Map<String, Object>> getReleaseList(String empId) throws Exception;
	List<Map<String, Object>> getReleaseItemList(int rlsNo) throws Exception;
	void modifyRelease(Map<String, Object>[] mapArr, String emp_name) throws Exception;
	List<Map<String, Object>> getReceiveList(String id) throws Exception;
	List<Map<String, Object>> getOrderItemReceive(int ordNo) throws Exception;
	List<Map<String, Object>> getLocOrderItem(String invLoc, int ordNo) throws Exception;
	
	// 피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹 
	
	int modifyPickingSts(PickingCommand pick) throws SQLException;
	void modifypickingQty(PickingCommand[] arr) throws SQLException;
	List<PickingCommand> getPickingList(String rls_no) throws SQLException;

	// 피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹 
	
	// 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사

	void modifyInvCheck(InvCheckCommand[] arr, String reg_name) throws SQLException;
	List<InvCheckCommand> getStockInRack(String inv_loc) throws SQLException;
	InvCheckCommand getStock(String inv_no) throws SQLException;
	String getLocationName(String inv_loc) throws SQLException;
	
	
	// 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사
}
