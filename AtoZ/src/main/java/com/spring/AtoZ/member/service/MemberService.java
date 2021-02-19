package com.spring.AtoZ.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.member.dto.DetailMemberCommand;
import com.spring.AtoZ.member.dto.UpdateMemberCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.WHPictureVO;

public interface MemberService {
	Map<String, Object> getClientList(SearchMap sm) throws SQLException;
	
	DetailMemberCommand getClient(String cl_code) throws SQLException;
	
	void modifyCompany(UpdateMemberCommand umc) throws SQLException;
	
	void modifyWarehouse(UpdateMemberCommand umc) throws SQLException;
	
	List<WHPictureVO> getWHImage(String cl_code) throws SQLException;
}
