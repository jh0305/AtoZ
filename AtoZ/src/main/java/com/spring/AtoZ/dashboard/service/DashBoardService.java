package com.spring.AtoZ.dashboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.dashboard.dto.OrderScheduleCommand;
import com.spring.AtoZ.dashboard.dto.ReleaseScheduleCommand;

public interface DashBoardService {
	
	Map<String, Object> forWhsDash(String wh_code) throws SQLException;
	
	//민규 0107 대시보드 위젯 넘버
	Map<String, Object> getWidgetNumbers() throws SQLException;
	
	//민규 0108 대시보드 리스트
	Map<String, Object> getListWidgetData() throws SQLException;
	
	Map<String, Object> getDashboardData(String cl_code) throws SQLException;
	
	List<OrderScheduleCommand> getOrderSchedule(String cl_code) throws SQLException;
	
	List<ReleaseScheduleCommand> getReleaseSchedule(String cl_code) throws SQLException;
}

