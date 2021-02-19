package com.spring.AtoZ.contract.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.contract.service.ContractService;
import com.spring.AtoZ.vo.ClientVO;

@Controller
public class ContractController {
	
	@Autowired
	public ContractService service;
	
	
	@RequestMapping(value="/CO/contract/list")
	public ModelAndView getWhsList(ModelAndView mnv, SearchMap sm, 
			@RequestParam(defaultValue="") String searchType,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws SQLException{
		String url = "contract/wh_list.frame";
		ClientVO vo = (ClientVO)session.getAttribute("loginUser");
		String co_code = vo.getCl_code();
		sm.put("searchType", searchType);
		sm.put("keyword", keyword);
		sm.put("co_code",co_code);
		sm.setUrl("/CO/contract/list");
		
		mnv.addAllObjects(service.getWhsList(sm));
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/WH/contract/whs")
	public ModelAndView getWhsContractList(ModelAndView mnv, SearchMap sm, @RequestParam(defaultValue="") String searchType, 
				@RequestParam(defaultValue="") String keyword,
				@RequestParam(defaultValue="") String cm_code, HttpSession session) throws SQLException{
		
		String url = "contract/wh_contract.frame";		
		ClientVO vo = (ClientVO)session.getAttribute("loginUser");
		String wh_code = vo.getCl_code();
		sm.put("searchType", searchType);
		sm.put("keyword", keyword);
		sm.put("wh_code",wh_code);
		sm.put("cm_code", cm_code);
		sm.setUrl("/WH/contract/whs");
		
		mnv.addAllObjects(service.getContractList(sm)); 
		mnv.setViewName(url);		
		return mnv;
	}
	
	@RequestMapping(value="/CO/contract/com")
	public ModelAndView getComContractList(ModelAndView mnv,HttpSession session) throws SQLException {
		//String url = "contract/com_contractList.frame";
		String url = "contract/wh_contract.frame";
		ClientVO vo = (ClientVO)session.getAttribute("loginUser");
		String co_code = vo.getCl_code();
		mnv.setViewName(url);
		SearchMap map = new SearchMap();
		map.put("co_code", co_code);
		map.put("cm_code", "");
		mnv.addAllObjects(service.getContractList(map));
		return mnv;
	}

	
	
	
}
