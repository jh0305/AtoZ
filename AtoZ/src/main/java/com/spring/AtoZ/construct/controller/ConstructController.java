package com.spring.AtoZ.construct.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.AtoZ.construct.service.ConstructService;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.RackStandardVO;
import com.spring.AtoZ.vo.RackVO;
import com.spring.AtoZ.vo.ZoneVO;

@Controller
@RequestMapping("WH/construct")
public class ConstructController {
	@Autowired
	ConstructService constructService;
	
	//구역 현황
	@RequestMapping("/constructList")
	public ModelAndView getConstruct(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		String url = "construct/constructList.frame";
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		
		dataMap = constructService.getConstructAttr(whCode);
		
		mav.setViewName(url);
		mav.addObject("dataMap", dataMap);
		
		return mav;
	}
	@RequestMapping(value="/zoneInfo", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> zoneInfo(int wzNo) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		
		dataMap = constructService.getZoneInfo(wzNo);
		if (dataMap.isEmpty()) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		}
		
		return entity;
	}
	@RequestMapping(value="/itemInRackInfo", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> itemInRackInfo(int wzNo) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		
		dataMap = constructService.getRackInfo(wzNo);
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	@RequestMapping(value="/itemInRackInfo2", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> itemInRackInfo2(String invLoc) throws Exception {
		ResponseEntity<List<Map<String, Object>>> entity = null;
		List<Map<String, Object>> dataList = null;
		
		dataList = constructService.getItemInRackList(invLoc);
		entity = new ResponseEntity<List<Map<String, Object>>>(dataList, HttpStatus.OK);
		
		return entity;
	}
	@RequestMapping(value="/itemInRackInfo3", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> itemInRackInfo3(String invLoc, String inv_no) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataList = null;
		
		dataList = constructService.getItemInRackList2(invLoc, inv_no);
		entity = new ResponseEntity<Map<String, Object>>(dataList, HttpStatus.OK);
		
		return entity;
	}
	//-구역 현황 
	//구역 설계 
	@RequestMapping("/constructForm")
	public ModelAndView constructForm(HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView();
		String url = "construct/constructForm.frame";
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		
		dataMap = constructService.getConstructAttr(whCode);
		
		mav.setViewName(url);
		mav.addObject("dataMap", dataMap);
		
		return mav;
	}
	
	@RequestMapping(value="/zoneList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<ZoneVO>> zoneList(HttpSession session, ZoneVO zone) throws Exception {
		ResponseEntity<List<ZoneVO>> entity = null;
		List<ZoneVO> zoneList = null;
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		zone.setWh_code(whCode);
		
		zoneList = constructService.getConstruct(zone);
		entity = new ResponseEntity<List<ZoneVO>>(zoneList, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/rackList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Object> rackList(HttpSession session) throws Exception {
		ResponseEntity<Object> entity = null;
		List<RackVO> rackList = null;
		String result = "empty";
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		
		rackList = constructService.getRackList(whCode);
		if (rackList == null) {
			entity = new ResponseEntity<Object>(result, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Object>(rackList, HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/strategyList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> strategyList(HttpSession session, String data) throws Exception {
		ResponseEntity<List<Map<String, Object>>> entity = null;
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		
		List<Map<String, Object>> dataList = constructService.getStrategy(whCode, data);
		if (dataList == null) {
			entity = new ResponseEntity<List<Map<String,Object>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			entity = new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	@ResponseBody
	public void regist(HttpSession session, ZoneVO zone) throws Exception {
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		zone.setWh_code(whCode);
		zone.setWz_area(Math.round((zone.getWz_lngth() * zone.getWz_width()) * 100) / 100.0);
		
		if (zone.getUp_loc() != null) { //구역 안에 랙 생성
			constructService.registUpZone(zone);
		} else { //구역에 포함되지 않는 랙 생성
			constructService.registZone(zone);
		}
	}
	
	@RequestMapping(value="/updateCoordinate", method=RequestMethod.POST)
	@ResponseBody
	public void modifyCoordinate(HttpSession session, ZoneVO zone) throws Exception {
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		zone.setWh_code(whCode);
		
		constructService.modifyCoordinateFromZone(zone);
	}
	
	@RequestMapping(value="/updateUpNoFromZone", method=RequestMethod.POST)
	@ResponseBody
	public void modifyUpNoFromZone(HttpSession session, ZoneVO zone) throws Exception {
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		zone.setWh_code(whCode);
		
		constructService.modifyUpNoFromZone(zone);
	}
	
	@RequestMapping(value="/updateTurnningZone", method=RequestMethod.POST)
	@ResponseBody
	public void modifyTurninngZone(HttpSession session, ZoneVO zone) throws Exception {
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		zone.setWh_code(whCode);
		
		constructService.modifyTurninngZone(zone);
	}
	
	@RequestMapping(value="/registRack", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> registRack(HttpSession session, RackVO rack) throws Exception {
		ResponseEntity<Integer> entity = null;
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		rack.setWh_code(whCode);
		
		int rkNo = 0;
		rkNo = constructService.registRack(rack);
		entity = new ResponseEntity<Integer>(rkNo, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/modifyRack", method=RequestMethod.POST)
	@ResponseBody
	public void modifyRack(HttpSession session, RackVO rack) throws Exception {
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		rack.setWh_code(whCode);
		
		constructService.modifyRack(rack);
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	@ResponseBody
	public void removeRack(HttpSession session, ZoneVO zone) throws Exception {
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String whCode = loginUser.getCl_code();
		zone.setWh_code(whCode);
		
		constructService.removeZone(zone);
	}
	
	@RequestMapping(value="/info", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<RackStandardVO>> getRackInfo(int rk_no) throws Exception {
		ResponseEntity<List<RackStandardVO>> entity = null;
		List<RackStandardVO> rackStdList = null;
		rackStdList = constructService.getRackInfoList(rk_no);
		
		if (rackStdList == null) {
			entity = new ResponseEntity<List<RackStandardVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			entity = new ResponseEntity<List<RackStandardVO>>(rackStdList, HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/modifyRackOption", method=RequestMethod.POST, produces="application/text; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> modifyRackOption(@RequestParam(value="no[]") List<Integer> no,
								@RequestParam(value="min[]") List<Integer> min,
								@RequestParam(value="max[]") List<Integer> max) throws Exception {
		ResponseEntity<String> entity = null;
		constructService.modifyRackStd(no, min, max);
		entity = new ResponseEntity<String>("수정 완료", HttpStatus.OK);
		
		return entity;
	}
}
