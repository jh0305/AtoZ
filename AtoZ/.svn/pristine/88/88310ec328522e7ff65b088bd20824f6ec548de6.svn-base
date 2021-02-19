package com.spring.AtoZ.payment.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.PaymentVO;

public interface PaymentService {
	
	void goPayment(PaymentVO payment) throws SQLException;
	
	//메인
    Map<String, Object> getPaymentRequestForm(SearchMap searchMap) throws SQLException;
    Map<String, Object> getPaymentResultForm(SearchMap searchMap) throws SQLException;
    
    List<ClientVO> getContractWH(Map<String, Object> map) throws SQLException;
    List<PaymentVO> getPaymentConfirmForm(Map<String, Object> map) throws SQLException;
	
	

}
