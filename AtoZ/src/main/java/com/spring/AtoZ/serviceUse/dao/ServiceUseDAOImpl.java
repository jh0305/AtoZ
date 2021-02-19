package com.spring.AtoZ.serviceUse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.member.dto.DetailMemberCommand;
import com.spring.AtoZ.serviceUse.dto.ApproveClient;
import com.spring.AtoZ.serviceUse.dto.BeforeFindPwdCommand;
import com.spring.AtoZ.serviceUse.dto.COClient;
import com.spring.AtoZ.serviceUse.dto.ChangePwdCommand;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.DongFloorVO;
import com.spring.AtoZ.vo.WHPictureVO;
import com.spring.AtoZ.vo.WHTypeVO;

public class ServiceUseDAOImpl implements ServiceUseDAO {
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	
	@Override
	public ClientVO selectClientById(String id) throws SQLException {
		ClientVO client = sqlSession.selectOne("ServiceUse-Mapper.selectClientById", id);
		return client;
	}

	@Override
	public void insertCOClient(COClient COclient) throws SQLException {
		sqlSession.update("ServiceUse-Mapper.insertCOClient", COclient);
		
	}
	
	@Override
	public void insertWHCOClient(ClientVO client) throws SQLException {
		sqlSession.update("ServiceUse-Mapper.insertWHCOClient", client);
		
	}

	@Override
	public int clientSeq() throws SQLException {
		int seq_num = sqlSession.selectOne("ServiceUse-Mapper.selectClientGetSeqValue");
		return seq_num;
	}


	@Override
	public void insertWHClient(ClientVO client) throws SQLException {
		sqlSession.update("ServiceUse-Mapper.insertWHClient", client);
		
	}
	@Override
	public void insertWHpicture(WHPictureVO whPicture) throws SQLException {
		sqlSession.update("ServiceUse-Mapper.insertWhPicture", whPicture);
		
	}

	@Override
	public void insertWHType(WHTypeVO whType) throws SQLException {
		sqlSession.update("ServiceUse-Mapper.insertWhType", whType);
	}
	
	@Override
	public void insertDongFloor(DongFloorVO dongFloor) throws SQLException {
		sqlSession.update("ServiceUse-Mapper.insertDongfloor", dongFloor);
		
	}
	
	@Override
	public List<ClientVO> selectSearchClientList(SearchMap sm) throws SQLException {
		int offset = sm.getPageStartRowNum();
		int limit = sm.getPerPage();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ClientVO> clientlist = sqlSession.selectList("ServiceUse-Mapper.selectSearchClientList",sm.getSearch(),rowBounds);
		return clientlist;
	}

	@Override
	public int selectClientListCount(SearchMap sm) throws SQLException {
		int cnt = 0;
		cnt = sqlSession.selectOne("ServiceUse-Mapper.selectSearchClientListCount", sm.getSearch());
		return cnt;
	}
	
	@Override
	public void approveClient(ApproveClient approveClient) throws SQLException {
		sqlSession.update("ServiceUse-Mapper.stscodeClient", approveClient);
		
	}

	@Override
	public void rejectClient(ApproveClient approveClient) throws SQLException {
		sqlSession.update("ServiceUse-Mapper.rejectStscodeClient", approveClient);
		
	}
	
	@Override
	public DetailMemberCommand selectClientBycl_code(String cl_code) throws SQLException {
		DetailMemberCommand client = sqlSession.selectOne("ServiceUse-Mapper.selectClientBycl_code", cl_code);
		return client;
	}


	@Override
	public String selectClientIdByClRegno(String cl_regno) throws SQLException {
		String cl_id = sqlSession.selectOne("ServiceUse-Mapper.selectClientIdByClRegno", cl_regno);
		return cl_id;
	}

	@Override
	public ClientVO selectByIdRegnoEmail(BeforeFindPwdCommand clCommand) throws SQLException {
		ClientVO cl = sqlSession.selectOne("ServiceUse-Mapper.selectByIdRegnoEmail", clCommand);
		return cl;
	}

	@Override
	public void updatePwd(ChangePwdCommand cpc) throws SQLException {
		sqlSession.update("ServiceUse-Mapper.updatePwd", cpc);
	}



	
}
