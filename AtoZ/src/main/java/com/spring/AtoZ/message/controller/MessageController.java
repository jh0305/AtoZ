package com.spring.AtoZ.message.controller;

import java.sql.SQLException;
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

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.message.dao.MessageDAO;
import com.spring.AtoZ.message.dto.MessageCommand;
import com.spring.AtoZ.message.dto.MessageDetailCommand;
import com.spring.AtoZ.message.dto.SendMessageCommand;
import com.spring.AtoZ.message.service.MessageService;
import com.spring.AtoZ.serviceUse.service.ServiceUseService;
import com.spring.AtoZ.vo.ClientVO;

@Controller
@RequestMapping("/WHCO/message")
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@Autowired
	private MessageDAO messageDAO;
	
	@ResponseBody
	@RequestMapping("/sendMessageList")
	public ResponseEntity<Map<String, Object>> sendMessageList(SearchMap sm, @RequestParam(defaultValue="")String keyword, @RequestParam(defaultValue="")String searchType, HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> result = null;
		String cl_code = ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		sm.put("cl_code", cl_code);
		sm.put("searchType", searchType);
		sm.put("keyword", keyword);
		sm.setUrl("WHCO/message/sendMessageList");
		Map<String, Object> dataMap = messageService.getSendMessageList(sm);
		result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/receiveMessageList")
	public ResponseEntity<Map<String, Object>> receiveMessageList(SearchMap sm, @RequestParam(defaultValue="")String keyword, @RequestParam(defaultValue="")String searchType, HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> result = null;
		String cl_code = ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		sm.put("cl_code", cl_code);
		sm.put("searchType", searchType);
		sm.put("keyword", keyword);
		sm.setUrl("WHCO/message/receiveMessageList");
		Map<String, Object> dataMap = messageService.getReceiveMessageList(sm);
		result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/receiveMessageDetail",method=RequestMethod.POST)
	public ResponseEntity<MessageCommand> receiveMessageDetail(int msg_no,HttpSession session) throws Exception {
		String cl_code = ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		MessageDetailCommand mdc = new MessageDetailCommand();
		mdc.setCl_code(cl_code);
		mdc.setMsg_no(msg_no);
		MessageCommand message = messageService.getReceiveMessageDetail(mdc);
		message.setContent(message.getContent().replace("<br>", "\n"));
		return new ResponseEntity<MessageCommand>(message, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/sendMessageDetail",method=RequestMethod.POST)
	public ResponseEntity<MessageCommand> sendMessageDetail(int msg_no,HttpSession session) throws Exception {
		String cl_code = ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		MessageDetailCommand mdc = new MessageDetailCommand();
		mdc.setCl_code(cl_code);
		mdc.setMsg_no(msg_no);
		MessageCommand message = messageService.getSendMessageDetail(mdc);
		message.setContent(message.getContent().replace("<br>", "\n"));
		return new ResponseEntity<MessageCommand>(message, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/chkRcRegno",method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> chkRcRegno(String cl_regno) throws Exception {
		String cl_name = messageService.getClientName(cl_regno);
		return new ResponseEntity<String>(cl_name,HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/sendMessage",method=RequestMethod.POST)
	public ResponseEntity<Void> sendMessage(HttpSession session, String cl_regno, String content) throws Exception {
		SendMessageCommand smc = new SendMessageCommand();
		String sd_code = ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		String rc_code = messageDAO.selectClientCodeByClRegno(cl_regno);
		content = content.replace("\n", "<br>");
		int msg_no = messageDAO.selectMsgSequenceNextValue();
		smc.setMsg_no(msg_no);
		smc.setSd_code(sd_code);
		smc.setRc_code(rc_code);
		smc.setContent(content);
		try {
			messageService.sendMessage(smc);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/removeReceiveMessage",method=RequestMethod.POST)
	public ResponseEntity<Void> removeReceiveMessage(int msg_no) throws Exception {
		try {
			messageService.deleteReceiveMessage(msg_no);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@ResponseBody
	@RequestMapping(value="/removeSendMessage",method=RequestMethod.POST)
	public ResponseEntity<Void> removeSendMessage(int msg_no) throws Exception {
		try {
			messageService.deleteSendMessage(msg_no);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
