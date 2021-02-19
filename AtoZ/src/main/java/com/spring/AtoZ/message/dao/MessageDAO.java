package com.spring.AtoZ.message.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.message.dto.MessageCommand;
import com.spring.AtoZ.message.dto.MessageDetailCommand;
import com.spring.AtoZ.message.dto.SendMessageCommand;
import com.spring.AtoZ.vo.MessageVO;

public interface MessageDAO {
	List<MessageVO> selectSendMessageListByClCode(SearchMap sm) throws SQLException;
	
	int selectSendMessageListCountByClCode(SearchMap sm) throws SQLException;
	
	List<MessageVO> selectReceiveMessageListByClCode(SearchMap sm) throws SQLException;
	
	int selectReceiveMessageListCountByClCode(SearchMap sm) throws SQLException;
	
	MessageCommand selectReceiveMessageDetail(MessageDetailCommand mdc) throws SQLException;
	
	MessageCommand selectSendMessageDetail(MessageDetailCommand mdc) throws SQLException;
	
	void updateReadYn(int msg_no) throws SQLException;
	
	String selectClientNameByClRegno(String cl_regno) throws SQLException;
	
	int selectMsgSequenceNextValue() throws SQLException;
	
	void insertMessage(SendMessageCommand smc) throws SQLException;
	
	String selectClientCodeByClRegno(String cl_regno) throws SQLException;
	
	void updateRcDelGB(int msg_no) throws SQLException;
	
	void updateSdDelGB(int msg_no) throws SQLException;
}
