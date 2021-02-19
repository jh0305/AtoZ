package com.spring.AtoZ.order.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.order.dto.SearchCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderVO;

public interface OrderService {
	
	//등록
	public void registOrder(Map<String, Object> map) throws SQLException;
	
	//조회
	public List<OrderVO> getOrderList(OrderVO order) throws SQLException;
	public List<OrderVO> getOrderListWhere(OrderVO order) throws SQLException;
	public List<ClientVO> getContractWH_List(Map<String, Object> map) throws SQLException;
	public List<SearchCommand> getItemSearchResList(Map<String, Object> map) throws SQLException;
	public Map<String, Object> getOrderDetail(Map<String, Object> map) throws SQLException;
	
	//수정
	public void modify(Map<String,Object> map) throws SQLException;
	
	//삭제 
	public int removeOrder(String ord_no) throws SQLException;

}
