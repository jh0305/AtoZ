package com.spring.AtoZ.dashboard.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.dashboard.dao.DashBoardDAO;
import com.spring.AtoZ.dashboard.dto.EmpCommand;
import com.spring.AtoZ.dashboard.dto.ListCommand;
import com.spring.AtoZ.dashboard.dto.OrderScheduleCommand;
import com.spring.AtoZ.dashboard.dto.ReleaseCommand;
import com.spring.AtoZ.dashboard.dto.ReleaseScheduleCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderVO;

public class DashBoardServiceImpl implements DashBoardService {
		
	private DashBoardDAO dashBoardDAO;
	public void setDashBoardDAO(DashBoardDAO dashBoardDAO) {
		this.dashBoardDAO = dashBoardDAO;
	}
	
	
	// 물류센터 대시보드 위젯용
	private Map<String, Integer> getWidgetNums(String wh_code) throws SQLException {
		Map<String, Integer> dataMap = new HashMap<String, Integer>();
		int rlsReqNum = dashBoardDAO.getRlsReqNum(wh_code);
		int inReqNum = dashBoardDAO.getInReqNum(wh_code);
		int inPlanNum = dashBoardDAO.getInPlanNum(wh_code);
		int outPlanNum = dashBoardDAO.getOutPlanNum(wh_code);
		int ctrReqNum = dashBoardDAO.getCtrReqNum(wh_code);

		dataMap.put("rlsReqNum", rlsReqNum);
		dataMap.put("inReqNum", inReqNum);
		dataMap.put("inPlanNum", inPlanNum);
		dataMap.put("outPlanNum", outPlanNum);
		dataMap.put("ctrReqNum", ctrReqNum);
		return dataMap;
	}

	// 물류센터 대시보드 위젯 + 출퇴근
	@Override
	public Map<String, Object> forWhsDash(String wh_code) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		//List<EmpCommand> empList = dashBoardDAO.getEmpList(wh_code);
		dataMap.put("widgetNums", getWidgetNums(wh_code));
		//dataMap.put("empList", empList);
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getWidgetNumbers() throws SQLException {
		
		//입력 처리 
		int qnaCnt = dashBoardDAO.selectQnaCnt();
		int crReqCnt = dashBoardDAO.selectContractReqCnt();
		int crExpCnt = dashBoardDAO.selectContractExpCnt();
		int payHisCnt = dashBoardDAO.selectPaymentHisCnt();
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//출력
		dataMap.put("qnaCnt", qnaCnt);
		dataMap.put("crReqCnt", crReqCnt);
		dataMap.put("crExpCnt", crExpCnt);
		dataMap.put("payHisCnt", payHisCnt);
		
		return dataMap;
	}
	
	@Override
	public List<OrderScheduleCommand> getOrderSchedule(String cl_code) throws SQLException {
		List<OrderScheduleCommand> orderschedulelist = dashBoardDAO.selectOrderSchedule(cl_code);
		return orderschedulelist;
	}
	@Override
	public List<ReleaseScheduleCommand> getReleaseSchedule(String cl_code) throws SQLException {
		List<ReleaseScheduleCommand> releaseschedulelist = dashBoardDAO.selectReleaseSchedule(cl_code);
		return releaseschedulelist;
	}
	@Override
	public Map<String, Object> getDashboardData(String cl_code) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int cot = dashBoardDAO.selectCountinOrderByToday(cl_code);
		int crt = dashBoardDAO.selectCountreleaseByToday(cl_code);
		int ctc = dashBoardDAO.selectCountc2cContract(cl_code);
		int cmn = dashBoardDAO.selectCountmsgByreadYn(cl_code);
		List<OrderVO> receivelist = dashBoardDAO.selectReceiveListByToday(cl_code);
		List<ReleaseCommand> releaselist = dashBoardDAO.selectReleaseListByToday(cl_code);
		dataMap.put("cot", cot);
		dataMap.put("crt", crt);
		dataMap.put("ctc", ctc);
		dataMap.put("cmn", cmn);
		dataMap.put("receivelist", receivelist);
		dataMap.put("releaselist", releaselist);
		return dataMap;
	}
	@Override
	public Map<String, Object> getListWidgetData() throws SQLException {
		
		Map<String, Object> getListWidgetData = new HashMap<String, Object>();
		
		List<ListCommand> selectToDayQnaList = dashBoardDAO.selectToDayQnaList();
		List<ClientVO> selectContractReqClientList = dashBoardDAO.selectContractReqClientList();
		List<ClientVO> selectContractExpClientList = dashBoardDAO.selectContractExpClientList();
		List<ListCommand> selectToDayPayList = dashBoardDAO.selectToDayPayList();
		
		getListWidgetData.put("selectToDayQnaList", selectToDayQnaList);
		getListWidgetData.put("selectContractReqClientList", selectContractReqClientList);
		getListWidgetData.put("selectContractExpClientList", selectContractExpClientList);
		getListWidgetData.put("selectToDayPayList", selectToDayPayList);
		
		return getListWidgetData;
	}
}
