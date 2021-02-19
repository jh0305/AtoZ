package com.spring.AtoZ.strategy.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.strategy.dto.LocationVO;
import com.spring.AtoZ.strategy.dto.Priority;
import com.spring.AtoZ.strategy.dto.StrategyFloorCommand;
import com.spring.AtoZ.strategy.dto.StrategyItemCommand;
import com.spring.AtoZ.strategy.dto.StrategyRackCommand;
import com.spring.AtoZ.strategy.dto.StrategyStandardCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;
import com.spring.AtoZ.vo.OrderItemVO;

public interface StrategyDAO {
	List<LocationVO> selectFixedCandidateTest(int item_no, String wh_code) throws SQLException;

	StrategyRackCommand selectRack(int i) throws SQLException;

	List<LocationVO> seleceHashSameItem(Map<String, Object> data) throws SQLException;

	int selectFillVolume(String rack_code) throws SQLException;

	int selectZoneVolume(String wz_no) throws SQLException;

	int selectFillArea(String wz_no) throws SQLException;

	List<LocationVO> selectFreeCandidateTest(StrategyItemCommand item, String wh_code) throws SQLException;

	Priority selectPriority(String wh_code) throws SQLException;

	List<StrategyFloorCommand> selectRackStd(int i) throws SQLException;

	StrategyItemCommand selectItemCommand(OrderItemVO orderItemVO) throws SQLException;

	void insertRankForItem(OrderItemVO orderItemVO) throws SQLException;

	void insertTempStock(StrategyStockCommand stock) throws SQLException;

	void updateOrderToPr(int ord_no) throws SQLException;

	StrategyRackCommand selectRackByLoc(String wh_no) throws SQLException;

	StrategyItemCommand selectItemCommandByInvNo(String invNo) throws SQLException;
}
