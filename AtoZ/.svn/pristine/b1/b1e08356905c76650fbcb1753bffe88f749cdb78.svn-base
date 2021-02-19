package com.spring.AtoZ.commoncode.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.vo.CommonCodeVO;

public interface CommonCodeDAO {

	List<CommonCodeVO> selectCodeTypeList() throws SQLException;
	
	List<CommonCodeVO> selectCodeListByType(String type) throws SQLException;

	List<CommonCodeVO> selectTypeListByAct() throws SQLException;

	void updateCodeType(CommonCodeVO object) throws SQLException;

	void updateCode(CommonCodeVO code) throws SQLException;

	void insertCodeType(CommonCodeVO codeVO) throws SQLException;

	void insertCode(CommonCodeVO codeVO) throws SQLException;

	int selectDuplicationType(CommonCodeVO codeVO) throws SQLException;

	int selectDuplicationCode(CommonCodeVO codeVO) throws SQLException;

	int selectDuplicationCodeForList(CommonCodeVO codeVO) throws SQLException;

	int selectDuplicationTypeForList(CommonCodeVO codeVO) throws SQLException;
	

}
