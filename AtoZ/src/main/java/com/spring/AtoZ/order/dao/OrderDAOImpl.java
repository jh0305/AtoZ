package com.spring.AtoZ.order.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.order.dto.OrderDetailCommand;
import com.spring.AtoZ.order.dto.SearchCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderItemVO;
import com.spring.AtoZ.vo.OrderVO;

public class OrderDAOImpl implements OrderDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertOrder(OrderVO order) throws SQLException {

		sqlSession.update("Order-Mapper.insertOrder", order);
	}

	@Override
	public List<OrderVO> selectOrderList(OrderVO order) throws SQLException {
		List<OrderVO> selectOrderList = new ArrayList<OrderVO>();
		selectOrderList = sqlSession.selectList("Order-Mapper.selectOrderList", order);
		return selectOrderList;
	}

	@Override
	public List<OrderVO> selectOrderListWhere(OrderVO order) throws SQLException {
		List<OrderVO> selectOrderListWhere = new ArrayList<OrderVO>();
		selectOrderListWhere = sqlSession.selectList("Order-Mapper.selectOrderListWhere", order);
		return selectOrderListWhere;
	}

	@Override
	public void updateOrderDetail(OrderVO order) throws SQLException {
		sqlSession.update("Order-Mapper.updateOrderDetail", order);
	}

	@Override
	public int deleteOrder(String ord_no) throws SQLException {
		int cnt = sqlSession.update("Order-Mapper.deleteOrder", ord_no);

		return cnt;
	}

	@Override
	public List<ClientVO> selectContractWH(Map<String, Object> map) throws SQLException {
		List<ClientVO> whList = new ArrayList<ClientVO>();
		whList = sqlSession.selectList("Order-Mapper.selectContractWH", map);
		return whList;
	}

	@Override
	public List<OrderItemVO> selectOrderItemList(String ord_no) throws SQLException {
		List<OrderItemVO> selectOrderItemList = new ArrayList<OrderItemVO>();
		selectOrderItemList = sqlSession.selectList("Order-Mapper.selectOrderItemList", ord_no);
		return selectOrderItemList;
	}

	@Override
	public List<SearchCommand> selectItemList(Map<String, Object> map) throws SQLException {
		List<SearchCommand> selectItemList = new ArrayList<SearchCommand>();
		selectItemList = sqlSession.selectList("Order-Mapper.selectItemList", map);
		return selectItemList;
	}

	@Override
	public int selectOrderSequenceNextValue() throws SQLException {
		int seq_num = 0;
		seq_num = sqlSession.selectOne("Order-Mapper.selectOrderSequenceNextValue");
		return seq_num;
	}

	@Override
	public int selectOrderSequenceCurrValue() throws SQLException {
		int seq_num = 0;
		seq_num = sqlSession.selectOne("Order-Mapper.selectOrderSequenceCurrValue");
		return seq_num;
	}

	@Override
	public OrderVO selectOrderDetail(String ord_no) throws SQLException {
		OrderVO order = sqlSession.selectOne("Order-Mapper.selectOrderDetail", ord_no);

		return order;
	}

	@Override
	public List<OrderDetailCommand> selectOrderItemDetail(Map<String, Object> map) throws SQLException {

		List<OrderDetailCommand> orderDetailCommand = sqlSession.selectList("Order-Mapper.selectOrderItemDetail", map);

		return orderDetailCommand;
	}

	@Override
	public void insertOrderItem(OrderItemVO orderItem) throws SQLException {
		sqlSession.update("Order-Mapper.insertOrderItem", orderItem);
	}

	@Override
	public void updateOrderItem(OrderItemVO orderItem) throws SQLException {
		sqlSession.update("Order-Mapper.updateOrderItem", orderItem);
	}

	@Override
	public void deleteOrderItem(String oi_no) throws SQLException {
		sqlSession.update("Order-Mapper.deleteOrderItem", oi_no);
	}

}
