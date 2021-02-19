package com.spring.AtoZ.dashboard.dao;


import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.dashboard.dto.EmpCommand;
import com.spring.AtoZ.dashboard.dto.ListCommand;
import com.spring.AtoZ.dashboard.dto.OrderScheduleCommand;
import com.spring.AtoZ.dashboard.dto.ReleaseCommand;
import com.spring.AtoZ.dashboard.dto.ReleaseScheduleCommand;
import com.spring.AtoZ.dashboard.dto.WmsWidgetCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderVO;

public interface DashBoardDAO {
	
	//민규 0107 대시보드 위젯 넘버
	int selectQnaCnt() throws SQLException;
	int selectContractReqCnt() throws SQLException;
	int selectContractExpCnt() throws SQLException;
	int selectPaymentHisCnt() throws SQLException;
	
	//민규 0108 대시보드 리스트
	List<ListCommand> selectToDayQnaList() throws SQLException;
	List<ClientVO> selectContractReqClientList() throws SQLException;
	List<ClientVO> selectContractExpClientList() throws SQLException;
	List<ListCommand> selectToDayPayList() throws SQLException;
	
	//company
	//금일 입고 예정 건 수
	int selectCountinOrderByToday(String cl_code) throws SQLException;
	
	//금일 출고 예정 건수
	int selectCountreleaseByToday(String cl_code) throws SQLException;
	
	//계약중인 물류센터 수
	int selectCountc2cContract(String cl_code) throws SQLException;
	
	//확인하지 않은 쪽지
	int selectCountmsgByreadYn(String cl_code) throws SQLException;
	
	//입고 예정 목록
	List<OrderVO> selectReceiveListByToday(String cl_code) throws SQLException;
	
	//출고 예정 목록
	List<ReleaseCommand> selectReleaseListByToday(String cl_code) throws SQLException;
	
	//입고 스케줄
	List<OrderScheduleCommand> selectOrderSchedule(String cl_code) throws SQLException;
	
	//출고 스케줄
	List<ReleaseScheduleCommand> selectReleaseSchedule(String cl_code) throws SQLException;

	//Warehouse
	// 출고요청건수
	public int getRlsReqNum(String wh_code) throws SQLException;
	// 입고요청건수
	public int getInReqNum(String wh_code) throws SQLException;
	// 금일 입고 예졍 건수
	public int getInPlanNum(String wh_code) throws SQLException;
	// 금일 출고 예정 건수
	public int getOutPlanNum(String wh_code) throws SQLException;
	// 금일 근무자
	public List<EmpCommand> getEmpList(String wh_code) throws SQLException;
	// 계약 요청 건수
	public int getCtrReqNum(String wh_code) throws SQLException;
	// 금일 입고 예정 목록
	public List<WmsWidgetCommand> selectTodayInPlan(String wh_code)throws SQLException;
	// 금일 출고 예정 목록
	public List<WmsWidgetCommand> selectTodayOutPlan(String wh_code)throws SQLException;
	// 입고 요청 목록
	public List<WmsWidgetCommand> selectInReqList(String wh_code)throws SQLException;
	// 출고 요청 목록
	public List<WmsWidgetCommand> selectOutReqList(String wh_code)throws SQLException;
	
}
