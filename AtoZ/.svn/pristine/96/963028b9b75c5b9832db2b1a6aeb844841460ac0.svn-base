package com.spring.AtoZ.picking.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.AtoZ.common.dto.PageMaker;
import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.construct.dao.ConstructDAO;
import com.spring.AtoZ.picking.dao.PickingDAO;
import com.spring.AtoZ.picking.dto.PickingCommand;
import com.spring.AtoZ.picking.dto.ReleaseItemCommand;
import com.spring.AtoZ.picking.dto.ReleaseListCommand;
import com.spring.AtoZ.receive.dto.ReceiveCommand;
import com.spring.AtoZ.strategy.dto.StrategyStockCommand;
import com.spring.AtoZ.vo.DongFloorVO;

public class PickingServiceImpl implements PickingService{
	
	private PickingDAO pickingDAO;
	public void setPickingDAO(PickingDAO pickingDAO) {
		this.pickingDAO = pickingDAO;
	}
	private ConstructDAO constructDAO;
	public void setConstructDAO(ConstructDAO constructDAO) {
		this.constructDAO = constructDAO;
	}
	
	/*
	 * 피킹 테이블
	 * 대리키(pk),출고번호(fk), 재고번호(fk), 갯수, 상태
	 * 
	 */
	
	@Override
	public void registPicking(String rls_no, String wh_code) throws SQLException {
		List<ReleaseItemCommand> itemList = getItemList(rls_no);
			// ReleaseItemCommand에는 item_no, co_code, qty(출고할 갯수), rls_no(출고번호), wh_code
		for(int i=0; i<itemList.size(); i++) {
			
			/*
			 * 1. 출고해야하는 품목의 재고들을 찾는다.(입고일자순 (in_ymd);
			 * 2. 해당 재고의 위치와 갯수를 가져온다.
			 * 3. 해당 재고 번호로 등록된 피킹 대기 갯수를 가져온다.
			 * 3. 출고해야하는 품목의 갯수와 재고-피킹 대기의 갯수를 비교한다.
			 * 4. 재고-피킹 >= 출고 이면 해당 위치와 갯수로 반환한다.
			 * 5. 재고-피킹 < 출고 이면 해당 위치와 재고-피킹 수로 반환하고, 다시 반복한다.
			 * 6. 반환할 때마다 인서트한다.
			 */ 
			
			ReleaseItemCommand item = itemList.get(i); // 출고해야 할 품목중 하나
			
			int totalQty = item.getQty(); // 해당 품목의 출고해야 할 갯수
			
			List<StrategyStockCommand> stockList = pickingDAO.selectInvByItem(item); // 해당 품목의 재고들을 찾는다. ( 재고번호, 재고위치, 갯수)
			
			
			for(int j=0; j< stockList.size();j++) {
				if(totalQty ==0) { // 출고할 갯수가 전부 할당 되어 0개가 되었을 경우 다음 품목으로
					break;
				}
				
				StrategyStockCommand stock = stockList.get(j);
				
				int pickedQty = pickingDAO.selectPickedQty(stock); // 해당 재고 중 피킹 예정인 갯수 가져온다.
				
				int pickable = stock.getInv_qty() - pickedQty;
				
				if(pickable > 0) { // 피킹할 수 있는 재고가 있는 경우 
					PickingCommand picking = new PickingCommand(); // 피킹테이블에 인서트 할 vo
					if(pickable < totalQty) { // 출고 할 수 있는 재고보다 출고해야 하는 갯수가 많을 경우
						picking.setPik_qty(pickable); // 할 수 있는 만큼 할당
						totalQty -= pickable; // 할당한 만큼 출고할 갯수를 차감 
					} else { // 출고 할 수 있는 재고가 출고해야 하는 갯수보다 작거나 같을 경우 
						picking.setPik_qty(totalQty); // 출고 할 갯수를 전부 할당.
						totalQty = 0; // 전부 출고 할당 했으니 더이상 출고 할 갯수는 남지 않는다.
					}
					picking.setInv_no(stock.getInv_no());
					picking.setRls_no(item.getRls_no());
					pickingDAO.insertPicking(picking); // 해당 정보로 피킹데이터 생성
				}
				
			}
			
		}
		
	}

	@Override
	public List<ReleaseItemCommand> getItemList(String rls_no) throws SQLException {
		List<ReleaseItemCommand> itemList = pickingDAO.selectItemList(rls_no);
		return itemList;
	}

	@Override
	public Map<String,Object> getPickingList(String rls_no) throws SQLException {
		List<PickingCommand> list = pickingDAO.selectPickingList(rls_no);
		String sts_code = "pick";
		if(list == null || list.size() == 0) {
			list = pickingDAO.selectPickingList2(rls_no);
			sts_code = "item";
		}
		
		Map<String,Object> dataMap = new HashMap<>();
		dataMap.put("list", list);
		dataMap.put("sts", sts_code);
		return dataMap;
		
	}

	@Override
	public void modifyManager(Map<String, String>[] arr) throws SQLException {
		int len = arr.length;
		int result = 0;
		for(Map<String, String> map : arr) {
			result += pickingDAO.updateManager(map);
		} 
		if(result != len) {
			throw new SQLException();
		}
		
	}

	@Override
	public Map<String, Object> getReleaseList(String wh_code,SearchMap sm) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(sm);
		pageMaker.setTotalCount(pickingDAO.selectReleaseCount(wh_code));
		
		List<ReleaseListCommand> list = pickingDAO.selectReleaseList(wh_code,sm);
		List<DongFloorVO> dongFloorList = constructDAO.selectDongFloor(wh_code);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("relList", list);
		dataMap.put("dongFloorList", dongFloorList);
		
		return dataMap;
		
	}

	@Override
	public boolean getPickingCheck(String rls_no) throws SQLException {
		List<PickingCommand> list = pickingDAO.selectPickingList(rls_no);
		boolean result = false;
		if(list == null || list.size() == 0) {
			result = true;
		}
		return result;
	}

	@Override
	public Map<String, Object> getMarkByCode(String inv_no) throws SQLException {
		/* 여기서 맵에 담아줘야 할 것들
		 * 1. 해당 inv_no가 들어있는 rack 번호,
		 * 2. 해당 inv_no와 같은 품목들의 재고번호와 rack 번호, zone 번호 List
		 * 
		*/
		Map<String,Object> dataMap = new HashMap<>();
		String inv_loc = pickingDAO.selectInvLoc(inv_no);
		List<Map<String,String>> invList = pickingDAO.selectSameItemByInv(inv_no); 
		
		dataMap.put("inv_loc", inv_loc);
		dataMap.put("invList", invList);
		
		return dataMap;
	}

	@Override
	public void modifyPikInv(Map<String,String> pick) throws SQLException {
		pickingDAO.updatePikInv(pick);
		
	}

	@Override
	public Map<String, Object> getReleaseList(String wh_code) throws SQLException {
		Map<String, Object> dataMap = new HashMap<>();
		List<ReleaseListCommand> list = pickingDAO.selectReleaseList(wh_code);
		List<DongFloorVO> dongFloorList = constructDAO.selectDongFloor(wh_code);
		dataMap.put("relList", list);
		dataMap.put("dongFloorList", dongFloorList);
		return dataMap;
	}
	
	
	
}







