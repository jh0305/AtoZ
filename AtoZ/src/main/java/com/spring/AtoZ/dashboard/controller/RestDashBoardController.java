package com.spring.AtoZ.dashboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.AtoZ.dashboard.dao.DashBoardDAO;
import com.spring.AtoZ.dashboard.dto.WmsWidgetCommand;
import com.spring.AtoZ.vo.ClientVO;

@RestController
public class RestDashBoardController {
	
	@Autowired
	public DashBoardDAO dao;

	// 금일 입고 예정 목록
	@RequestMapping("/wms/getInPlanList")
	public List<WmsWidgetCommand> getInPlanList(HttpSession session) throws Exception {
		ClientVO client = (ClientVO)session.getAttribute("loginUser");
		String wh_code = client.getCl_code();
		List<WmsWidgetCommand> result = dao.selectTodayInPlan(wh_code);
		return result;
	}
	// 금일 출고 예정 목록
	@RequestMapping("/wms/getOutPlanList")
	public List<WmsWidgetCommand> getOutPlanList(HttpSession session) throws Exception {
		ClientVO client = (ClientVO)session.getAttribute("loginUser");
		String wh_code = client.getCl_code();
		List<WmsWidgetCommand> result = dao.selectTodayOutPlan(wh_code);
		return result;
	}
	// 입고 승인 요청 목록
	@RequestMapping("/wms/getInReqList")
	public List<WmsWidgetCommand> getInReqList(HttpSession session) throws Exception {
		ClientVO client = (ClientVO)session.getAttribute("loginUser");
		String wh_code = client.getCl_code();
		List<WmsWidgetCommand> result = dao.selectInReqList(wh_code);
		return result;
	}
	// 출고 승인 요청 목록
	@RequestMapping("/wms/getOutReqList")
	public List<WmsWidgetCommand> getOutReqList(HttpSession session) throws Exception {
		ClientVO client = (ClientVO)session.getAttribute("loginUser");
		String wh_code = client.getCl_code();
		List<WmsWidgetCommand> result = dao.selectOutReqList(wh_code);
		return result;
	}
}
