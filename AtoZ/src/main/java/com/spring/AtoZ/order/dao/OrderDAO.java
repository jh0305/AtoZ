package com.spring.AtoZ.order.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.order.dto.OrderDetailCommand;
import com.spring.AtoZ.order.dto.SearchCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderItemVO;
import com.spring.AtoZ.vo.OrderVO;

public interface OrderDAO {
	
	//발주
	public void insertOrder(OrderVO order) throws SQLException;
	public List<OrderVO> selectOrderList(OrderVO order) throws SQLException;
	public List<OrderVO> selectOrderListWhere(OrderVO order) throws SQLException;
	OrderVO selectOrderDetail(String ord_no) throws SQLException;
	List<OrderDetailCommand> selectOrderItemDetail(Map<String, Object> map) throws SQLException;
	public void updateOrderDetail(OrderVO order) throws SQLException;
	public int deleteOrder(String ord_no) throws SQLException;
	
	//발주팝업
	public List<ClientVO> selectContractWH(Map<String, Object> map) throws SQLException;
	
	//발주품목
	public void insertOrderItem(OrderItemVO orderItem) throws SQLException; //List<OrderItemVO> orderItemList
	public List<OrderItemVO> selectOrderItemList(String ord_no) throws SQLException;
	public void updateOrderItem(OrderItemVO orderItem) throws SQLException;
	public void deleteOrderItem(String oi_no) throws SQLException;
	
	//품목검색팝업
	public List<SearchCommand> selectItemList(Map<String, Object> map) throws SQLException;
	
	// in_order_seq.nextval 가져오기
	int selectOrderSequenceNextValue() throws SQLException;
	int selectOrderSequenceCurrValue() throws SQLException;
}
