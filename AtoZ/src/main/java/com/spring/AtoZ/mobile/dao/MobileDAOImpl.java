package com.spring.AtoZ.mobile.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator;

import com.spring.AtoZ.mobile.dto.InvCheckCommand;
import com.spring.AtoZ.picking.dto.PickingCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;
import com.spring.AtoZ.vo.AttendanceVO;
import com.spring.AtoZ.vo.EmployeeVO;

public class MobileDAOImpl implements MobileDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	@Override
	public EmployeeVO selectEmployee(String id) throws SQLException {
		EmployeeVO employee = null;
		employee = sqlSession.selectOne("Mobile-Mapper.selectEmployee", id);
		return employee;
	}
	@Override
	public AttendanceVO selectYesterdayCheck(String id) throws SQLException {
		AttendanceVO resultVO = null;
		resultVO = sqlSession.selectOne("Mobile-Mapper.selectYesterdayCheck", id);
		return resultVO;
	}
	@Override
	public AttendanceVO selectAttndCheck(String id) throws SQLException {
		AttendanceVO resultVO = null;
		resultVO = sqlSession.selectOne("Mobile-Mapper.selectAttndCheck", id);
		return resultVO;
	}
	@Override
	public void insertAttnd(String id) throws SQLException {
		sqlSession.update("Mobile-Mapper.insertAttnd", id);
	}
	@Override
	public void updateAttnd(Map<String, Object> map) throws SQLException {
		sqlSession.update("Mobile-Mapper.updateAttnd", map);
	}
	
	@Override
	public List<Map<String, Object>> selectReceiveList(String id) throws SQLException {
		List<Map<String, Object>> dataList = null;
		dataList = sqlSession.selectList("Mobile-Mapper.selectReceiveList", id);
		return dataList;
	}
	@Override
	public List<Map<String, Object>> selectOrderItemInReceive(int ordNo) throws SQLException {
		List<Map<String, Object>> dataList = null;
		dataList = sqlSession.selectList("Mobile-Mapper.selectOrderItemInReceive", ordNo);
		return dataList;
	}
	@Override
	public List<Map<String, Object>> selectLocOrderItem(String invLoc, int ordNo) throws SQLException {
		List<Map<String, Object>> dataList = null;
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("invLoc", invLoc);
		dataMap.put("ordNo", ordNo);
		dataList = sqlSession.selectList("Mobile-Mapper.selectLocOrderItem", dataMap);
		return dataList;
	}
	
	@Override
	public Map<String, Object> selectReceiveItem(int inv_no) throws SQLException {
		Map<String, Object> dataMap = sqlSession.selectOne("Mobile-Mapper.selectReceiveItem", inv_no);
		return dataMap;
	}
	@Override
	public void updateInventory(int inv_no, String inv_loc) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("inv_no", inv_no);
		dataMap.put("inv_loc", inv_loc);
		sqlSession.update("Mobile-Mapper.updateInventory", dataMap);
	}
	@Override
	public void updateInOrder(int ordNo) throws SQLException {
		sqlSession.update("Mobile-Mapper.updateInOrder", ordNo);
	}
	@Override
	public void updateOrderItem(int inv_no, int in_qty, int oi_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("inv_no", inv_no);
		dataMap.put("in_qty", in_qty);
		dataMap.put("oi_no", oi_no);
		sqlSession.update("Mobile-Mapper.updateOrderItem", dataMap);
	}
	@Override
	public List<Map<String, Object>> selectReleaseList(String empId) throws SQLException {
		List<Map<String, Object>> dataList = null;
		dataList = sqlSession.selectList("Mobile-Mapper.selectReleaseList", empId);
		return dataList;
	}
	@Override
	public List<Map<String, Object>> selectReleaseItemList(int rlsNo) throws SQLException {
		List<Map<String, Object>> dataList = null;
		dataList = sqlSession.selectList("Mobile-Mapper.selectReleaseItemList", rlsNo);
		return dataList;
	}
	@Override
	public void updateReleaseStatus(int rls_no) throws SQLException {
		sqlSession.update("Mobile-Mapper.updateReleaseStatus", rls_no);
	}
	@Override
	public void insertReleaseHistory(int inv_no, int in_qty, String emp_name) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("inv_no", inv_no);
		dataMap.put("in_qty", in_qty);
		dataMap.put("emp_name", emp_name);
		sqlSession.update("Mobile-Mapper.insertReleaseHistory", dataMap);
	}
	@Override
	public void updateReleaseInv(int in_qty, int inv_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("in_qty", in_qty);
		dataMap.put("inv_no", inv_no);
		sqlSession.update("Mobile-Mapper.updateReleaseInv", dataMap);
	}
	@Override
	public void updatePicking(int in_qty, int rls_no, int inv_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("in_qty", in_qty);
		dataMap.put("rls_no", rls_no);
		dataMap.put("inv_no", inv_no);
		sqlSession.update("Mobile-Mapper.updatePicking", dataMap);
	}
	@Override
	public void updateRelease(int rls_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("rls_no", rls_no);
		sqlSession.update("Mobile-Mapper.updateRelease", dataMap);
	}
	@Override
	public void updateReleaseItem(int in_qty, int rls_no, int item_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("in_qty", in_qty);
		dataMap.put("rls_no", rls_no);
		dataMap.put("item_no", item_no);
		sqlSession.update("Mobile-Mapper.updateReleaseItem", dataMap);
	}
	@Override
	public void updateReleaseStatus2(int rls_no) throws SQLException {
		sqlSession.update("Mobile-Mapper.updateReleaseStatus2", rls_no);
	}
	
	
	// 피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹
	
	@Override
	public PickingCommand selectPickingByNo(PickingCommand pick) throws SQLException {
		PickingCommand com = sqlSession.selectOne("Mobile-Mapper.selectPickingByNo");
		return com;
	}
	
	@Override
	public void updatePickingQnS(PickingCommand comm) throws SQLException{
		sqlSession.update("Mobile-Mapper.updatePickingQnS",comm);
	}
	@Override
	public List<PickingCommand> selectPickingList(String rls_no) throws SQLException {
		List<PickingCommand> list = sqlSession.selectList("Picking-Mapper.selectPickingList", rls_no); 
		return list;
	}
	// 피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹
	
	// 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실

	@Override
	public InvCheckCommand selectInvCheck(InvCheckCommand icc) throws SQLException {
		InvCheckCommand check = sqlSession.selectOne("Mobile-Mapper.selectInvCheck",icc);
		return check;
	}
	@Override
	public void insertInvCheck(InvCheckCommand icc) throws SQLException {
		sqlSession.update("Mobile-Mapper.insertInvCheck", icc);
	}
	@Override
	public void updateInvCheck(InvCheckCommand icc) throws SQLException {
		sqlSession.update("Mobile-Mapper.updateInvCheck", icc);
		
	}
	@Override
	public List<InvCheckCommand> selectInvCheckList(String inv_loc) throws SQLException {
		List<InvCheckCommand> list = sqlSession.selectList("Mobile-Mapper.selectInvCheckList", inv_loc);
		return list;
	}
	@Override
	public List<InvCheckCommand> selectStockList(String inv_loc) throws SQLException {
		List<InvCheckCommand> list = sqlSession.selectList("Mobile-Mapper.selectStockList", inv_loc);
		return list;
	}
	@Override
	public void insertInvCheckList(List<StrategyStockCommand> stockList) throws SQLException {
		sqlSession.update("Mobile-Mapper.insertInvCheckList", stockList);
		
	}
	@Override
	public int selectInvCheckCount(String inv_loc) throws SQLException {
		int cnt = sqlSession.selectOne("Mobile-Mapper.selectInvCheckCount", inv_loc);
		return cnt;
	}
	@Override
	public InvCheckCommand selectStock(String inv_no) throws SQLException {
		InvCheckCommand comm = sqlSession.selectOne("Mobile-Mapper.selectStock", inv_no);
		return comm;
	}
	@Override
	public String selectLocationName(String inv_loc) throws SQLException {
		
		return sqlSession.selectOne("Mobile-Mapper.selectLocationName", inv_loc);
	}
	
	// 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실
	
}







