package com.spring.AtoZ.commoncode.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.commoncode.dao.CommonCodeDAO;
import com.spring.AtoZ.vo.CommonCodeVO;

public class CommonCodeServiceImpl implements CommonCodeService{
	private CommonCodeDAO commonCodeDAO;
	public void setCommonCodeDAO(CommonCodeDAO commonCodeDAO) {
		this.commonCodeDAO = commonCodeDAO;
	}
	@Override
	public List<CommonCodeVO> getCodeTypeList() throws SQLException {
		List<CommonCodeVO> typeList = commonCodeDAO.selectCodeTypeList();
		return typeList;
	}
	@Override
	public List<CommonCodeVO> getCodeListByType(String type) throws SQLException {
		List<CommonCodeVO> codeList = commonCodeDAO.selectCodeListByType(type);
		return codeList;
	}
	@Override
	public List<CommonCodeVO> getTypeListIsAct() throws SQLException {
		List<CommonCodeVO> codeList = commonCodeDAO.selectTypeListByAct();
		return codeList;
	}
	@Override
	public void modifyCodeType(CommonCodeVO[] object) throws SQLException {
		
		for(CommonCodeVO code : object) {
			
			commonCodeDAO.updateCodeType(code);
			
			if(code.getAct_yn()==0) {
				List<CommonCodeVO> codeList = commonCodeDAO.selectCodeListByType(code.getType_code());
				
				for(CommonCodeVO codeVO : codeList) {
					codeVO.setAct_yn(code.getAct_yn());
					commonCodeDAO.updateCode(codeVO);
				}
				
			}
			
			
		}
		
	}
	@Override
	public void modifyCode(CommonCodeVO[] list) throws SQLException {
	
		for(CommonCodeVO code : list) {
			commonCodeDAO.updateCode(code);
		}
		
	}
	@Override
	public void registCodeType(CommonCodeVO codeVO) throws SQLException {
		commonCodeDAO.insertCodeType(codeVO);
		
	}
	@Override
	public void registCode(CommonCodeVO codeVO) throws SQLException {

		commonCodeDAO.insertCode(codeVO);
	}
	
	@Override
	public boolean getDuplicationType(CommonCodeVO codeVO) throws SQLException {
		boolean dup = false;
		int cnt = commonCodeDAO.selectDuplicationType(codeVO);
		if(cnt > 0) dup = true;
		return dup;
	}
	
	@Override
	public boolean getDuplicationCode(CommonCodeVO codeVO) throws SQLException {
		boolean dup = false;
		int cnt = commonCodeDAO.selectDuplicationCode(codeVO);
		if(cnt > 0) dup = true;
		return dup;
	}
	@Override
	public boolean getDuplicationCodeList(CommonCodeVO[] list) throws SQLException {
		boolean dup = false;
		
		for(CommonCodeVO codeVO : list) {
			int cnt = commonCodeDAO.selectDuplicationCodeForList(codeVO);
			if(cnt > 0) {
				dup = true;
				break;
			}
		}
		return dup;
	}
	@Override
	public boolean getDuplicationTypeList(CommonCodeVO[] list) throws SQLException {
		boolean dup = false;
		
		for(CommonCodeVO codeVO : list) {
			int cnt = commonCodeDAO.selectDuplicationTypeForList(codeVO);
			if(cnt > 0) {
				dup = true;
				break;
			}
		}
		
		return dup;
	}
	
}
