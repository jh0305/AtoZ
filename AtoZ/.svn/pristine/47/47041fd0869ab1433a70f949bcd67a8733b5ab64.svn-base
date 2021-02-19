package com.spring.AtoZ.release.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.release.dto.ApproveRelease;
import com.spring.AtoZ.release.dto.CompleteReleaseDetailCommand;
import com.spring.AtoZ.release.dto.CompleteReleaseListCommand;
import com.spring.AtoZ.release.dto.ExpectedRelease;
import com.spring.AtoZ.release.dto.InventoryList;
import com.spring.AtoZ.release.dto.RejectRelease;
import com.spring.AtoZ.release.dto.ReleaseRequestDetails;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.EmployeeVO;
import com.spring.AtoZ.vo.ReleaseVO;
import com.spring.AtoZ.vo.RlsItemVO;

public interface ReleaseDAO {
	
	//출고 예정 목록
	List<ExpectedRelease> selectSearchReleaseExpectedList(SearchMap sm) throws SQLException;
	
	//출고 예정 목록 count
	int selectSearchReleaseExpectedCount(SearchMap sm) throws SQLException;
	
	//출고 요청 상세조회
	List<ReleaseRequestDetails> selectReleaseRequest(Map<String, Object> rls_nos) throws SQLException;
	
	//출고 요청 승인
	void releaseRequestApprove(ApproveRelease approve) throws SQLException;
	
	//출고 거절 승인
	void releaseRequestReject(RejectRelease reject) throws SQLException;
		
	//직원 조회
	List<EmployeeVO> selectEmployeeList(SearchMap sm) throws SQLException;
	
	//직원 카운트
	int selectEmployeeListCount(SearchMap sm) throws SQLException;
	
	//물류센터 조회
	List<ClientVO> selectWareList(Map<String, Object> map) throws SQLException;
	
	List<CompleteReleaseListCommand> selectCompleteReleaseList(SearchMap sm) throws SQLException;
	
	int selectCompleteReleaseListCount(SearchMap sm) throws SQLException;
	
	List<CompleteReleaseDetailCommand> selectCompleteReleaseDetail(int rls_no) throws SQLException;
	
	List<InventoryList> searchReleaseItemList(Map<String, Object> map) throws SQLException;
	
	int rlsSeq() throws SQLException;
	
	// 출고 요청 등록
	void insertRlsItem(RlsItemVO rlsItem) throws SQLException;
	void insertRlease(ReleaseVO release) throws SQLException;
	
	// 출고 요청 삭제
	void deleteRelease(int rls_no) throws SQLException;
}
