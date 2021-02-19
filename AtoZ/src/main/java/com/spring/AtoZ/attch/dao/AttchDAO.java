package com.spring.AtoZ.attch.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.vo.AttchVO;

public interface AttchDAO {
	public List<AttchVO> selectAttchByNtc_no(int ntc_no) throws SQLException;
	
	public AttchVO selectAttchByFile_no(int file_no) throws SQLException;
	
	// 파일 업로드
	public void insertAttch(AttchVO attch) throws SQLException;
	// 파일 삭제
	public void deleteAttach(int file_no) throws SQLException;
	// 파일 전부 삭제
	public void deleteAllAttach(int ntc_no)throws SQLException;
	
}
