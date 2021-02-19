package com.spring.AtoZ.construct.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.vo.DongFloorVO;
import com.spring.AtoZ.vo.RackStandardVO;
import com.spring.AtoZ.vo.RackVO;
import com.spring.AtoZ.vo.ZoneVO;

public interface ConstructDAO {
	List<ZoneVO> selectConstruct(ZoneVO zone) throws SQLException;
	List<Map<String, Object>> selectHandlingType() throws SQLException;
	List<Map<String, Object>> selectStrategy() throws SQLException;
	List<Map<String, Object>> selectC2C(String whCode) throws SQLException;
	List<Map<String, Object>> selectProductGroup() throws SQLException;
	List<Map<String, Object>> selectProduct() throws SQLException;
	List<DongFloorVO> selectDongFloor(String whCode) throws SQLException;
	List<RackVO> selectRackList(String whCode) throws SQLException;
	void insertZone(ZoneVO zone) throws SQLException;
	void insertRackInZone(ZoneVO zone) throws SQLException;
	void insertRackInZone2(ZoneVO zone) throws SQLException;
	void insertRackInZoneUp(ZoneVO zone) throws SQLException;
	void insertRackInZoneUp2(ZoneVO zone) throws SQLException;
	void updateUpNoFromZone(ZoneVO zone) throws SQLException;
	void updateCoordinateFromZone(ZoneVO zone) throws SQLException;
	void updateTurninngZone(ZoneVO zone) throws SQLException;
	void deleteZone(ZoneVO zone) throws SQLException;
	int getRackSeq() throws SQLException;
	void insertRack(RackVO rack) throws SQLException;
	void insertRackStd(RackStandardVO rackStd) throws SQLException;
	void updateRack(RackVO rack) throws SQLException;
	void deleteRack(RackVO rack) throws SQLException;
	List<RackStandardVO> selectRackStd(int wzNo) throws SQLException;
	void updateRackStd(RackStandardVO rackStd) throws SQLException;
	Map<String, Object> selectZoneInfo(int wzNo) throws SQLException;
	Map<String, Object> selectRackInfo(int wzNo) throws SQLException;
	List<Map<String, Object>> selectItemInRack(String invLoc) throws SQLException;
	int selectRackFloorCount(int wzNo) throws SQLException;
	List<Map<String, Object>> selectItemInRack2(String invLoc) throws SQLException;
}
