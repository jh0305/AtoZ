package com.spring.AtoZ.strategy.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.vo.OrderItemVO;

public interface StrategyService {
	
	void matchItemListToLocation(List<OrderItemVO> itemList, String wh_code) throws SQLException;

	
}
