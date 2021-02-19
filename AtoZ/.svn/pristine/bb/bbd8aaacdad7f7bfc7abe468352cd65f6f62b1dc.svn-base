package com.spring.AtoZ.payment.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.PaymentVO;

public interface PaymentDAO {
	
	List<PaymentVO> selectPaymentRequestList(SearchMap searchMap) throws SQLException;
	int selectPaymentRequestListRowCnt(SearchMap searchMap) throws SQLException;
	List<PaymentVO> selectPaymentResultList(SearchMap searchMap) throws SQLException;
	int selectPaymentResultListRowCnt(SearchMap searchMap) throws SQLException;
	
	List<ClientVO> selectContractWH(Map<String, Object> map);
	List<PaymentVO> selectPaymentConfirmFormData(Map<String, Object> map) throws SQLException;
	
	void updatePaymentSTS(PaymentVO payment) throws SQLException;

}
