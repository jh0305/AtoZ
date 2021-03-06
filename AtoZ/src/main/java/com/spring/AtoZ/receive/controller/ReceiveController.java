package com.spring.AtoZ.receive.controller;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.receive.service.ReceiveService;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderItemVO;

@Controller
public class ReceiveController {
	
	
	@RequestMapping(value="inwhs")
	public String registAfterReceive() {
		String url = "/receive/in_warehouse.frame";
		return url;
	}

	@Autowired
	private ReceiveService receiveService;
	
	@RequestMapping(value="WH/receive/receiveList")
	public ModelAndView receiveList(ModelAndView mnv){
		String url = "receive/receiveList.frame";
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="CO/receive/receiveList")
	public ModelAndView receiveList2(ModelAndView mnv){
		String url = "receive/receiveList.frame";
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("AL/receive/receivePlanList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getReceivePlanList(SearchMap sm, 	@RequestParam(defaultValue="sts_code") String orderBy,
																				@RequestParam(defaultValue="")String cl_name, @RequestParam(defaultValue="")String item_name,
																				@RequestParam(defaultValue="1900-01-01")String s_deli_ymd, @RequestParam(defaultValue="9999-12-31")String d_deli_ymd, 
																				@RequestParam(defaultValue="1900-01-01")String s_req_ymd, @RequestParam(defaultValue="9999-12-31")String d_req_ymd,
																				HttpSession session) throws Exception{
		ResponseEntity<Map<String,Object>> result = null;
		ClientVO loginUser = (ClientVO)session.getAttribute("loginUser");
		sm.put("cl_code", loginUser.getCl_code());
		sm.put("mode", session.getAttribute("mode"));
		sm.put("cl_name",cl_name);
		sm.put("item_name",item_name);
		sm.put("s_deli_ymd",s_deli_ymd.replaceAll("-", ""));
		sm.put("d_deli_ymd",d_deli_ymd.replaceAll("-", ""));
		sm.put("s_req_ymd",s_req_ymd.replaceAll("-", ""));
		sm.put("d_req_ymd",d_req_ymd.replaceAll("-", ""));
		sm.put("wh_code", loginUser.getCl_code());
		sm.put("orderBy", orderBy);
		sm.setUrl("AL/receive/receivePlanList");
		sm.setPerPage(13);
		
		Map<String,Object> dataMap = receiveService.getReceivePlanList(sm);
		result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return result;
	} 
	
	@RequestMapping("AL/receive/receiveComplList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getReceiveComplList(SearchMap sm, @RequestParam(defaultValue="in_ymd") String orderBy,
																				@RequestParam(defaultValue="")String cl_name, @RequestParam(defaultValue="")String item_name,
																				@RequestParam(defaultValue="1900-01-01")String s_deli_ymd, @RequestParam(defaultValue="9999-12-31")String d_deli_ymd, 
																				@RequestParam(defaultValue="1900-01-01")String s_in_ymd, @RequestParam(defaultValue="9999-12-31")String d_in_ymd, 
																				@RequestParam(defaultValue="1900-01-01")String s_req_ymd, @RequestParam(defaultValue="9999-12-31")String d_req_ymd,
																				HttpSession session) throws Exception{
		ResponseEntity<Map<String,Object>> result = null;
		ClientVO loginUser = (ClientVO)session.getAttribute("loginUser");
		sm.put("cl_code", loginUser.getCl_code());
		sm.put("mode", session.getAttribute("mode"));
		sm.put("cl_name",cl_name);
		sm.put("item_name",item_name);
		sm.put("s_deli_ymd",s_deli_ymd.replaceAll("-", ""));
		sm.put("d_deli_ymd",d_deli_ymd.replaceAll("-", ""));
		sm.put("s_req_ymd",s_req_ymd.replaceAll("-", ""));
		sm.put("d_req_ymd",d_req_ymd.replaceAll("-", ""));
		sm.put("s_in_ymd",s_in_ymd.replaceAll("-", ""));
		sm.put("d_in_ymd",d_in_ymd.replaceAll("-", ""));
		sm.put("wh_code", loginUser.getCl_code());
		sm.setUrl("AL/receive/receiveComplList");
		sm.put("orderBy", orderBy);
		sm.setPerPage(13);
		
		Map<String,Object> dataMap = receiveService.getReceiveComplList(sm);
		result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping("AL/receive/receiveReqList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getReceiveReqList(SearchMap sm, @RequestParam(defaultValue="sts_code") String orderBy,
																			@RequestParam(defaultValue="")String cl_name, @RequestParam(defaultValue="")String item_name,
																			@RequestParam(defaultValue="1900-01-01")String s_deli_ymd, @RequestParam(defaultValue="9999-12-31")String d_deli_ymd, 
																			@RequestParam(defaultValue="1900-01-01")String s_req_ymd, @RequestParam(defaultValue="9999-12-31")String d_req_ymd,
																			HttpSession session) throws Exception{
		ResponseEntity<Map<String,Object>> result = null;
		ClientVO loginUser = (ClientVO)session.getAttribute("loginUser");
		sm.put("cl_code", loginUser.getCl_code());
		sm.put("mode", session.getAttribute("mode"));
		sm.put("cl_name",cl_name);
		sm.put("item_name",item_name);
		sm.put("s_deli_ymd",s_deli_ymd.replaceAll("-", ""));
		sm.put("d_deli_ymd",d_deli_ymd.replaceAll("-", ""));
		sm.put("s_req_ymd",s_req_ymd.replaceAll("-", ""));
		sm.put("d_req_ymd",d_req_ymd.replaceAll("-", ""));
		sm.put("orderBy", orderBy);
		sm.setUrl("AL/receive/receiveReqList");
		sm.setPerPage(13);
		
		Map<String,Object> dataMap = receiveService.getReceiveReqList(sm);
		result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return result;
	} 
	
	@RequestMapping(value="WH/receive/modifyManager", method=RequestMethod.POST)
	public ResponseEntity<Void> registManager(@RequestBody Map<String,String>[] arr) throws Exception{
		ResponseEntity<Void> result = null;
		
		try {
			receiveService.modifyManager(arr);
			result = new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			result = new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	@RequestMapping("WH/receive/getEmployeeList")
	public ResponseEntity<Map<String, Object>> getEmployeeList(SearchMap sm, @RequestParam(defaultValue="") String keyword,
																			@RequestParam(defaultValue="default") String emp_job,
																			HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		ClientVO loginUser = (ClientVO)session.getAttribute("loginUser");
		sm.put("cl_code", loginUser.getCl_code());
		sm.put("keyword", keyword);
		sm.put("emp_job", emp_job);
		sm.setUrl("WH/receive/getEmployeeList");
		sm.setPerPage(10);
		
		Map<String, Object> dataMap = receiveService.getEmployeeList(sm);
		result = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping(value="WH/receive/decision", method=RequestMethod.POST)
	public ResponseEntity<Void> decision(String ord_nos, String decision) throws Exception{
		ResponseEntity<Void> result = null;
		
		String[] ord_nosArr = ord_nos.split(",");
		Map<String,Object> dataMap = new HashMap<>();
		dataMap.put("arr", ord_nosArr);
		dataMap.put("decision", decision);
		
		try {
			receiveService.decide(dataMap);
			result = new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			result = new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	@RequestMapping("AL/receive/getOrderItemList")
	public ResponseEntity<List<OrderItemVO>> getOrderItemList(String ord_no) throws Exception{
		ResponseEntity<List<OrderItemVO>> result = null;
		
		List<OrderItemVO> list = receiveService.getOrderItemList(ord_no);
		
		result = new ResponseEntity<List<OrderItemVO>>(list, HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping("WH/receive/todayList")
	public ModelAndView todayReceiveList(SearchMap sm, ModelAndView mnv, HttpSession session) throws Exception{
		String url = "receive/todayReceiveList.frame";
		
		String wh_code = ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		Map<String, Object> dataMap = receiveService.getTodayReceiveList(wh_code,sm);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("WH/receive/getTempStockList")
	public ResponseEntity<Map<String,Object>> getTempStockList(String ord_no) throws Exception{
		ResponseEntity<Map<String,Object>> result = null;
		
		Map<String,Object> list = receiveService.getTempStockList(ord_no);
		result = new ResponseEntity<Map<String,Object>>(list, HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping("WH/receive/getZoneByCoCode")
	public ResponseEntity<Map<String,Object>> getZoneByCode(String co_code, String cm_code, HttpSession session) throws Exception {
		ResponseEntity<Map<String,Object>> result = null;
		
		String wh_code = ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		
		Map<String,String> search = new HashMap<>();
		search.put("co_code", co_code);
		search.put("cm_code", cm_code);
		search.put("wh_code", wh_code);
		
		Map<String,Object> dataMap = receiveService.getZoneByCode(search);
		result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping(value="WH/receive/modifyInvLoc", method =RequestMethod.POST)
	public ResponseEntity<Void> modifyInvLoc(@RequestParam Map<String,String> data ) throws Exception{
		ResponseEntity<Void> result = null;
		
		receiveService.modifyInvLoc(data);
		
		result = new ResponseEntity<>(HttpStatus.OK);
		
		return result;
		
	}
		
}
















