package com.spring.AtoZ.questions.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.AtoZ.questions.service.QuestionsService;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.PaymentVO;
import com.spring.AtoZ.vo.QuestionsVO;

@Controller
public class QuestionsController {
	
	@Autowired
	QuestionsService questionsService;
	
	@RequestMapping("/AL/questions/main")
	public String main() {
		String url = "questions/main";				
		return url;
	}
	
//	@RequestMapping(value="/AL/questions/regist", method=RequestMethod.POST)
//	@ResponseBody
//	public void regist(HttpSession session, @RequestParam(value="data[]") Map<String, Object> map ) throws Exception{
//		
//		ClientVO loginUser = (ClientVO) session.getAttribute("loginUser");
//		String cl_code = loginUser.getCl_code();
//		
//		try {
//			questionsService.regist(map);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//	}

}
