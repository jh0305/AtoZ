package com.spring.AtoZ.strategy.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.AtoZ.receive.service.ReceiveService;
import com.spring.AtoZ.strategy.service.StrategyService;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderItemVO;

@Controller
public class StrategyController {

	@Autowired
	private StrategyService strategyService; 

	@Autowired
	private ReceiveService receiveService; 
	
	@RequestMapping(value="strategy/strategy")
	public ModelAndView receiveList(ModelAndView mnv){
		String url = "strategy/searchItem.pop";
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="WH/strategy/matching",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Void> matchingLocation(HttpSession session, String ord_no) throws SQLException {
		ResponseEntity<Void> result = null;
		
		String wh_code = ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		
		String sts_code = receiveService.getOrderSts(ord_no);
		
		if(sts_code.equals("PR002")) {
			List<OrderItemVO> itemList = receiveService.getOrderItemList(ord_no);
			strategyService.matchItemListToLocation(itemList, wh_code);
			result = new ResponseEntity<>(HttpStatus.OK);
		} else {
			result = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	
}
