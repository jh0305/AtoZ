package com.spring.AtoZ.dashboard.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.AtoZ.dashboard.dto.OrderScheduleCommand;
import com.spring.AtoZ.dashboard.dto.ReleaseScheduleCommand;
import com.spring.AtoZ.dashboard.service.DashBoardService;
import com.spring.AtoZ.vo.CalendarVO;
import com.spring.AtoZ.vo.ClientVO;

@Controller
public class DashBoardController {


	@Autowired
	private DashBoardService dashboardService;
	
	@RequestMapping("/CO/dashBoard/company")
	public ModelAndView companyMain(ModelAndView mnv,HttpServletRequest request) throws Exception{
		String url = "dashBoard/company.frame";
		String cl_code = ((ClientVO)request.getSession().getAttribute("loginUser")).getCl_code();
		Map<String, Object> dataMap = dashboardService.getDashboardData(cl_code);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/CO/dashboard/orderSchedule")
	@ResponseBody
	public ResponseEntity<List<CalendarVO>> orderSchedule(String cl_code) throws Exception {
		List<OrderScheduleCommand> ordercommand = dashboardService.getOrderSchedule(cl_code);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		List<CalendarVO> orderschedule = new ArrayList<CalendarVO>();
		for(OrderScheduleCommand order : ordercommand) {
			CalendarVO cal = new CalendarVO();
			cal.setTitle(order.getOrd_no() + " " + order.getItem_name());
			Date start = sdf.parse(order.getDeli_ymd());
			cal.setStart(start);
			orderschedule.add(cal);
		}
		return new ResponseEntity<List<CalendarVO>>(orderschedule, HttpStatus.OK);
	}
	
	@RequestMapping("/CO/dashboard/releaseSchedule")
	@ResponseBody
	public ResponseEntity<List<CalendarVO>> releaseSchedule(String cl_code) throws Exception {
		List<ReleaseScheduleCommand> releasecommand = dashboardService.getReleaseSchedule(cl_code);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		List<CalendarVO> releaseschedule = new ArrayList<CalendarVO>();
		for(ReleaseScheduleCommand release : releasecommand) {
			CalendarVO cal = new CalendarVO();
			cal.setTitle(release.getCl_name() + " → " + release.getDst_name());
			Date start = sdf.parse(release.getPlan_ymd());
			Date end = sdf.parse(release.getPlan_ymd());
			cal.setStart(start);
			cal.setEnd(end);
			releaseschedule.add(cal);
		}
		return new ResponseEntity<List<CalendarVO>>(releaseschedule, HttpStatus.OK);
	}
	
	@RequestMapping(value="/WH/dashboard/whs")
	public ModelAndView warehouse(ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "/dashBoard/wms.frame";
		ClientVO vo = (ClientVO)session.getAttribute("loginUser");
		String wh_code = vo.getCl_code();
		Map<String, Object> dataMap = dashboardService.forWhsDash(wh_code);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
}
