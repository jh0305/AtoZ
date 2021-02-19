package com.spring.AtoZ.order.conroller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.AtoZ.order.dto.OrderCommand;
import com.spring.AtoZ.order.dto.SearchCommand;
import com.spring.AtoZ.order.service.OrderService;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderItemVO;
import com.spring.AtoZ.vo.OrderVO;

@Controller
@RequestMapping("/CO/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/regist")
	public String regist() {
		String url = "order/regist";				
		
		return url;
	}
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mav, HttpSession session) throws Exception{
		String url = "order/list";	
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String co_code = loginUser.getCl_code();
		
		OrderVO order = new OrderVO();
		order.setCo_code(co_code);
		
		try {
			List<OrderVO> orderList = orderService.getOrderList(order);
			mav.addObject("orderList", orderList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping("/getModifyForm")
	@ResponseBody
	public Map<String, Object> getModifyForm(ModelAndView mav, HttpSession session, String ord_no) throws Exception{
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String co_code = loginUser.getCl_code();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ord_no", ord_no);
		map.put("co_code", co_code);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap = orderService.getOrderDetail(map);
		
		return dataMap;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	@ResponseBody
	public void modify(@RequestBody Map<String,Object> map, HttpSession session) throws Exception{
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String co_code = loginUser.getCl_code();
		
		map.put("co_code", co_code);
		orderService.modify(map);
	}
	
	@RequestMapping(value="/removeOrder", method=RequestMethod.GET)
	@ResponseBody
	public int removeOrder(String arr) throws Exception{

		System.out.println(arr);
		
		String[] ord_noArray = arr.split(",");
		
		int cnt = 0;
		for(String ord_no : ord_noArray) {
			cnt += orderService.removeOrder(ord_no);
		}
		
		return cnt;
	}
	
	@RequestMapping(value="/getOrderListWhere", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<OrderVO>> getOrderListWhere(@RequestParam(defaultValue="") String req_ymd,
															@RequestParam(defaultValue="") String req_ymd_after,
															@RequestParam(defaultValue="") String ord_mngr,
															@RequestParam(defaultValue="") String deli_ymd,
															@RequestParam(defaultValue="") String deli_ymd_after,
															@RequestParam(defaultValue="") String wh_code,
															HttpSession session) throws Exception{
		
		ResponseEntity<List<OrderVO>> entity = null;
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String co_code = loginUser.getCl_code();

		OrderVO order = new OrderVO();
		
		order.setOrd_mngr(ord_mngr);
		order.setWh_code(wh_code);
		order.setCo_code(co_code);
		order.setReq_ymd(req_ymd);
		order.setReq_ymd_after(req_ymd_after);
		order.setDeli_ymd(deli_ymd);
		order.setDeli_ymd_after(deli_ymd_after);
		
		try {
			List<OrderVO> orderList = orderService.getOrderListWhere(order);
			entity = new ResponseEntity<List<OrderVO>>(orderList,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OrderVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/getContractWH", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<ClientVO>> getContractWH(String searchData, HttpSession session) throws Exception{
		
		ResponseEntity<List<ClientVO>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String coCode = loginUser.getCl_code();
		
		map.put("searchData", searchData);
		map.put("coCode", coCode);
		
		try {
			List<ClientVO> itemList = orderService.getContractWH_List(map);
			entity = new ResponseEntity<List<ClientVO>>(itemList,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ClientVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/getSearchItem", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<SearchCommand>> getSearchItem(String inputValue, HttpSession session) throws Exception{
		
		ResponseEntity<List<SearchCommand>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String loginUserCoCode = loginUser.getCl_code();
		
		map.put("inputValue", inputValue);
		map.put("loginUserCoCode", loginUserCoCode);
		
		try {
			List<SearchCommand> itemList = orderService.getItemSearchResList(map);
			entity = new ResponseEntity<List<SearchCommand>>(itemList,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<SearchCommand>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/registOrder")
	@ResponseBody
	public String inseartOrder(HttpSession session, HttpServletRequest request) throws Exception{
		
		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
		String co_code = loginUser.getCl_code();
		
		ObjectMapper mapper = new ObjectMapper();
		OrderCommand orderCommand = mapper.readValue(request.getReader(), OrderCommand.class);
		
		String wh_code = orderCommand.getWh_code();
		String req_ymd = orderCommand.getReq_ymd();
		String deli_ymd = orderCommand.getDeli_ymd();
		String ord_mngr = orderCommand.getOrd_mngr();
		OrderItemVO[] orderItem = orderCommand.getItemArray();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("wh_code", wh_code);
		map.put("req_ymd", req_ymd);
		map.put("deli_ymd", deli_ymd);
		map.put("ord_mngr", ord_mngr);
		map.put("orderItem", orderItem);
		map.put("co_code", co_code);
		
		try {
			orderService.registOrder(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "success";
	}
}
