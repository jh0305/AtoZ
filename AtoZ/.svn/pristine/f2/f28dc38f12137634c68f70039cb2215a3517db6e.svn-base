package com.spring.AtoZ.dashboard.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.dashboard.dto.EmpCommand;
import com.spring.AtoZ.dashboard.dto.ListCommand;
import com.spring.AtoZ.dashboard.dto.OrderScheduleCommand;
import com.spring.AtoZ.dashboard.dto.ReleaseCommand;
import com.spring.AtoZ.dashboard.dto.ReleaseScheduleCommand;
import com.spring.AtoZ.dashboard.dto.WmsWidgetCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderVO;

public class DashBoardDAOImpl implements DashBoardDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	@Override
	public int getRlsReqNum(String wh_code) throws SQLException {
		int result = sqlSession.selectOne("Dashboard-Mapper.selectRlsReqNum", wh_code);
		return result;
	}
	@Override
	public int getInReqNum(String wh_code) throws SQLException {
		int result = sqlSession.selectOne("Dashboard-Mapper.selectInReqNum", wh_code);
		return result;
	}
	@Override
	public int getInPlanNum(String wh_code) throws SQLException {
		int result = sqlSession.selectOne("Dashboard-Mapper.selectInPlanNum", wh_code);
		return result;
	}
	
	@Override
	public int getOutPlanNum(String wh_code) throws SQLException {
		int result = sqlSession.selectOne("Dashboard-Mapper.selectOutPlanNum", wh_code);
		return result;
	}
	@Override
	public List<EmpCommand> getEmpList(String wh_code) throws SQLException {
		List<EmpCommand> empList = sqlSession.selectList("Dashboard-Mapper.selectEmpList", wh_code);
		return empList;
	}
	
	@Override
	public int selectQnaCnt() throws SQLException {
		
		int qnaCnt = sqlSession.selectOne("Dashboard-Mapper.selectQnaCnt");
		
		return qnaCnt;
	}

	@Override
	public int selectContractReqCnt() throws SQLException {
		
		int crReqCnt = sqlSession.selectOne("Dashboard-Mapper.selectContractReqCnt");
		
		return crReqCnt;
	}

	@Override
	public int selectContractExpCnt() throws SQLException {
		
		int crExpCnt = sqlSession.selectOne("Dashboard-Mapper.selectContractExpCnt");
		
		return crExpCnt;
	}

	@Override
	public int selectPaymentHisCnt() throws SQLException {
		
		int payHisCnt = sqlSession.selectOne("Dashboard-Mapper.selectPaymentHisCnt");
		
		return payHisCnt;
	}
	
	@Override
	public int selectCountinOrderByToday(String cl_code) throws SQLException {
		int cnt = sqlSession.selectOne("Dashboard-Mapper.selectCountinOrderByToday", cl_code);
		return cnt;
	}
	@Override
	public int selectCountreleaseByToday(String cl_code) throws SQLException {
		int cnt = sqlSession.selectOne("Dashboard-Mapper.selectCountreleaseByToday", cl_code);
		return cnt;
	}
	@Override
	public int selectCountc2cContract(String cl_code) throws SQLException {
		int cnt = sqlSession.selectOne("Dashboard-Mapper.selectCountc2cContract", cl_code);
		return cnt;
	}
	@Override
	public int selectCountmsgByreadYn(String cl_code) throws SQLException {
		int cnt = sqlSession.selectOne("Dashboard-Mapper.selectCountmsgByreadYn", cl_code);
		return cnt;
	}
	@Override
	public List<OrderVO> selectReceiveListByToday(String cl_code) throws SQLException {
		List<OrderVO> orderlist = sqlSession.selectList("Dashboard-Mapper.selectReceiveListByToday", cl_code);
		return orderlist;
	}
	@Override
	public List<ReleaseCommand> selectReleaseListByToday(String cl_code) throws SQLException {
		List<ReleaseCommand> releaselist = sqlSession.selectList("Dashboard-Mapper.selectReleaseListByToday", cl_code);
		return releaselist;
	}

	@Override
	public List<OrderScheduleCommand> selectOrderSchedule(String cl_code) throws SQLException {
		List<OrderScheduleCommand> orderschedulelist = sqlSession.selectList("Dashboard-Mapper.selectOrderSchedule", cl_code);
		return orderschedulelist;
	}

	@Override
	public List<ReleaseScheduleCommand> selectReleaseSchedule(String cl_Code) throws SQLException {
		List<ReleaseScheduleCommand> releaseschedulelist = sqlSession.selectList("Dashboard-Mapper.selectReleaseSchedule", cl_Code);
		return releaseschedulelist;
	}
	
	@Override
	public List<ListCommand> selectToDayQnaList() throws SQLException {
		
		List<ListCommand> selectToDayQnaList = new ArrayList<ListCommand>();
		
		selectToDayQnaList = sqlSession.selectList("Dashboard-Mapper.selectToDayQnaList");
		
		return selectToDayQnaList;
	}
	
	@Override
	public List<ClientVO> selectContractReqClientList() throws SQLException {
		
		List<ClientVO> selectContractReqClientList = new ArrayList<ClientVO>();
		
		selectContractReqClientList = sqlSession.selectList("Dashboard-Mapper.selectContractReqClientList");
		
		
		return selectContractReqClientList;
	}
	
	@Override
	public List<ClientVO> selectContractExpClientList() throws SQLException {
		
		List<ClientVO> selectContractExpClientList = new ArrayList<ClientVO>();
		
		selectContractExpClientList = sqlSession.selectList("Dashboard-Mapper.selectContractExpClientList");
		
		return selectContractExpClientList;
	}
	
	@Override
	public List<ListCommand> selectToDayPayList() throws SQLException {
		
		List<ListCommand> selectToDayPayList = new ArrayList<ListCommand>();
		
		selectToDayPayList = sqlSession.selectList("Dashboard-Mapper.selectToDayPayList");
		
		return selectToDayPayList;
	}
	@Override
	public int getCtrReqNum(String wh_code) throws SQLException {
		int cnt = sqlSession.selectOne("Dashboard-Mapper.selectCtrReqNum", wh_code);
		return cnt;
	}
	
	@Override
	public List<WmsWidgetCommand> selectInReqList(String wh_code) throws SQLException {
		List<WmsWidgetCommand> result = sqlSession.selectList("Dashboard-Mapper.selectInReqList",wh_code);
		return result;
	}
	@Override
	public List<WmsWidgetCommand> selectOutReqList(String wh_code) throws SQLException {
		List<WmsWidgetCommand> result = sqlSession.selectList("Dashboard-Mapper.selectOutReqList",wh_code);
		return result;
	}
	@Override
	public List<WmsWidgetCommand> selectTodayInPlan(String wh_code) throws SQLException {
		List<WmsWidgetCommand> result = sqlSession.selectList("Dashboard-Mapper.selectTodayInPlan",wh_code);
		return result;
	}
	@Override
	public List<WmsWidgetCommand> selectTodayOutPlan(String wh_code) throws SQLException {
		List<WmsWidgetCommand> result = sqlSession.selectList("Dashboard-Mapper.selectTodayOutPlan",wh_code);
		return result;
	}
	
}

