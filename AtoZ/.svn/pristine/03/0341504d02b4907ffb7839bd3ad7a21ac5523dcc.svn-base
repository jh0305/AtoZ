package com.spring.AtoZ.message.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.message.dto.MessageCommand;
import com.spring.AtoZ.message.dto.MessageDetailCommand;
import com.spring.AtoZ.message.dto.SendMessageCommand;

public interface MessageService {
	Map<String, Object> getSendMessageList(SearchMap sm) throws SQLException;
	
	Map<String, Object> getReceiveMessageList(SearchMap sm) throws SQLException;
	
	MessageCommand getReceiveMessageDetail(MessageDetailCommand mdc) throws SQLException;
	
	MessageCommand getSendMessageDetail(MessageDetailCommand mdc) throws SQLException;
	
	String getClientName(String cl_regno) throws SQLException;
	
	void sendMessage(SendMessageCommand smc) throws SQLException;
	
	void deleteReceiveMessage(int msg_no) throws SQLException;
	
	void deleteSendMessage(int msg_no) throws SQLException;
}
