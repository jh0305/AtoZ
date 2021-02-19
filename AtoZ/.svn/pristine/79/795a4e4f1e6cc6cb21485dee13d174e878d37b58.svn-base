package com.spring.AtoZ.serviceUse.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.member.dto.DetailMemberCommand;
import com.spring.AtoZ.serviceUse.dto.ApproveClient;
import com.spring.AtoZ.serviceUse.dto.BeforeFindPwdCommand;
import com.spring.AtoZ.serviceUse.dto.COClient;
import com.spring.AtoZ.serviceUse.dto.ChangePwdCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.DongFloorVO;
import com.spring.AtoZ.vo.WHPictureVO;
import com.spring.AtoZ.vo.WHTypeVO;

public interface ServiceUseDAO {
	
	// 회원시퀀스
	int clientSeq() throws SQLException;

	// 회원정보 조회
	ClientVO selectClientById(String id) throws SQLException;
	
	// 기업회원등록
	void insertCOClient(COClient COclient) throws SQLException;
	
	// 물류센터 회원등록
	void insertWHClient(ClientVO client) throws SQLException;
	
	// 물류센터 회원등록
	void insertWHCOClient(ClientVO client) throws SQLException;
	
	// 물류센터 사진 등록
	void insertWHpicture(WHPictureVO whPicture) throws SQLException;
	
	// 물류센터 취급유형 등록
	void insertWHType(WHTypeVO whType) throws SQLException;
	
	// 물류센터 취급유형 등록
	void insertDongFloor(DongFloorVO dongFloor) throws SQLException;
	
	List<ClientVO> selectSearchClientList(SearchMap sm) throws SQLException;
	
	int selectClientListCount(SearchMap sm) throws SQLException;
	
	DetailMemberCommand selectClientBycl_code(String cl_code) throws SQLException;
	
	// 회원 이용신청 승인
	void approveClient(ApproveClient approveClient) throws SQLException;
	
	// 회원 이용신청 거절
	void rejectClient(ApproveClient approveClient) throws SQLException;
	
	// 회원 아이디 찾기
	String selectClientIdByClRegno(String cl_regno) throws SQLException;
	
	// 비밀번호찾기 전 정보확인
	ClientVO selectByIdRegnoEmail(BeforeFindPwdCommand clCommand) throws SQLException;
	
	// 비밀번호 변경
	void updatePwd(ChangePwdCommand cpc) throws SQLException;
}
