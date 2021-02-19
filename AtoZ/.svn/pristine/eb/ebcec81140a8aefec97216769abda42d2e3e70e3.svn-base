package com.spring.AtoZ.stock.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.stock.dto.StockCheckCommand;
import com.spring.AtoZ.stock.dto.StockDetailCommand;
import com.spring.AtoZ.stock.dto.StockListCommand;

public class StockDAOImpl implements StockDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int stockCount(SearchMap sm) throws SQLException {
		List<StockListCommand> result = sqlSession.selectList("Stock-Mapper.selectStockList", sm.getSearch());
		List<Integer> cnt = new ArrayList<Integer>();
		if(result.size()>0) {
			for(int i = 0; i < result.size(); i++) {
				cnt.add(result.get(i).getRownum());
			}			
		}
		int max = cnt.isEmpty() ? 0 : Collections.max(cnt);
		return max;
	}
	@Override
	public int stockDetailCount(SearchMap sm) throws SQLException {
		List<StockListCommand> result = sqlSession.selectList("Stock-Mapper.selectListByItemNo", sm.getSearch());
		List<Integer> cnt = new ArrayList<Integer>();
		if(result.size()>0) {
			for(int i = 0; i < result.size(); i++) {
				cnt.add(result.get(i).getRownum());
			}			
		}
		int max = cnt.isEmpty() ? 0 : Collections.max(cnt);
		return max;
	}
	@Override
	public List<StockListCommand> selectListByItemNo(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<StockListCommand> stockList = sqlSession.selectList("Stock-Mapper.selectListByItemNo", sm.getSearch(), rowBounds);
		return stockList;
	}
	@Override
	public List<StockListCommand> selectStockList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<StockListCommand> stockList = sqlSession.selectList("Stock-Mapper.selectStockList", sm.getSearch(), rowBounds);
		return stockList;
	}
	@Override
	public List<StockListCommand> selectCoStockList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<StockListCommand> stockList = sqlSession.selectList("Stock-Mapper.selectCoStockList", sm.getSearch(), rowBounds);
		return stockList;
	}
	@Override
	public int coStockCount(SearchMap sm) throws SQLException {
		List<StockListCommand> result = sqlSession.selectList("Stock-Mapper.selectCoStockList", sm.getSearch());
		List<Integer> cnt = new ArrayList<Integer>();
		if(result.size()>0) {
			for(int i = 0; i < result.size(); i++) {
				cnt.add(result.get(i).getRownum());
			}			
		}
		int max = cnt.isEmpty() ? 0 : Collections.max(cnt);
		return max; 
	}
	@Override
	public int coStockDetailCount(SearchMap sm) throws SQLException {
		List<StockDetailCommand> result = sqlSession.selectList("Stock-Mapper.selectCoStockHistory", sm.getSearch());
		List<Integer> cnt = new ArrayList<Integer>();
		if(result.size()>0) {
			for(int i = 0; i < result.size(); i++) {
				cnt.add(result.get(i).getRownum());
			}			
		}
		int max = cnt.isEmpty() ? 0 : Collections.max(cnt);
		return max; 
	}
	@Override
	public List<StockDetailCommand> selectCoDetailList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<StockDetailCommand> stockList = sqlSession.selectList("Stock-Mapper.selectCoStockHistory", sm.getSearch(), rowBounds);
		return stockList;
	}
	@Override
	public int stockCheckListCount(SearchMap sm) throws SQLException {
		List<StockCheckCommand> result = sqlSession.selectList("Stock-Mapper.selectStockCheckList", sm.getSearch());
		List<Integer> cnt = new ArrayList<Integer>();
		if(result.size()>0) {
			for(int i = 0; i < result.size(); i++) {
				cnt.add(result.get(i).getRownum());
			}			
		}
		int max = cnt.isEmpty() ? 0 : Collections.max(cnt);
		return max; 
	}
	@Override
	public List<StockCheckCommand> selectStockCheckList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<StockCheckCommand> stockCheckList = sqlSession.selectList("Stock-Mapper.selectStockCheckList", sm.getSearch(), rowBounds);
		return stockCheckList;
	}
	@Override
	public void insertInvFromCheck(int chk_no) throws SQLException {
		sqlSession.insert("Stock-Mapper.insertInvFromCheck",chk_no);
	}
	@Override
	public void updateInvQtyByDiv(int chk_no) throws SQLException {
		sqlSession.update("Stock-Mapper.updateInvQtyByDiv",chk_no);
	}
	@Override
	public void updateInvQtyByCheck(int chk_no) throws SQLException {
		sqlSession.update("Stock-Mapper.updateInvQtyByCheck",chk_no);
	}
	@Override
	public void updateInvLocByCheck(int chk_no) throws SQLException {
		sqlSession.update("Stock-Mapper.updateInvLocByCheck",chk_no);
	}
	@Override
	public void updateUpdYN(int chk_no) throws SQLException {
		sqlSession.update("Stock-Mapper.updateUpdYN",chk_no);		
	}
	
	@Override
	public List<StockDetailCommand> selectStockHisByInvNo(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<StockDetailCommand> stockDetailList = sqlSession.selectList("Stock-Mapper.selectStockHisByInvNo", sm.getSearch(), rowBounds);
		return stockDetailList;
	}
	@Override
	public int countStockHisByInvNo(SearchMap sm) throws SQLException {
		List<StockDetailCommand> result = sqlSession.selectList("Stock-Mapper.selectStockHisByInvNo", sm.getSearch());
		List<Integer> cnt = new ArrayList<Integer>();
		if(result.size()>0) {
			for(int i = 0; i < result.size(); i++) {
				cnt.add(result.get(i).getRownum());
			}			
		}
		int max = cnt.isEmpty() ? 0 : Collections.max(cnt);
		return max; 
	}
	@Override
	public void registMsgByStockCheck(String content, int chk_no) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("content", content);
		params.put("chk_no", chk_no);
		sqlSession.insert("Stock-Mapper.registMsgByStockCheck",params);
	}
}
