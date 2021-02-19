package com.spring.AtoZ.release.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.release.dto.ApproveRelease;
import com.spring.AtoZ.release.dto.CompleteReleaseDetailCommand;
import com.spring.AtoZ.release.dto.InventoryList;
import com.spring.AtoZ.release.dto.RejectRelease;
import com.spring.AtoZ.vo.ClientVO;

public interface ReleaseService {
	Map<String, Object> getReleaseExpectedList(SearchMap sm) throws SQLException;
	
	Map<String, Object> getReleaseRequest(int rls_no) throws SQLException; 
	
	Map<String, Object> getEmployeeList(SearchMap sm) throws SQLException;
	
	void arroveRequestRelease(ApproveRelease approve) throws SQLException; 
	
	void rejectRequestRelease(RejectRelease reject) throws SQLException; 
	
	List<ClientVO> getContractWH_List(Map<String, Object> map) throws SQLException;
	Map<String, Object> getReleaseList(SearchMap sm) throws SQLException;
	
	List<CompleteReleaseDetailCommand> getCompleteReleaseDetail(int rls_no) throws SQLException;
	
	List<InventoryList> getReleaseItemList(Map<String, Object> map) throws SQLException;
	
	// 출고 요청 리스트 추가
	void registRelease(Map<String, Object> map) throws SQLException;
	
	// 출고 요청 삭제
	void removeRelese(int rls_no) throws SQLException;
}
