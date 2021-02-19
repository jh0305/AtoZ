package com.spring.AtoZ.contract.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.swing.text.ZoneView;

import org.apache.ibatis.session.SqlSessionException;

import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.contract.dto.ContractDetailCommand;
import com.spring.AtoZ.contract.dto.ContractListCommand;
import com.spring.AtoZ.contract.dto.DetailAreaCommand;
import com.spring.AtoZ.contract.dto.RequestContractCommand;
import com.spring.AtoZ.contract.dto.WhsListCommand;
import com.spring.AtoZ.vo.C2CConctractVO;
import com.spring.AtoZ.vo.CRDetailVO;
import com.spring.AtoZ.vo.DetailMngVO;
import com.spring.AtoZ.vo.ZoneVO;

public interface ContractDAO {

	// 물류센터 목록(JY)
	public List<WhsListCommand> getWhsList(SearchMap sm) throws SQLException; 	
	
	// 물류센터 첨부파일명 
	public List<String> getWhsPictures(String wh_code) throws SQLException;
	
	// 기업이 물류센터에 첫번째로 계약 요청시 - C2CContract에 insert. 반환값 : 계약번호(CC_NO)
	public int registC2CContract(C2CConctractVO vo) throws SQLException;
	
	// 기업이 물류센터에 첫번째로 계약 요청시 - CR_DETAIL에 insert
	public void registCRDetail(CRDetailVO vo) throws SQLException;
	
	// 기업이 물류센터에 계약 요청시 
	public void insertDetailMng(DetailMngVO vo) throws SQLException;
	
	// 계약 현황 목록
	public List<ContractListCommand> selectContractList(SearchMap sm) throws SQLException;
	
	// 계약 상세 정보
	public List<ContractDetailCommand> selectContractDetail(Map<String, Object> map) throws SQLException;
	
	// 요청 계약 리스트
	public List<RequestContractCommand> selectReqContractList(SearchMap sm) throws SQLException;
	
	// -----------------0119
	// 취급유형가져오기
	public List<DetailAreaCommand> selectTypeList(String wh_code) throws SQLException;
	
	// 동 가져오기
	public List<String> selectDongList(Map<String, String> params) throws SQLException;
	
	// 층 가져오기
	public List<String> selectFloorList(Map<String, String> params) throws SQLException;
	
	// 구역 가져오기
	public List<String> selectZoneList(Map<String, String> params) throws SQLException;
	
	// 구역 면적 가져오기
	public List<ZoneVO> selectAreaList(Map<String, Object> params) throws SQLException;
	
	// 해당 특정 구역의 면적 가져오기
	public int selectThisArea(int wz_no) throws SQLException;
	
	// 물류센터 월사용료 등록(수정)
	public void updateMnthChrg(Map<String, Object> params) throws SQLException;
	
	// DETAIL_MNG 테이블 메모 수정
	public void updateDetailMng(Map<String, Object> params) throws SQLException;
	
	// C2C_CONTRACT 에 상태 수정 (계약승인, 반려, 파기)
	public void updateC2CContract(C2CConctractVO param) throws SQLException;
	
	// 계약 삭제 위한 WZ_NO 추출
	public List<Integer> selectWznoList(int cc_no) throws SQLException;
	
	// 계약 해지시 CR_DETAIL 삭제
	public void deleteCRDetail(int cc_no) throws SQLException;
	
	//계약 해지시 WH_ZONE에서 CO_CODE null 처리
	public void updateWhZone(int wz_no, String co_code) throws SQLException;
	
	// 계약 승인시 wh_zone에서 co_code에 co_code 입력
	public void updateCoCode(Map<String, Object> map) throws SQLException;
	
}
