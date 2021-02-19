package com.spring.AtoZ.payment.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.PageMaker;
import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.payment.dao.PaymentDAO;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.PaymentVO;

public class PaymentServiceImpl implements PaymentService {

	private PaymentDAO paymentDAO;

	public void setPaymentDAO(PaymentDAO paymentDAO) {
		this.paymentDAO = paymentDAO;
	}
	
	@Override
	public void goPayment(PaymentVO payment) throws SQLException {
		paymentDAO.updatePaymentSTS(payment);
	}

	@Override
	public Map<String, Object> getPaymentRequestForm(SearchMap searchMap) throws SQLException {
		List<PaymentVO> paymentRequestList = paymentDAO.selectPaymentRequestList(searchMap);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(searchMap);
		pageMaker.setTotalCount(paymentDAO.selectPaymentRequestListRowCnt(searchMap));		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dataList", paymentRequestList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getPaymentResultForm(SearchMap searchMap) throws SQLException {
		List<PaymentVO> paymentResultList = paymentDAO.selectPaymentResultList(searchMap);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(searchMap);
		pageMaker.setTotalCount(paymentDAO.selectPaymentResultListRowCnt(searchMap));		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dataList", paymentResultList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<ClientVO> getContractWH(Map<String, Object> map) throws SQLException {
		List<ClientVO> getContractWH = paymentDAO.selectContractWH(map);
		return getContractWH;
	}

	@Override
	public List<PaymentVO> getPaymentConfirmForm(Map<String, Object> map) throws SQLException {
		List<PaymentVO> getPaymentConfirmForm = paymentDAO.selectPaymentConfirmFormData(map);
		return getPaymentConfirmForm;
	}

	
}
