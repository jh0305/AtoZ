package com.spring.AtoZ.contract.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.contract.dto.ContractDetailCommand;
import com.spring.AtoZ.contract.dto.ContractListCommand;
import com.spring.AtoZ.contract.dto.DetailAreaCommand;
import com.spring.AtoZ.contract.dto.RequestContractCommand;
import com.spring.AtoZ.contract.dto.WhsListCommand;
import com.spring.AtoZ.vo.C2CConctractVO;
import com.spring.AtoZ.vo.CRDetailVO;
import com.spring.AtoZ.vo.DetailMngVO;
import com.spring.AtoZ.vo.ZoneVO;

public class ContractDAOImpl implements ContractDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	@Override
	public List<WhsListCommand> getWhsList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<WhsListCommand> whsList = sqlSession.selectList("Contract-Mapper.selectWhsList",sm.getSearch(),rowBounds);
		return whsList;
	}
	@Override
	public List<String> getWhsPictures(String wh_code) throws SQLException {
		List<String> getWhsPictures = sqlSession.selectList("Contract-Mapper.selectWhsPictures",wh_code);
		return getWhsPictures;
	}
	@Override
	public int registC2CContract(C2CConctractVO vo) throws SQLException {
		sqlSession.insert("Contract-Mapper.insertC2CContract",vo);
		int cc_no = vo.getCc_no();
		return cc_no;
	}
	@Override
	public void registCRDetail(CRDetailVO vo) throws SQLException {
		sqlSession.insert("Contract-Mapper.insertCRDetail",vo);		
	}
	
	@Override
	public List<ContractListCommand> selectContractList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ContractListCommand> result = sqlSession.selectList("Contract-Mapper.selectContractList",sm.getSearch(),rowBounds);
		return result;
	}
	@Override
	public List<ContractDetailCommand> selectContractDetail(Map<String, Object> map) throws SQLException {
		List<ContractDetailCommand> result = sqlSession.selectList("Contract-Mapper.selectContractDetail",map);
		return result;
	}
	
	@Override
	public void insertDetailMng(DetailMngVO vo) throws SQLException {
		sqlSession.insert("Contract-Mapper.insertDetailMng", vo);
	}
	
	@Override
	public List<RequestContractCommand> selectReqContractList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<RequestContractCommand> result = sqlSession.selectList("Contract-Mapper.selectReqContractList",sm.getSearch(),rowBounds);
		return result;
	}
		
	@Override
	public List<DetailAreaCommand> selectTypeList(String wh_code) throws SQLException {
		List<DetailAreaCommand> result = sqlSession.selectList("Contract-Mapper.selectTypeList", wh_code);
		return result;
	}
	@Override
	public List<String> selectDongList(Map<String, String> params) throws SQLException {
		List<String> result = sqlSession.selectList("Contract-Mapper.selectDongName",params);
		return result;
	}
	@Override
	public List<String> selectFloorList(Map<String, String> params) throws SQLException {
		List<String> result = sqlSession.selectList("Contract-Mapper.selectFloorName",params);
		return result;
	}
	@Override
	public List<String> selectZoneList(Map<String, String> params) throws SQLException {
		List<String> result = sqlSession.selectList("Contract-Mapper.selectFloorName",params);
		return result;
	}
	
	@Override
	public List<ZoneVO> selectAreaList(Map<String, Object> params) throws SQLException {
		List<ZoneVO> result = sqlSession.selectList("Contract-Mapper.selectArea",params);
		return result;
	}
	@Override
	public int selectThisArea(int wz_no) throws SQLException {
		return sqlSession.selectOne("Contract-Mapper.selectThisArea", wz_no);
	}
	@Override
	public void updateMnthChrg(Map<String, Object> params) throws SQLException {
		sqlSession.update("Contract-Mapper.updateMnthChrg", params);
	}
	@Override
	public void updateDetailMng(Map<String, Object> params) throws SQLException {
		sqlSession.update("Contract-Mapper.updateDetailMng", params);
	}
	@Override
	public void updateC2CContract(C2CConctractVO param) throws SQLException {
		sqlSession.update("Contract-Mapper.updateContract", param);
	}
	@Override
	public List<Integer> selectWznoList(int cc_no) throws SQLException {
		List<Integer> result = sqlSession.selectList("Contract-Mapper.selectWzNos", cc_no);
		return result;
	}
	@Override
	public void deleteCRDetail(int cc_no) throws SQLException {
		sqlSession.delete("Contract-Mapper.deleteCRDetail",cc_no);
	}
	@Override
	public void updateWhZone(int wz_no, String co_code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("wz_no", wz_no);
		map.put("co_code", co_code);
		sqlSession.update("Contract-Mapper.updateWHZone",map);
	}
	@Override
	public void updateCoCode(Map<String, Object> map) throws SQLException {
		sqlSession.update("Contract-Mapper.updateCoCode",map);
	}
	
}
