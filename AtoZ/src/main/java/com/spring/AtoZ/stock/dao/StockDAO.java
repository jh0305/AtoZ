package com.spring.AtoZ.stock.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.stock.dto.StockCheckCommand;
import com.spring.AtoZ.stock.dto.StockDetailCommand;
import com.spring.AtoZ.stock.dto.StockListCommand;

public interface StockDAO {
	
	// 물류센터별 재고목록 전체 행 개수
	public int stockCount(SearchMap sm) throws SQLException;
	
	// 물류센터별 재고 목록
	public List<StockListCommand> selectStockList(SearchMap sm) throws SQLException;
	
	// 품목번호 별 재고 상세 목록
	public List<StockListCommand> selectListByItemNo(SearchMap sm) throws SQLException;
	
	// 품목번호 별 재고 상세 목록
	public int stockDetailCount(SearchMap sm) throws SQLException;
	
	// 기업 재고 목록
	public List<StockListCommand> selectCoStockList(SearchMap sm) throws SQLException;
	
	// 기업 재고 목록 전체 행 개수
	public int coStockCount(SearchMap sm) throws SQLException;
	
	// 기업 재고 상세 이력 행 개수
	public int coStockDetailCount(SearchMap sm) throws SQLException;
	
	// 기업 재고 상세 이력 목록
	public List<StockDetailCommand> selectCoDetailList(SearchMap sm) throws SQLException;
	
	// 물류센터 재고 실사 현황 
	public List<StockCheckCommand> selectStockCheckList(SearchMap sm) throws SQLException;
	
	// 물류센터 재고 실사 현황 개수
	public int stockCheckListCount(SearchMap sm) throws SQLException;
	
	// 실사 결과로 재고 분리할 경우
	public void insertInvFromCheck(int chk_no) throws SQLException;
	
	// 재고 분리 결과, 분리된 수량만큼 기존 재고 수량 수정
	public void updateInvQtyByDiv(int chk_no) throws SQLException;
	
	// 실사 결과, 수량만 변동시 
	public void updateInvQtyByCheck(int chk_no) throws SQLException;
	
	// 실사 결과, 위치만 변동시
	public void updateInvLocByCheck(int chk_no) throws SQLException;
	
	// 실사 결과를 재고 적용시 적용 여부 Y로 표시
	public void updateUpdYN(int chk_no) throws SQLException;
	
	// 물류센터 재고번호별 재고 상세 이력
	public List<StockDetailCommand> selectStockHisByInvNo(SearchMap sm) throws SQLException;
	
	// 물류센터 재고번호별 재고 상세 이력 개수
	public int countStockHisByInvNo(SearchMap sm) throws SQLException;
	
	// 실사 결과 기업으로 쪽지 보내기
	public void registMsgByStockCheck(String content, int chk_no) throws SQLException;
} 
 