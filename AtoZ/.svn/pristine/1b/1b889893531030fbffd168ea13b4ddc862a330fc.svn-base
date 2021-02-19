package com.spring.AtoZ.member.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.PageMaker;
import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.member.dao.MemberDAO;
import com.spring.AtoZ.member.dto.DetailMemberCommand;
import com.spring.AtoZ.member.dto.UpdateMemberCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.WHPictureVO;

public class MemberServiceImpl implements MemberService {
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public Map<String, Object> getClientList(SearchMap sm) throws SQLException {
		List<ClientVO> clientlist = memberDAO.selectSearchClientList(sm);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(sm);
		pageMaker.setTotalCount(memberDAO.selectClientListCount(sm));
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("clientlist", clientlist);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public DetailMemberCommand getClient(String cl_code) throws SQLException {
		DetailMemberCommand client = memberDAO.selectClientBycl_code(cl_code);
		return client;
	}

	@Override
	public void modifyCompany(UpdateMemberCommand umc) throws SQLException {
		memberDAO.updateCompany(umc);
	}

	@Override
	public void modifyWarehouse(UpdateMemberCommand umc) throws SQLException {
		memberDAO.updateWarehouse(umc);
	}

	@Override
	public List<WHPictureVO> getWHImage(String cl_code) throws SQLException {
		List<WHPictureVO> pictureList = memberDAO.selectWHPicture(cl_code);
		return pictureList;
	}
	
}
