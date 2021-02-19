package com.spring.AtoZ.construct.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.vo.DongFloorVO;
import com.spring.AtoZ.vo.RackStandardVO;
import com.spring.AtoZ.vo.RackVO;
import com.spring.AtoZ.vo.ZoneVO;

public class ConstructDAOImpl implements ConstructDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	@Override
	public List<ZoneVO> selectConstruct(ZoneVO zone) throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectConstruct", zone);
	}
	@Override
	public List<Map<String, Object>> selectHandlingType() throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectHandlingType");
	}
	@Override
	public List<Map<String, Object>> selectStrategy() throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectStrategy");
	}
	@Override
	public List<Map<String, Object>> selectC2C(String whCode) throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectC2C", whCode);
	}
	@Override
	public List<Map<String, Object>> selectProduct() throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectProduct");
	}
	@Override
	public List<Map<String, Object>> selectProductGroup() throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectProductGroup");
	}
	@Override
	public List<DongFloorVO> selectDongFloor(String whCode) throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectDongFloor", whCode);
	}
	@Override
	public List<RackVO> selectRackList(String whCode) throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectRackList", whCode);
	}
	@Override
	public void insertZone(ZoneVO zone) throws SQLException {
		sqlSession.update("Construct-Mapper.insertZone", zone);
	}
	@Override
	public void insertRackInZone(ZoneVO zone) throws SQLException {
		sqlSession.update("Construct-Mapper.insertRackInZone", zone);
	}
	@Override
	public void insertRackInZone2(ZoneVO zone) throws SQLException {
		sqlSession.update("Construct-Mapper.insertRackInZone2", zone);
	}
	@Override
	public void insertRackInZoneUp(ZoneVO zone) throws SQLException {
		sqlSession.update("Construct-Mapper.insertRackInZoneUp", zone);
	}
	@Override
	public void insertRackInZoneUp2(ZoneVO zone) throws SQLException {
		sqlSession.update("Construct-Mapper.insertRackInZoneUp2", zone);
	}
	@Override
	public void updateCoordinateFromZone(ZoneVO zone) throws SQLException {
		sqlSession.update("Construct-Mapper.updateCoordinateFromZone", zone);
	}
	@Override
	public void updateUpNoFromZone(ZoneVO zone) throws SQLException {
		sqlSession.update("Construct-Mapper.updateUpNoFromZone", zone);
	}
	@Override
	public void updateTurninngZone(ZoneVO zone) throws SQLException {
		sqlSession.update("Construct-Mapper.updateTurninngZone", zone);
	}
	@Override
	public void deleteZone(ZoneVO zone) throws SQLException {
		sqlSession.update("Construct-Mapper.deleteZone", zone);
	}
	@Override
	public int getRackSeq() throws SQLException {
		return sqlSession.selectOne("Construct-Mapper.getRackSeq");
	}
	@Override
	public void insertRack(RackVO rack) throws SQLException {
		sqlSession.update("Construct-Mapper.insertRack", rack);
	}
	@Override
	public void insertRackStd(RackStandardVO rackStd) throws SQLException {
		sqlSession.update("Construct-Mapper.insertRackStd", rackStd);
	}
	@Override
	public void updateRack(RackVO rack) throws SQLException {
		sqlSession.update("Construct-Mapper.updateRack", rack);
	}
	@Override
	public void deleteRack(RackVO rack) throws SQLException {
		sqlSession.update("Construct-Mapper.deleteRack", rack);
	}
	@Override
	public List<RackStandardVO> selectRackStd(int rkNo) throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectRackStd", rkNo);
	}
	@Override
	public void updateRackStd(RackStandardVO rackStd) throws SQLException {
		sqlSession.update("Construct-Mapper.updateRackStd", rackStd);
	}
	@Override
	public Map<String, Object> selectZoneInfo(int wzNo) throws SQLException {
		return sqlSession.selectOne("Construct-Mapper.selectZoneInfo", wzNo);
	}
	@Override
	public Map<String, Object> selectRackInfo(int wzNo) throws SQLException {
		return sqlSession.selectOne("Construct-Mapper.selectRackInfo", wzNo);
	}
	@Override
	public List<Map<String, Object>> selectItemInRack(String invLoc) throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectItemInRack", invLoc);
	}
	@Override
	public int selectRackFloorCount(int wzNo) throws SQLException {
		return sqlSession.selectOne("Construct-Mapper.selectRackFloorCount", wzNo);
	}
	@Override
	public List<Map<String, Object>> selectItemInRack2(String invLoc) throws SQLException {
		return sqlSession.selectList("Construct-Mapper.selectItemInRack2", invLoc);
	}
}	
