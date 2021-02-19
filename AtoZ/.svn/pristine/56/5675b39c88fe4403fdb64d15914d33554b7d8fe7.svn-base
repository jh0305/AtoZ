package com.spring.AtoZ.message.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.PageMaker;
import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.message.dao.MessageDAO;
import com.spring.AtoZ.message.dto.MessageCommand;
import com.spring.AtoZ.message.dto.MessageDetailCommand;
import com.spring.AtoZ.message.dto.SendMessageCommand;
import com.spring.AtoZ.vo.MessageVO;

public class MessageServiceImpl implements MessageService {
	private MessageDAO messageDAO;
	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
	@Override
	public Map<String, Object> getSendMessageList(SearchMap sm) throws SQLException {
		List<MessageVO> messageList = messageDAO.selectSendMessageListByClCode(sm);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(sm);
		pageMaker.setTotalCount(messageDAO.selectSendMessageListCountByClCode(sm));
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dataList", messageList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public Map<String, Object> getReceiveMessageList(SearchMap sm) throws SQLException {
		List<MessageVO> messageList = messageDAO.selectReceiveMessageListByClCode(sm);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(sm);
		pageMaker.setTotalCount(messageDAO.selectReceiveMessageListCountByClCode(sm));
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dataList", messageList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public MessageCommand getReceiveMessageDetail(MessageDetailCommand mdc) throws SQLException {
		MessageCommand message = messageDAO.selectReceiveMessageDetail(mdc);
		messageDAO.updateReadYn(mdc.getMsg_no());
		return message;
	}
	@Override
	public MessageCommand getSendMessageDetail(MessageDetailCommand mdc) throws SQLException {
		MessageCommand message = messageDAO.selectSendMessageDetail(mdc);
		return message;
	}
	@Override
	public String getClientName(String cl_regno) throws SQLException {
		String cl_name = messageDAO.selectClientNameByClRegno(cl_regno);
		return cl_name;
	}
	@Override
	public void sendMessage(SendMessageCommand smc) throws SQLException {
		messageDAO.insertMessage(smc);
	}
	@Override
	public void deleteReceiveMessage(int msg_no) throws SQLException {
		messageDAO.updateRcDelGB(msg_no);
	}
	@Override
	public void deleteSendMessage(int msg_no) throws SQLException {
		messageDAO.updateSdDelGB(msg_no);
	}
}
