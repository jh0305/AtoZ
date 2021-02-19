package com.spring.AtoZ.order.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.order.dao.OrderDAO;
import com.spring.AtoZ.order.dto.OrderDetailCommand;
import com.spring.AtoZ.order.dto.SearchCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderItemVO;
import com.spring.AtoZ.vo.OrderVO;

public class OrderServiceImpl implements OrderService {

	private OrderDAO orderDAO;

	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	@Override
	public void registOrder(Map<String, Object> map) throws SQLException {
		
		int ord_no = orderDAO.selectOrderSequenceNextValue();
		String co_code = (String) map.get("co_code");
		String wh_code = (String) map.get("wh_code");
		String req_ymd = (String) map.get("req_ymd");
		String deli_ymd = (String) map.get("deli_ymd");
		String ord_mngr = (String) map.get("ord_mngr");
		String sts_code = "PR001";

		OrderVO order = new OrderVO();
		
		order.setOrd_no(ord_no); // 0126 에러 터졌었음 vo타입문제 
		order.setCo_code(co_code);
		order.setWh_code(wh_code);
		order.setReq_ymd(req_ymd);
		order.setDeli_ymd(deli_ymd);
		order.setOrd_mngr(ord_mngr);
		order.setSts_code(sts_code);
		
		orderDAO.insertOrder(order);
		
		sts_code = "PR002";
		
		OrderItemVO[] orderItemArray = (OrderItemVO[]) map.get("orderItem");
		for (OrderItemVO orderItem : orderItemArray) {
			orderItem.setOrd_no(ord_no);
			orderItem.setSts_code(sts_code);
			orderItem.setCo_code(co_code);
			orderDAO.insertOrderItem(orderItem);
		}
	}

	@Override
	public List<ClientVO> getContractWH_List(Map<String, Object> map) throws SQLException {
		List<ClientVO> whList = orderDAO.selectContractWH(map);
		return whList;
	}

	@Override
	public List<SearchCommand> getItemSearchResList(Map<String, Object> map) throws SQLException {
		List<SearchCommand> getItemSearchResList = orderDAO.selectItemList(map);
		return getItemSearchResList;
	}

	@Override
	public List<OrderVO> getOrderList(OrderVO order) throws SQLException {
		List<OrderVO> getOrderList = orderDAO.selectOrderList(order);
		return getOrderList;
	}

	@Override
	public List<OrderVO> getOrderListWhere(OrderVO order) throws SQLException {
		List<OrderVO> getOrderListWhere = orderDAO.selectOrderListWhere(order);
		return getOrderListWhere;
	}

	@Override
	public int removeOrder(String ord_no) throws SQLException {
		int cnt = orderDAO.deleteOrder(ord_no);
		
		return cnt; 
	}

	@Override
	public Map<String, Object> getOrderDetail(Map<String, Object> map) throws SQLException {
		
		String ord_no = (String) map.get("ord_no");
		
		OrderVO order = orderDAO.selectOrderDetail(ord_no);
		List<OrderDetailCommand> orderDetailCommand = orderDAO.selectOrderItemDetail(map);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("order", order);
		dataMap.put("orderDetailCommand", orderDetailCommand);
		
		return dataMap;
	}

	@Override
	public void modify(Map<String,Object> map) throws SQLException {

		// 발주 테이블은 수정하고 발주 품목은 지우고 다시 인서트
		
		
		
	}

	
}
