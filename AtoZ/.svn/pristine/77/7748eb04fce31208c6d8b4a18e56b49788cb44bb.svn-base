package com.spring.AtoZ.serviceUse.service;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.exception.MissingPasswordException;
import com.spring.AtoZ.exception.NotFoundIdException;
import com.spring.AtoZ.member.dto.DetailMemberCommand;
import com.spring.AtoZ.serviceUse.dto.ApproveClient;
import com.spring.AtoZ.serviceUse.dto.BeforeFindPwdCommand;
import com.spring.AtoZ.serviceUse.dto.COClient;
import com.spring.AtoZ.serviceUse.dto.ChangePwdCommand;
import com.spring.AtoZ.vo.ClientVO;

public interface ServiceUseService {
	// 로그인
	void login(String id, String pwd, HttpSession session) throws SQLException, NotFoundIdException, MissingPasswordException;
	
	//회원정보
	ClientVO getClient(String id) throws SQLException;
	
	//기업회원등록
	void registCOClient(COClient COclient) throws SQLException;
	
	//물류창고 회원등록
	void registWHClient(ClientVO client) throws SQLException;
	
	//기업+물류창고 회원등록
	void registWHCOClient(ClientVO client) throws SQLException;
	
	Map<String, Object> getClientList(SearchMap sm) throws SQLException;
	
	DetailMemberCommand getUseClient(String cl_code) throws SQLException;
	
	// 고객 승인
	void approveClient(ApproveClient approveClient) throws SQLException;
	
	// 고객 거절
	void rejectClient(ApproveClient approveClient) throws SQLException;
	
	// 아이디 찾기
	String findClientId(String cl_regno) throws SQLException;
	
	ClientVO confirmInformation(BeforeFindPwdCommand clCommand,HttpServletRequest request) throws Exception;
	
	void modifyPwd(ChangePwdCommand cpc) throws SQLException;
}
