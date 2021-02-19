package com.spring.AtoZ.payment.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.charge.dto.ConfirmCommand;
import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.PaymentVO;

public class PaymentDAOImpl implements PaymentDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<PaymentVO> selectPaymentRequestList(SearchMap searchMap) throws SQLException {
		int offset = searchMap.getPageStartRowNum();
		int limit = searchMap.getPerPage();
		RowBounds rwb = new RowBounds(offset, limit);

		List<PaymentVO> selectPaymentRequestList = sqlSession.selectList("Payment-Mapper.selectPaymentRequestList",
				searchMap.getSearch(), rwb);
		return selectPaymentRequestList;
	}

	@Override
	public int selectPaymentRequestListRowCnt(SearchMap searchMap) throws SQLException {
		int cnt = sqlSession.selectOne("Payment-Mapper.selectPaymentRequestListRowCnt", searchMap.getSearch());
		return cnt;
	}
	
	@Override
	public List<PaymentVO> selectPaymentResultList(SearchMap searchMap) throws SQLException {
		int offset = searchMap.getPageStartRowNum();
		int limit = searchMap.getPerPage();
		RowBounds rwb = new RowBounds(offset, limit);
		
		List<PaymentVO> selectPaymentResultList = sqlSession.selectList("Payment-Mapper.selectPaymentResultList",
				searchMap.getSearch(), rwb);
		return selectPaymentResultList;
	}
	
	@Override
	public int selectPaymentResultListRowCnt(SearchMap searchMap) throws SQLException {
		int cnt = sqlSession.selectOne("Payment-Mapper.selectPaymentResultListRowCnt", searchMap.getSearch());
		return cnt;
	}

	@Override
	public List<ClientVO> selectContractWH(Map<String, Object> map) {
		List<ClientVO> selectContractWH = sqlSession.selectList("Payment-Mapper.selectContractWH", map);
		return selectContractWH;
	}

	@Override
	public List<PaymentVO> selectPaymentConfirmFormData(Map<String, Object> map) throws SQLException {
		List<PaymentVO> selectPaymentConfirmFormData = sqlSession.selectList("Payment-Mapper.selectPaymentConfirmFormData",map);
		return selectPaymentConfirmFormData;
	}

	@Override
	public void updatePaymentSTS(PaymentVO payment) throws SQLException {
		sqlSession.update("Payment-Mapper.updatePaymentSTS",payment);
	}
}
