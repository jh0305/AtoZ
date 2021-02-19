package com.spring.AtoZ.commoncode.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.vo.CommonCodeVO;

public interface CommonCodeService {

	List<CommonCodeVO> getCodeTypeList() throws SQLException;

	List<CommonCodeVO> getCodeListByType(String type) throws SQLException;

	List<CommonCodeVO> getTypeListIsAct() throws SQLException;

	void modifyCodeType(CommonCodeVO[] object) throws SQLException;

	void modifyCode(CommonCodeVO[] list) throws SQLException;

	void registCodeType(CommonCodeVO codeVO) throws SQLException;

	void registCode(CommonCodeVO codeVO) throws SQLException;

	boolean getDuplicationType(CommonCodeVO codeVO) throws SQLException;

	boolean getDuplicationCode(CommonCodeVO codeVO) throws SQLException;

	boolean getDuplicationCodeList(CommonCodeVO[] list) throws SQLException;

	boolean getDuplicationTypeList(CommonCodeVO[] list) throws SQLException;

		

}
