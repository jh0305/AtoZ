package com.spring.AtoZ.mobile.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.spring.AtoZ.exception.MissingPasswordException;
import com.spring.AtoZ.exception.NotFoundIdException;
import com.spring.AtoZ.mobile.dao.MobileDAO;
import com.spring.AtoZ.mobile.dto.InvCheckCommand;
import com.spring.AtoZ.picking.dto.PickingCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;
import com.spring.AtoZ.vo.AttendanceVO;
import com.spring.AtoZ.vo.EmployeeVO;

public class MobileServiceImpl implements MobileService {
	private MobileDAO mobileDAO;
	public void setMobileDAO(MobileDAO mobileDAO) {
		this.mobileDAO = mobileDAO;
	}
	
	@Override
	public void login(String id, String pwd, HttpSession session) throws NotFoundIdException, MissingPasswordException, SQLException {
		//로그인 시도에 대한 로그기록?
		EmployeeVO employee = mobileDAO.selectEmployee(id);
		
		if (employee== null) {
			throw new NotFoundIdException();
		} else if (!employee.getEmp_pwd().equals(pwd)) {
			throw new MissingPasswordException();
		}
		
		session.setAttribute("loginUser", employee);
//		session.setMaxInactiveInterval(60*20);
	}
	
	@Override
	public String enterAndLeave(String id) throws Exception {
		String msg = null;
		
		AttendanceVO yesterdayVO = mobileDAO.selectYesterdayCheck(id);
		AttendanceVO todayVO = mobileDAO.selectAttndCheck(id);
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		
		if (todayVO == null) { //오늘 출근을 안한 상태
			if (yesterdayVO.getOut_date() != null) { //바로 이전 출근기록에 퇴근이 찍혀있는 상태
				mobileDAO.insertAttnd(id);
				msg = "Hi";
				
			} else { //이전 출근기록에 퇴근이 안찍힌 상태
				dateConversion(yesterdayVO.getOut_date(), map);
				mobileDAO.updateAttnd(map);
				msg = "Bye";
			}
		} else { //오늘 출근을 한 상태
			dateConversion(todayVO.getWork_date(), map);
			mobileDAO.updateAttnd(map);
			msg = "Bye";
		}
		
		return msg;
	}
	
	public void dateConversion(Date date, Map<String, Object> map) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String convertedDate = format.format(date);
		map.put("date", convertedDate);
	}

	@Override
	public Map<String, Object> getReceiveItem(int inv_no) throws Exception {
		Map<String, Object> dataMap = null;
		dataMap = mobileDAO.selectReceiveItem(inv_no);
		
		if (dataMap == null || dataMap.isEmpty()) {
			dataMap = new HashMap<>();
			dataMap.put("msg", "입고예정 품목이 아닙니다.");
		}
		
		return dataMap;
	}
	@Override
	public void modifyReceive(Map<String, Object>[] mapArr, String emp_name) throws Exception {
		int invNo = 0; 
		int inQty = 0;
		int oiNo = 0;
		
		for (int i = 0; i < mapArr.length; i++) {
			invNo = Integer.parseInt(mapArr[i].get("invNo").toString());
			inQty = Integer.parseInt(mapArr[i].get("inQty").toString());
			oiNo = Integer.parseInt(mapArr[i].get("oiNo").toString());
			
			mobileDAO.updateOrderItem(invNo, inQty, oiNo);
			mobileDAO.updateInventory(invNo, mapArr[i].get("invLoc").toString());
		}
	}
	@Override
	public void modifyReceiveLast(int ordNo) throws Exception {
		mobileDAO.updateInOrder(ordNo);
	}
	@Override
	public List<Map<String, Object>> getReceiveList(String id) throws Exception {
		List<Map<String, Object>> dataList = null;
		dataList = mobileDAO.selectReceiveList(id);
		return dataList;
	}
	
	@Override
	public List<Map<String, Object>> getReleaseList(String empId) throws Exception {
		List<Map<String, Object>> dataList = null;
		dataList = mobileDAO.selectReleaseList(empId);
		return dataList;
	}
	
	@Override
	public List<Map<String, Object>> getReleaseItemList(int rlsNo) throws Exception {
		List<Map<String, Object>> dataList = null;
		mobileDAO.updateReleaseStatus(rlsNo);
		dataList = mobileDAO.selectReleaseItemList(rlsNo);
		return dataList;
	}
	
	@Override
	public List<Map<String, Object>> getOrderItemReceive(int ordNo) throws Exception {
		List<Map<String, Object>> dataList = null;
		dataList = mobileDAO.selectOrderItemInReceive(ordNo);
		return dataList;
	}
	@Override
	public List<Map<String, Object>> getLocOrderItem(String invLoc, int ordNo) throws Exception {
		List<Map<String, Object>> dataList = null;
		dataList = mobileDAO.selectLocOrderItem(invLoc, ordNo);
		return dataList;
	}
	
	@Override
	public void modifyRelease(Map<String, Object>[] mapArr, String emp_name) throws Exception {
		int inv_no = 0;
		int in_qty = 0;
		int item_no = 0;
		int rls_no = Integer.parseInt(mapArr[0].get("rls_no").toString());
		
		//출고정보수정
		mobileDAO.updateRelease(rls_no);
		mobileDAO.updateReleaseStatus2(rls_no);
		
		//출고품목정보수정, 이력등록
		for (int i = 0; i < mapArr.length; i++) {
			inv_no = Integer.parseInt((String) mapArr[i].get("inv_no"));
			in_qty = Integer.parseInt((String) mapArr[i].get("in_qty"));
			item_no = Integer.parseInt((String) mapArr[i].get("item_no"));
			
			mobileDAO.insertReleaseHistory(inv_no, in_qty, emp_name);
			mobileDAO.updateReleaseInv(in_qty, inv_no);
			mobileDAO.updatePicking(in_qty, rls_no, inv_no);
			mobileDAO.updateReleaseItem(in_qty, rls_no, item_no);
		}
	}
	
	// 피킹 피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹 
	
	@Override
	public int modifyPickingSts(PickingCommand pick) throws SQLException{
		int is = 0;
		PickingCommand comm = mobileDAO.selectPickingByNo(pick);
		if(comm == null || comm.getPik_no() == null || comm.getPik_no() == "") {
			is = 1; // 해당하는 정보가 없다. 즉, 현재 피킹 할 목록이 아니거나 자신이 담당자가 아닌 것.
		} else if(comm.getPik_qty() == comm.getQty()) {
			is = 2; // 이미 다 채웠다. 
		} else {
			comm.setQty(comm.getQty()+1);
			mobileDAO.updatePickingQnS(comm);
			is = 0;
		}
		return is;
	}

	@Override
	public void modifypickingQty(PickingCommand[] arr) throws SQLException {
		for(PickingCommand pic : arr) {
			if(pic.getQty() >= pic.getPik_qty()) { // 충분히 담았다면 
				pic.setSts_code("PK002");
			} else {
				pic.setSts_code("PK001");
			}
			
			mobileDAO.updatePickingQnS(pic);
		}
		
	}
	
	@Override
	public List<PickingCommand> getPickingList(String rls_no) throws SQLException {
		List<PickingCommand> list = mobileDAO.selectPickingList(rls_no);
		return list;
	}
	
	// 피킹 피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹  피킹 

	
	// 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 

	@Override
	public void modifyInvCheck(InvCheckCommand[] arr, String reg_name) throws SQLException {
		// 해당 inv_no 이면서 bfr_loc 가 wz_no인게 없으면 인서트 있으면 +1 // 여기서 wz_no는 랙-단열
		for(InvCheckCommand icc : arr) {
			if(icc.getChk_no() == 0) { // 존재하지 않으면 인서트
				icc.setReg_name(reg_name);
				mobileDAO.insertInvCheck(icc); 
			} else { // 존재하면 업데이트 
				icc.setReg_name(reg_name);
				mobileDAO.updateInvCheck(icc);
			}
		}
		
	}

	@Override
	public List<InvCheckCommand> getStockInRack(String inv_loc) throws SQLException {
		int size = mobileDAO.selectInvCheckCount(inv_loc); // 실사 테이블에 해당 위치의 데이터가 있는지 확인
		List<InvCheckCommand> list = new ArrayList<>();
		if(size==0) { // 없으면
			list = mobileDAO.selectStockList(inv_loc); // inv_loc에 있는 재고들
//			mobileDAO.insertInvCheckList(stockList); // 재고 정보로 실사 테이블 인서트
		} else {
			list = mobileDAO.selectInvCheckList(inv_loc); // inv_loc에 있는 실사 데이터 가져오기
		}
		
		return list;
	}

	@Override
	public InvCheckCommand getStock(String inv_no) throws SQLException {
		InvCheckCommand comm = mobileDAO.selectStock(inv_no);
		return comm;
	}

	@Override
	public String getLocationName(String inv_loc) throws SQLException {
		return mobileDAO.selectLocationName(inv_loc);
	}

	
	// 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 실사 
	
	
}











