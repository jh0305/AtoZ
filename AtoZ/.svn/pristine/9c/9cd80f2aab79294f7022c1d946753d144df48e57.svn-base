package com.spring.AtoZ.schedule;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.receive.dto.ReceiveCommand;
import com.spring.AtoZ.receive.service.ReceiveService;
import com.spring.AtoZ.strategy.service.StrategyService;
import com.spring.AtoZ.vo.OrderItemVO;

public class ReceiveStrategy {
	
	private StrategyService strategyService;
	public void setStrategyService(StrategyService strategyService) {
		this.strategyService = strategyService;
	}
	
	private ReceiveService receiveService;
	public void setReceiveService(ReceiveService receiveService) {
		this.receiveService = receiveService;
	}
	
	
	public void matchItemWithLocation() throws SQLException {
		List<ReceiveCommand> receiveList = receiveService.getTodayReceiveList();
		
		for(int i=0; i < receiveList.size();i++) {
			
			ReceiveCommand receive = receiveList.get(i);
			List<OrderItemVO> itemList = receiveService.getOrderItemList(Integer.toString(receive.getOrd_no()));
			
			strategyService.matchItemListToLocation(itemList, receive.getWh_code());
			
		}
		
		

	}
	
	
	
	
}
