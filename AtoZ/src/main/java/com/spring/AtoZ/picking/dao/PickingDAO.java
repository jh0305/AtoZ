package com.spring.AtoZ.picking.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.picking.dto.PickingCommand;
import com.spring.AtoZ.picking.dto.ReleaseItemCommand;
import com.spring.AtoZ.picking.dto.ReleaseListCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;

public interface PickingDAO {

	List<StrategyStockCommand> selectInvByItem(ReleaseItemCommand item) throws SQLException;

	int selectPickedQty(StrategyStockCommand stock) throws SQLException;

	void insertPicking(PickingCommand picking) throws SQLException;

	List<ReleaseItemCommand> selectItemList(String rls_no) throws SQLException;

	List<PickingCommand> selectPickingList(String rls_no) throws SQLException;
	List<PickingCommand> selectPickingList2(String rls_no) throws SQLException;

	int updateManager(Map<String, String> map) throws SQLException;

	List<ReleaseListCommand> selectReleaseList(String wh_code, SearchMap sm) throws SQLException;

	String selectInvLoc(String inv_no) throws SQLException;

	List<Map<String, String>> selectSameItemByInv(String inv_no) throws SQLException;

	void updatePikInv(Map<String, String> pick) throws SQLException;

	int selectReleaseCount(String wh_code) throws SQLException;

	List<ReleaseListCommand> selectReleaseList(String wh_code) throws SQLException;
	

}
