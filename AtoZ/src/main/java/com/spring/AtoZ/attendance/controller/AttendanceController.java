package com.spring.AtoZ.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.AtoZ.attendance.service.AttendanceService;

@Controller
@RequestMapping("")
public class AttendanceController {
	
	@Autowired
	AttendanceService attendanceService;
	
	@RequestMapping("/WH/attendance/commuteList")
	public String main() {
		String url = "attendance/commuteList";		
		
		return url;
	}

	@RequestMapping("/commuteList")
	public String commuteList() {
		String url = "attendance/commuteList";		
		
		return url;
	}
	
	@RequestMapping("/attendanceList")
	public String attendanceList() {
		String url = "attendance/attendanceList";				
		
		return url;
	}
	
	@RequestMapping("/regist")
	public String regist() {
		String url = "attendance/regist";				
		
		return url;
	}
	
}
