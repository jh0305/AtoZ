package com.spring.AtoZ.item.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.item.dto.ItemCommand;
import com.spring.AtoZ.item.dto.ItemDetailCommand;
import com.spring.AtoZ.item.dto.ItemRegistCommand;
import com.spring.AtoZ.item.dto.StandardCodeCheckCommand;
import com.spring.AtoZ.item.dto.UpdateStandardCommand;
import com.spring.AtoZ.vo.StandardVO;

public interface ItemService {
	Map<String, Object> getItemList(SearchMap sm) throws SQLException;
	
	ItemCommand getItemDetail(ItemDetailCommand idc) throws SQLException;
	
	String getStdCode(StandardCodeCheckCommand sccc) throws SQLException;
	
	void registStandard(StandardVO standard) throws SQLException;
	
	Map<String, Object> getStandardList(SearchMap sm) throws SQLException;
	
	StandardVO getStandard(int std_no) throws SQLException;
	
	void modifyStandard(UpdateStandardCommand usc) throws SQLException;
	
	void removeStandard(int std_no) throws SQLException;
	
	Map<String, Object> getCooperatorList(SearchMap sm) throws SQLException;
	
	void registItem(ItemRegistCommand irc) throws SQLException;
	
	void modifyItem(ItemRegistCommand irc) throws SQLException;
	
	void removeItem(int item_no) throws SQLException;
	
	String excelItemRegist(HttpSession session, String fileName) throws Exception;
	
	String excelStandardRegist(HttpSession session, String fileName) throws Exception;
}
