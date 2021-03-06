package com.spring.AtoZ.receive.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.receive.dto.ReceiveCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;
import com.spring.AtoZ.vo.EmployeeVO;
import com.spring.AtoZ.vo.OrderItemVO;

public class ReceiveDAOImpl implements ReceiveDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<ReceiveCommand> selectSearchReceivePlanList(SearchMap sm) throws SQLException {
		List<ReceiveCommand> list2 = new ArrayList<>();
		
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rwb = new RowBounds(offset, limit);
		list2 = sqlSession.selectList("Receive-Mapper.selectSearchReceivePlanList",sm.getSearch(),rwb);
		
		return list2;
	}
	
	@Override
	public int selectReceiveListPlanCount(SearchMap sm) throws SQLException {
		int cnt = sqlSession.selectOne("Receive-Mapper.selectReceiveListPlanCount", sm.getSearch());
		return cnt;
	}
	
	@Override
	public List<ReceiveCommand> selectSearchReceiveComplList(SearchMap sm) throws SQLException {
		List<ReceiveCommand> list2 = new ArrayList<>();
		
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		
		RowBounds rwb = new RowBounds(offset, limit);
		list2 = sqlSession.selectList("Receive-Mapper.selectSearchReceiveComplList",sm.getSearch(),rwb);
		
		return list2;
	}
	
	@Override
	public int selectReceiveListComplCount(SearchMap sm) throws SQLException {
		int cnt = sqlSession.selectOne("Receive-Mapper.selectReceiveListComplCount", sm.getSearch());

		return cnt;
	}
	
	@Override
	public List<ReceiveCommand> selectSearchReceiveReqList(SearchMap sm) throws SQLException {
		List<ReceiveCommand> list2 = new ArrayList<>();
		
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		
		RowBounds rwb = new RowBounds(offset, limit);
		list2 = sqlSession.selectList("Receive-Mapper.selectSearchReceiveReqList",sm.getSearch(),rwb);
		
		return list2;
	}
	
	@Override
	public int selectReceiveListReqCount(SearchMap sm) throws SQLException {
		int cnt = sqlSession.selectOne("Receive-Mapper.selectReceiveListReqCount", sm.getSearch());
		
		return cnt;
	}

	@Override
	public int updateManager(Map<String, String> map) throws SQLException {
		int cnt = sqlSession.update("Receive-Mapper.updateManager", map);
		return cnt;
	}

	@Override
	public List<EmployeeVO> selectEmployeeList(SearchMap sm) throws SQLException {
		List<EmployeeVO> list2 = new ArrayList<>();
		
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		
		RowBounds rwb = new RowBounds(offset, limit);
		list2 = sqlSession.selectList("Receive-Mapper.selectEmployeeList",sm.getSearch(),rwb);
		return list2;
	}

	@Override
	public List<OrderItemVO> selectOrderItemList(String ord_no) throws SQLException {
		List<OrderItemVO> list = sqlSession.selectList("Receive-Mapper.selectOrderItemList", ord_no);
		return list;
	}

	@Override
	public int selectEmployeeListCount(SearchMap sm) throws SQLException {
		int cnt = sqlSession.selectOne("Receive-Mapper.selectEmployeeListCount", sm.getSearch());
		return cnt;
	}

	@Override
	public int updateDecision(Map<String, Object> dataMap) {
		int cnt = sqlSession.update("Receive-Mapper.updateDecision", dataMap);
		return cnt;
	}

	@Override
	public List<ReceiveCommand> selectTodayReceiveList() throws SQLException {
		List<ReceiveCommand> list = sqlSession.selectList("Receive-Mapper.selectTodayReceiveList");
		return list;
	}
	
	@Override
	public List<ReceiveCommand> selectTodayReceiveList(String wh_code, SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		
		RowBounds rwb = new RowBounds(offset, limit);
		List<ReceiveCommand> list = sqlSession.selectList("Receive-Mapper.selectTodayReceiveListByCode", wh_code, rwb);
		return list;
	}
	
	@Override
	public List<StrategyStockCommand> selectTempStockList(String ord_no) throws SQLException {
		List<StrategyStockCommand> list = sqlSession.selectList("Receive-Mapper.selectTempStockList",ord_no);
		return list;
	}

	@Override
	public String selectOrderSts(String ord_no) throws SQLException {
		String sts_code = sqlSession.selectOne("Receive-Mapper.selectOrderSts", ord_no);
		return sts_code;
	}
	@Override
	public List<StrategyStockCommand> selectTempItemList(String ord_no) throws SQLException {
		List<StrategyStockCommand> list = sqlSession.selectList("Receive-Mapper.selectTempItemList",ord_no);
		return list;
	}

	@Override
	public List<String> selectZoneByCode(Map<String, String> search) throws SQLException {
		return sqlSession.selectList("Receive-Mapper.selectZoneByCode", search);
	}

	@Override
	public void updateInvLoc(Map<String, String> data) throws SQLException {
		sqlSession.update("Receive-Mapper.updateInvLoc",data);
		
	}

	@Override
	public int selectTodayReceiveCount(String wh_code) throws SQLException {
		
		return sqlSession.selectOne("Receive-Mapper.selectTodayReceiveCount", wh_code);
	}
}





