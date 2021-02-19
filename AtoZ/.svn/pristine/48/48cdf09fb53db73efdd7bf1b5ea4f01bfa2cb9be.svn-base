package com.spring.AtoZ.strategy.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.strategy.dto.LocationVO;
import com.spring.AtoZ.strategy.dto.Priority;
import com.spring.AtoZ.strategy.dto.StrategyFloorCommand;
import com.spring.AtoZ.strategy.dto.StrategyItemCommand;
import com.spring.AtoZ.strategy.dto.StrategyRackCommand;
import com.spring.AtoZ.strategy.dto.StrategyStandardCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;
import com.spring.AtoZ.vo.OrderItemVO;

public class StrategyDAOImpl implements StrategyDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<LocationVO> selectFixedCandidateTest(int item_no, String wh_code) {
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("item_no", item_no);
		data.put("wh_code", wh_code);
		List<LocationVO> fixedList = sqlSession.selectList("Location-Mapper.selectFixedCandidateTest", data);
		return fixedList;
	}
	
	@Override
	public StrategyRackCommand selectRack(int rk_no) {
		StrategyRackCommand rack = sqlSession.selectOne("Location-Mapper.selectRack", rk_no);
		return rack;
	}
	
	@Override
	public List<LocationVO> seleceHashSameItem(Map<String, Object> data) {
//		data.put("item", item);
//		data.put("locationList", locationList);
		List<LocationVO> hasSameItem = sqlSession.selectList("Location-Mapper.seleceHashSameItem", data);
		return hasSameItem;
	}
	
	@Override
	public int selectFillVolume(String rack_code) {
		int fill = sqlSession.selectOne("Location-Mapper.selectFillVolume",rack_code);
		return fill;
	}
	@Override
	public int selectZoneVolume(String wz_no) {
		int volume = sqlSession.selectOne("Location-Mapper.selectZoneVolume",wz_no);
		return volume;
	}
	@Override
	public int selectFillArea(String wz_no) {
		int fill = sqlSession.selectOne("Location-Mapper.selectFillArea",wz_no);
		return fill;
	}
	
	@Override
	public List<LocationVO> selectFreeCandidateTest(StrategyItemCommand item, String wh_code) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("wh_code", wh_code);
		data.put("co_code", item.getCo_code());
		data.put("gr_code", "G"+item.getGr_code());
		data.put("type_code", item.getType_code());
		data.put("item_rank", "R"+item.getItem_rank());
		List<LocationVO> freeList = sqlSession.selectList("Location-Mapper.selectFreeCandidateTest", data);
		return freeList;
	}
	@Override
	public Priority selectPriority(String wh_code) {
		Priority pri = sqlSession.selectOne("Location-Mapper.selectPriority",wh_code);
		return pri;
	}
	@Override
	public List<StrategyFloorCommand> selectRackStd(int rk_no) {
		List<StrategyFloorCommand> rack_flr = sqlSession.selectList("Location-Mapper.selectRackStd",rk_no);
		return rack_flr;
	}
	@Override
	public StrategyItemCommand selectItemCommand(OrderItemVO orderItemVO) {
		StrategyItemCommand item = sqlSession.selectOne("Location-Mapper.selectItemCommand", orderItemVO);
		return item;
	}
	@Override
	public void insertRankForItem(OrderItemVO orderItemVO) {
		sqlSession.update("Location-Mapper.insertRankForItem", orderItemVO);
		
	}

	@Override
	public void insertTempStock(StrategyStockCommand stock) throws SQLException {
		sqlSession.update("Location-Mapper.insertTempStock", stock);
		
	}

	@Override
	public void updateOrderToPr(int ord_no) throws SQLException {
		sqlSession.update("Location-Mapper.updateOrderToPr", ord_no);
	}

	@Override
	public StrategyRackCommand selectRackByLoc(String wh_no) throws SQLException {
		StrategyRackCommand rack = sqlSession.selectOne("Location-Mapper.selectRackByLoc", wh_no);
		return rack;
	}

	@Override
	public StrategyItemCommand selectItemCommandByInvNo(String invNo) throws SQLException {
		StrategyItemCommand item = sqlSession.selectOne("Location-Mapper.selectItemCommandByInvNo", invNo);
		return item;
	}
}







