package com.spring.AtoZ.message.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.message.dto.MessageCommand;
import com.spring.AtoZ.message.dto.MessageDetailCommand;
import com.spring.AtoZ.message.dto.SendMessageCommand;
import com.spring.AtoZ.vo.MessageVO;

public class MessageDAOImpl implements MessageDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	@Override
	public List<MessageVO> selectSendMessageListByClCode(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MessageVO> messageList = sqlSession.selectList("Message-Mapper.selectSendMessageListByClCode", sm.getSearch(), rowBounds);
		return messageList;
	}
	@Override
	public int selectSendMessageListCountByClCode(SearchMap sm) throws SQLException {
		int cnt = 0;
		cnt = sqlSession.selectOne("Message-Mapper.selectSendMessageListCountByClCode", sm.getSearch());
		return cnt;
	}
	@Override
	public List<MessageVO> selectReceiveMessageListByClCode(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MessageVO> messageList = sqlSession.selectList("Message-Mapper.selectReceiveMessageListByClCode", sm.getSearch(), rowBounds);
		return messageList;
	}
	@Override
	public int selectReceiveMessageListCountByClCode(SearchMap sm) throws SQLException {
		int cnt = 0;
		cnt = sqlSession.selectOne("Message-Mapper.selectReceiveMessageListCountByClCode", sm.getSearch());
		return cnt;
	}
	@Override
	public MessageCommand selectReceiveMessageDetail(MessageDetailCommand mdc) throws SQLException {
		MessageCommand message = sqlSession.selectOne("Message-Mapper.selectReceiveMessageDetail", mdc);
		return message;
	}
	@Override
	public MessageCommand selectSendMessageDetail(MessageDetailCommand mdc) throws SQLException {
		MessageCommand message = sqlSession.selectOne("Message-Mapper.selectSendMessageDetail", mdc);
		return message;
	}
	@Override
	public void updateReadYn(int msg_no) throws SQLException {
		sqlSession.update("Message-Mapper.updateReadYn", msg_no);
	}
	@Override
	public String selectClientNameByClRegno(String cl_regno) throws SQLException {
		String cl_name = sqlSession.selectOne("Message-Mapper.selectClientNameByClRegno", cl_regno);
		return cl_name;
	}
	@Override
	public int selectMsgSequenceNextValue() throws SQLException {
		int cnt = 0;
		cnt = sqlSession.selectOne("Message-Mapper.selectMsgSequenceNextValue");
		return cnt;
	}
	@Override
	public void insertMessage(SendMessageCommand smc) throws SQLException {
		sqlSession.update("Message-Mapper.insertMessage", smc);
	}
	@Override
	public String selectClientCodeByClRegno(String cl_regno) throws SQLException {
		String cl_code = sqlSession.selectOne("Message-Mapper.selectClientCodeByClRegno", cl_regno);
		return cl_code;
	}
	@Override
	public void updateRcDelGB(int msg_no) throws SQLException {
		sqlSession.update("Message-Mapper.updateRcDelGB", msg_no);
	}
	@Override
	public void updateSdDelGB(int msg_no) throws SQLException {
		sqlSession.update("Message-Mapper.updateSdDelGB", msg_no);
		
	}
}		
