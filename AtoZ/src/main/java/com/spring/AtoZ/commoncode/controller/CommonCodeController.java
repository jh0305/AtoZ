package com.spring.AtoZ.commoncode.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.AtoZ.commoncode.service.CommonCodeService;
import com.spring.AtoZ.vo.CommonCodeVO;

@Controller
@RequestMapping("/SY/coCode")
public class CommonCodeController {
	
	@Autowired
	private CommonCodeService commonCodeService;
	
	@RequestMapping("/coCodeList")
	public ModelAndView coCodeList(ModelAndView mnv) throws Exception{
		String url = "commonCode/codeList.frame";
		
		List<CommonCodeVO> typeList = commonCodeService.getCodeTypeList();
		
		mnv.setViewName(url);
		mnv.addObject("typeList", typeList);
		
		return mnv;
	}
	
	@RequestMapping("/codeList")
	@ResponseBody
	public ResponseEntity<List<CommonCodeVO>> codeListByType(String type) throws Exception{
		ResponseEntity<List<CommonCodeVO>> result = null;
		
		try {
			List<CommonCodeVO> codeList = commonCodeService.getCodeListByType(type);
			result = new ResponseEntity<List<CommonCodeVO>>(codeList, HttpStatus.OK);
		} catch(SQLException e) {
			result = new ResponseEntity<List<CommonCodeVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	@RequestMapping("/searchCodeList")
	@ResponseBody
	public ResponseEntity<List<CommonCodeVO>> searchCodeLsit() throws Exception{
		ResponseEntity<List<CommonCodeVO>> result = null;
		
		try {
			List<CommonCodeVO> searchList = commonCodeService.getTypeListIsAct();
			result = new ResponseEntity<List<CommonCodeVO>>(searchList, HttpStatus.OK);
		} catch(SQLException e) {
			result = new ResponseEntity<List<CommonCodeVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	@RequestMapping(value="/registCodeType", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> registCodeType(CommonCodeVO codeVO) throws Exception{
		ResponseEntity<String> result = null;
			
		boolean dup = commonCodeService.getDuplicationType(codeVO);
		
		if(!dup) {
			try {
				commonCodeService.registCodeType(codeVO);
				result = new ResponseEntity<>(HttpStatus.OK);
			} catch (Exception e) {
				result = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			result = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/registCode", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> registCode(CommonCodeVO codeVO) throws Exception{
		ResponseEntity<String> result = null;
		
		boolean dup = commonCodeService.getDuplicationCode(codeVO);
		
		if(!dup) {
			try {
				commonCodeService.registCode(codeVO);
				result = new ResponseEntity<>(HttpStatus.OK);
			} catch (Exception e) {
				result = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		} else {
			result = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	
	@RequestMapping(value="/modifyCodeType", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> modifyCodeType(String codeList) throws Exception{
		ResponseEntity<String> result = null;
		
		ObjectMapper mapper = new ObjectMapper();
		CommonCodeVO[] list = mapper.readValue(codeList, CommonCodeVO[].class);
		
		boolean dup = commonCodeService.getDuplicationTypeList(list);
		
		if(!dup) {
			try {
				commonCodeService.modifyCodeType(list);
				result = new ResponseEntity<>(HttpStatus.OK);
			} catch (SQLException e) {
				result = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			result = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return result;
		
	}
	
	@RequestMapping(value="/modifyCode", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> modifyCode(String codeList) throws Exception{
		ResponseEntity<String> result = null;
		
		ObjectMapper mapper = new ObjectMapper();
		CommonCodeVO[] list = mapper.readValue(codeList, CommonCodeVO[].class);
		
		boolean dup = false;
		
		for(CommonCodeVO codeVO : list) {
			boolean dup2 = commonCodeService.getDuplicationCodeList(list);
			if(dup2) {
				dup = true;
				break;
			}
		}
		
		if(!dup) {
			try {
				commonCodeService.modifyCode(list);
				result = new ResponseEntity<>(HttpStatus.OK);
			} catch (SQLException e) {
				result = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		} else {
			result = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return result;
		
		
	}
	
}










