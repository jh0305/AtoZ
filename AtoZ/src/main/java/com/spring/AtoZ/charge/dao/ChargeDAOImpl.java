package com.spring.AtoZ.charge.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.AtoZ.charge.dto.ChargeCommand;
import com.spring.AtoZ.charge.dto.ConfirmCommand;
import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderVO;
import com.spring.AtoZ.vo.PaymentVO;

public class ChargeDAOImpl implements ChargeDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertCharge(PaymentVO payment) throws SQLException {
		sqlSession.update("Charge-Mapper.insertCharge", payment);
	}

	@Override
	public List<ChargeCommand> selectChargeRequestList(SearchMap searchMap) throws SQLException {
		int offset = searchMap.getPageStartRowNum();
		int limit = searchMap.getPerPage();
		RowBounds rwb = new RowBounds(offset, limit);

		List<ChargeCommand> selectChargeRequestList = sqlSession.selectList("Charge-Mapper.selectChargeRequestList",
				searchMap.getSearch(), rwb);
		return selectChargeRequestList;
	}

	@Override
	public int selectSearchChargeRequestListRowCnt(SearchMap searchMap) throws SQLException {
		int cnt = sqlSession.selectOne("Charge-Mapper.selectSearchChargeRequestListRowCnt", searchMap.getSearch());
		return cnt;
	}

	@Override
	public List<PaymentVO> selectChargeResultList(SearchMap searchMap) throws SQLException {
		int offset = searchMap.getPageStartRowNum();
		int limit = searchMap.getPerPage();
		RowBounds rwb = new RowBounds(offset, limit);

		List<PaymentVO> selectChargeResultList = sqlSession.selectList("Charge-Mapper.selectChargeResultList", searchMap.getSearch(), rwb);
		return selectChargeResultList;

	}

	@Override
	public int selectSearchChargeResultListRowCnt(SearchMap searchMap) throws SQLException {
		int cnt = sqlSession.selectOne("Charge-Mapper.selectSearchChargeResultListRowCnt", searchMap.getSearch());
		return cnt;
	}

	@Override
	public List<ClientVO> selectContractCO(Map<String, Object> map) throws SQLException {
		List<ClientVO> selectContractCO = sqlSession.selectList("Charge-Mapper.selectContractCO", map);
		return selectContractCO;
	}

	@Override
	public List<ConfirmCommand> selectChargeConfirmFormData(Map<String, Object> map) throws SQLException {
		List<ConfirmCommand> chargeConfirmFormData = sqlSession.selectList("Charge-Mapper.selectChargeConfirmFormData",
				map);
		return chargeConfirmFormData;
	}
	
	@Override
	public int selectPaymentSequenceNextValue() throws SQLException {
		int paymentSequenceNextValue = sqlSession.selectOne("Charge-Mapper.selectPaymentSequenceNextValue");
		return paymentSequenceNextValue;
	}
	
	@Override
	public List<ChargeCommand> selectChargeDetailFormData(Map<String, Object> map) throws SQLException {
		List<ChargeCommand> selectChargeDetailFormData = sqlSession.selectList("Charge-Mapper.selectChargeDetailFormData",map);
		return selectChargeDetailFormData;
	}

	@Override
	public void updateOrderTablePay_no(Map<String, Object> map) throws SQLException {
		sqlSession.update("Charge-Mapper.updateOrderTablePay_no", map);
	}

	

	

}
