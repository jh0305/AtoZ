package com.spring.AtoZ.picking.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.picking.dto.PickingCommand;
import com.spring.AtoZ.picking.dto.ReleaseItemCommand;
import com.spring.AtoZ.picking.dto.ReleaseListCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;

public class PickingDAOImpl implements PickingDAO{

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<StrategyStockCommand> selectInvByItem(ReleaseItemCommand item) throws SQLException {
		List<StrategyStockCommand> list = sqlSession.selectList("Picking-Mapper.selectInvByItem", item); 
		return list;
	}

	@Override
	public int selectPickedQty(StrategyStockCommand stock) throws SQLException {
		int cnt = sqlSession.selectOne("Picking-Mapper.selectPickedQty", stock);
		return cnt;
	}

	@Override
	public void insertPicking(PickingCommand picking) throws SQLException {
		sqlSession.update("Picking-Mapper.insertPicking",picking);
		
	}

	@Override
	public List<ReleaseItemCommand> selectItemList(String rls_no) throws SQLException {
		List<ReleaseItemCommand> list = sqlSession.selectList("Picking-Mapper.selectItemList", rls_no); 
		return list;
	}

	@Override
	public List<PickingCommand> selectPickingList(String rls_no) throws SQLException {
		List<PickingCommand> list = sqlSession.selectList("Picking-Mapper.selectPickingList", rls_no); 
		
		return list;
	}
	@Override
	public List<PickingCommand> selectPickingList2(String rls_no) throws SQLException {
		List<PickingCommand> list = sqlSession.selectList("Picking-Mapper.selectPickingList2", rls_no); 
		
		return list;
	}

	@Override
	public int updateManager(Map<String, String> map) throws SQLException {
		int cnt = sqlSession.update("Picking-Mapper.updateManager", map);
		return cnt;
	}

	@Override
	public List<ReleaseListCommand> selectReleaseList(String wh_code, SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rwb = new RowBounds(offset, limit);
		List<ReleaseListCommand> list = sqlSession.selectList("Picking-Mapper.selectReleaseList", wh_code,rwb);
		return list;
	}

	@Override
	public String selectInvLoc(String inv_no) throws SQLException {
		String invLoc = sqlSession.selectOne("Picking-Mapper.selectInvLoc", inv_no);
		return invLoc;
	}

	@Override
	public List<Map<String, String>> selectSameItemByInv(String inv_no) throws SQLException {
		List<Map<String, String>> list = sqlSession.selectList("Picking-Mapper.selectSameItemByInv", inv_no); 
		return list;
	}

	@Override
	public void updatePikInv(Map<String,String> pick) throws SQLException {
		sqlSession.update("Picking-Mapper.updatePikInv", pick);
		
	}

	@Override
	public int selectReleaseCount(String wh_code) throws SQLException {
		return sqlSession.selectOne("Picking-Mapper.selectReleaseCount", wh_code);
	}

	@Override
	public List<ReleaseListCommand> selectReleaseList(String wh_code) throws SQLException {
		List<ReleaseListCommand> list = sqlSession.selectList("Picking-Mapper.selectReleaseList", wh_code);
		return list;
	}


}
