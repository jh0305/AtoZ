package com.spring.AtoZ.charge.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.charge.dto.ChargeCommand;
import com.spring.AtoZ.charge.dto.ConfirmCommand;
import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.vo.ClientVO;

public interface ChargeService {
	
	//등록
	void registCharge(Map<String, Object> map) throws SQLException;

	// 메인화면 
	Map<String, Object> getChargeMainChargeRequestList(SearchMap searchMap) throws SQLException;
	Map<String, Object> getChargeMainChargeResultList(SearchMap searchMap) throws SQLException;
	
	//검색
	List<ClientVO> getContractCO(Map<String, Object> map) throws SQLException; 
	List<ConfirmCommand> getConfirmForm(Map<String, Object> map) throws SQLException;
	List<ChargeCommand> getChargeDetailForm(Map<String, Object> map) throws SQLException;
	
}
