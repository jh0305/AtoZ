package com.spring.AtoZ.contract.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.contract.dto.SendContractCommand;
import com.spring.AtoZ.vo.C2CConctractVO;
import com.spring.AtoZ.vo.ZoneVO;

public interface ContractService {
	
	//물류센터 목록
	public Map<String, Object> getWhsList(SearchMap sm) throws SQLException;
	
	//물류센터 상세페이지 출력
	public Map<String, Object> getWhsDetail(String wh_code) throws SQLException;
	
	// 물류센터 면적 출력
	public List<ZoneVO> getWhsDetailArea(Map<String, Object> params) throws SQLException;
	
	//기업의 계약 요청 처리
	public void requestContract(SendContractCommand cmd) throws SQLException;
	
	// 계약 현황 보기
	public Map<String, Object> getContractList(SearchMap sm) throws SQLException;
	
	//요청 계약 목록
	public Map<String, Object> getReqContractList(SearchMap sm) throws SQLException;
	
	//계약 상세 페이지 처리
	public Map<String,Object> getContractDetail(Map<String, Object> map) throws SQLException;
	
	// 물류센터 계약 요청 처리
	public void sendContractFromWhs(Map<String, Object> map) throws SQLException;
	
	// 물류센터 계약 견적 수정 처리
	public void modifyContractFromWhs(Map<String, Object> map) throws SQLException;
	
	// 계약 파기 처리
	public void cancleContract(Map<String, Object> map) throws SQLException;
	
	// 물류센터 계약 처리
	public void manageContract(C2CConctractVO vo) throws SQLException;
	
}
