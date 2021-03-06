package com.spring.AtoZ.construct.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator;

import com.spring.AtoZ.vo.RackStandardVO;
import com.spring.AtoZ.vo.RackVO;
import com.spring.AtoZ.vo.ZoneVO;

public interface ConstructService {
	List<ZoneVO> getConstruct(ZoneVO zone) throws SQLException;
	Map<String, Object> getConstructAttr(String whCode) throws SQLException;
	List<RackVO> getRackList(String whCode) throws SQLException;
	List<Map<String, Object>> getStrategy(String whCode, String str) throws SQLException;
	void registZone(ZoneVO zone) throws SQLException;
	void registUpZone(ZoneVO zone) throws SQLException;
	void modifyCoordinateFromZone(ZoneVO zone) throws SQLException;
	void modifyUpNoFromZone(ZoneVO zone) throws SQLException;
	void modifyTurninngZone(ZoneVO zone) throws SQLException;
	void removeZone(ZoneVO zone) throws SQLException;
	
	int registRack(RackVO rack) throws SQLException;
	void modifyRack(RackVO rack) throws SQLException;
	void removeRack(RackVO rack) throws SQLException;
	List<RackStandardVO> getRackInfoList(int rkNo) throws SQLException;
	void modifyRackStd(List<Integer> no, List<Integer> min, List<Integer> max) throws SQLException;
	Map<String, Object> getZoneInfo(int wzNo) throws SQLException;
	Map<String, Object> getRackInfo(int wzNo) throws SQLException;
	List<Map<String, Object>> getItemInRackList(String invLoc) throws SQLException;
	Map<String, Object> getItemInRackList2(String invLoc, String inv_no) throws SQLException;
}
