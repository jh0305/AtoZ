package com.spring.AtoZ.release.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.release.dto.ApproveRelease;
import com.spring.AtoZ.release.dto.CompleteReleaseDetailCommand;
import com.spring.AtoZ.release.dto.CompleteReleaseListCommand;
import com.spring.AtoZ.release.dto.ExpectedRelease;
import com.spring.AtoZ.release.dto.InventoryList;
import com.spring.AtoZ.release.dto.RejectRelease;
import com.spring.AtoZ.release.dto.ReleaseRequestDetails;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.EmployeeVO;
import com.spring.AtoZ.vo.ReleaseVO;
import com.spring.AtoZ.vo.RlsItemVO;

public class ReleaseDAOImpl implements ReleaseDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	@Override
	public List<ExpectedRelease> selectSearchReleaseExpectedList(SearchMap sm) throws SQLException {
		List<ExpectedRelease> list = new ArrayList<>();
		
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rwb = new RowBounds(offset, limit);
		list = sqlSession.selectList("Release-Mapper.selectSearchReleaseExpectedList",sm.getSearch(),rwb);
		
		return list; 
	}
	@Override
	public int selectSearchReleaseExpectedCount(SearchMap sm) throws SQLException {
		int cnt = sqlSession.selectOne("Release-Mapper.selectSearchReleaseExpectedCount", sm.getSearch());
		return cnt;
	}
	@Override
	public List<ReleaseRequestDetails> selectReleaseRequest(Map<String, Object> rls_nos) throws SQLException {
		List<ReleaseRequestDetails> rlsItem = sqlSession.selectList("Release-Mapper.selectReleaseRequest", rls_nos);
		return rlsItem;
	}
	@Override
	public List<EmployeeVO> selectEmployeeList(SearchMap sm) throws SQLException {
		List<EmployeeVO> list2 = new ArrayList<>();
		
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		
		RowBounds rwb = new RowBounds(offset, limit);
		list2 = sqlSession.selectList("Release-Mapper.selectEmployeeList",sm.getSearch(),rwb);
		return list2;
	}
	
	@Override
	public int selectEmployeeListCount(SearchMap sm) throws SQLException {
		int cnt = sqlSession.selectOne("Release-Mapper.selectEmployeeListCount", sm.getSearch());
		return cnt;
	}
	
	@Override
	public void releaseRequestApprove(ApproveRelease approve) throws SQLException {
		sqlSession.selectOne("Release-Mapper.insertApproveRelease", approve);
		
	}
	@Override
	public void releaseRequestReject(RejectRelease reject) throws SQLException {
		sqlSession.selectOne("Release-Mapper.insertRejectRelease", reject);
		
	}
	@Override
	public List<ClientVO> selectWareList(Map<String, Object> map) throws SQLException {
		List<ClientVO> whList = new ArrayList<ClientVO>();
		whList = sqlSession.selectList("Release-Mapper.selectWareList", map);
		return whList;
	}
	@Override
	public List<CompleteReleaseListCommand> selectCompleteReleaseList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<CompleteReleaseListCommand> releaselist = sqlSession.selectList("Release-Mapper.selectCompleteReleaseList", sm.getSearch(), rowBounds);
		return releaselist;
	}
	@Override
	public int selectCompleteReleaseListCount(SearchMap sm) throws SQLException {
		int cnt = 0;
		cnt = sqlSession.selectOne("Release-Mapper.selectCompleteReleaseListCount", sm.getSearch());
		return cnt;
	}
	@Override
	public List<CompleteReleaseDetailCommand> selectCompleteReleaseDetail(int rls_no) throws SQLException {
		List<CompleteReleaseDetailCommand> releaseDetailList = sqlSession.selectList("Release-Mapper.selectCompleteReleaseDetail", rls_no);
		return releaseDetailList;
	}
	@Override
	public List<InventoryList> searchReleaseItemList(Map<String, Object> map) throws SQLException {
		List<InventoryList> searchReleaseItemList = new ArrayList<InventoryList>();
		searchReleaseItemList = sqlSession.selectList("Release-Mapper.selectInventoryList", map);
		return searchReleaseItemList;
	}
	@Override
	public int rlsSeq() throws SQLException {
		int rlsSeq = sqlSession.selectOne("Release-Mapper.selectRlsSeq");
		return rlsSeq;
	}
	@Override
	public void insertRlsItem(RlsItemVO rlsItem) throws SQLException {
		sqlSession.update("Release-Mapper.insertRlsItem", rlsItem);
		
	}
	@Override
	public void insertRlease(ReleaseVO release) throws SQLException {
		sqlSession.update("Release-Mapper.insertRelease", release);
		
	}
	@Override
	public void deleteRelease(int rls_no) throws SQLException {
		sqlSession.update("Release-Mapper.deleteRelease", rls_no);
		
	}
	
	
	
	
	
}
