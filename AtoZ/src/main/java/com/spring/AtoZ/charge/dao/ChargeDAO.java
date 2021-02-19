package com.spring.AtoZ.charge.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.charge.dto.ChargeCommand;
import com.spring.AtoZ.charge.dto.ConfirmCommand;
import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.OrderVO;
import com.spring.AtoZ.vo.PaymentVO;

public interface ChargeDAO {
	
	void insertCharge(PaymentVO payment) throws SQLException;
	List<ChargeCommand> selectChargeRequestList(SearchMap searchMap) throws SQLException;
	int selectSearchChargeRequestListRowCnt(SearchMap searchMap) throws SQLException;
	List<PaymentVO> selectChargeResultList(SearchMap searchMap) throws SQLException;
	int selectSearchChargeResultListRowCnt(SearchMap searchMap) throws SQLException;
	List<ClientVO> selectContractCO(Map<String, Object> map) throws SQLException;
	List<ConfirmCommand> selectChargeConfirmFormData(Map<String, Object> map) throws SQLException;
	int selectPaymentSequenceNextValue() throws SQLException;
	List<ChargeCommand> selectChargeDetailFormData(Map<String, Object> map) throws SQLException;
	void updateOrderTablePay_no(Map<String, Object> map) throws SQLException;
}
