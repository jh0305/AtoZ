package com.spring.AtoZ.picking.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.picking.dto.PickingCommand;
import com.spring.AtoZ.picking.dto.ReleaseItemCommand;
import com.spring.AtoZ.picking.dto.ReleaseListCommand;

public interface PickingService {
	void registPicking(String rls_no, String wh_code) throws SQLException;

	List<ReleaseItemCommand> getItemList(String rls_no) throws SQLException;

	Map<String,Object> getPickingList(String rls_no) throws SQLException;

	void modifyManager(Map<String, String>[] arr) throws SQLException;

	Map<String, Object> getReleaseList(String wh_code, SearchMap sm) throws SQLException;

	boolean getPickingCheck(String rls_no) throws SQLException;

	Map<String, Object> getMarkByCode(String inv_no) throws SQLException;

	void modifyPikInv(Map<String, String> pick) throws SQLException;

	Map<String, Object> getReleaseList(String wh_code) throws SQLException;
	
	
}
