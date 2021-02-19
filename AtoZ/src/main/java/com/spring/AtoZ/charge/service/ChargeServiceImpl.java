package com.spring.AtoZ.charge.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.charge.dao.ChargeDAO;
import com.spring.AtoZ.charge.dto.ChargeCommand;
import com.spring.AtoZ.charge.dto.ConfirmCommand;
import com.spring.AtoZ.common.dto.PageMaker;
import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.PaymentVO;

public class ChargeServiceImpl implements ChargeService{
	
	private ChargeDAO chargeDAO;
	public void setChargeDAO(ChargeDAO chargeDAO) {
		this.chargeDAO = chargeDAO;
	}
	@Override
	public void registCharge(Map<String, Object> map) throws SQLException {
		PaymentVO payment = new PaymentVO();
		String[] orders =  (String[]) map.get("order");
		
		// 시퀀스 값 선점
		int pay_no = chargeDAO.selectPaymentSequenceNextValue();
		
		payment = (PaymentVO) map.get("payment");
		payment.setPay_no(pay_no);
		
		chargeDAO.insertCharge(payment);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		for(String order : orders) {
			dataMap.put("pay_no", pay_no);
			dataMap.put("ord_no", order);
			chargeDAO.updateOrderTablePay_no(dataMap);
		}
	}
	@Override
	public Map<String, Object> getChargeMainChargeRequestList(SearchMap searchMap) throws SQLException {
		List<ChargeCommand> chargeRequestList = chargeDAO.selectChargeRequestList(searchMap);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(searchMap);
		pageMaker.setTotalCount(chargeDAO.selectSearchChargeRequestListRowCnt(searchMap));		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dataList", chargeRequestList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public Map<String, Object> getChargeMainChargeResultList(SearchMap searchMap) throws SQLException {
		List<PaymentVO> chargeResultList = chargeDAO.selectChargeResultList(searchMap);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(searchMap);
		pageMaker.setTotalCount(chargeDAO.selectSearchChargeResultListRowCnt(searchMap));		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dataList", chargeResultList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public List<ClientVO> getContractCO(Map<String, Object> map) throws SQLException {
		List<ClientVO> getContractCO = chargeDAO.selectContractCO(map);
		return getContractCO;
	}
	@Override
	public List<ConfirmCommand> getConfirmForm(Map<String, Object> map) throws SQLException {
		List<ConfirmCommand> getConfirmForm = chargeDAO.selectChargeConfirmFormData(map);
		return getConfirmForm;
	}
	@Override
	public List<ChargeCommand> getChargeDetailForm(Map<String, Object> map) throws SQLException {
		List<ChargeCommand> getChargeDetailForm = chargeDAO.selectChargeDetailFormData(map);
		return getChargeDetailForm;
	}
	
}
