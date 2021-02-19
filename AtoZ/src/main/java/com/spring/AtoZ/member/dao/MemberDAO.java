package com.spring.AtoZ.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.member.dto.DetailMemberCommand;
import com.spring.AtoZ.member.dto.UpdateMemberCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.WHPictureVO;

public interface MemberDAO {

	List<ClientVO> selectSearchClientList(SearchMap sm) throws SQLException;
	
	int selectClientListCount(SearchMap sm) throws SQLException;
	
	DetailMemberCommand selectClientBycl_code(String cl_code) throws SQLException;
	
	void updateCompany(UpdateMemberCommand umc) throws SQLException;
	
	void updateWarehouse(UpdateMemberCommand umc) throws SQLException;
	
	List<WHPictureVO> selectWHPicture(String cl_code) throws SQLException;
	
}
