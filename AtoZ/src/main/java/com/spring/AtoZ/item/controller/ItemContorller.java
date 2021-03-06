package com.spring.AtoZ.item.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.common.service.CommonService;
import com.spring.AtoZ.item.dao.ItemDAO;
import com.spring.AtoZ.item.dto.GetItemRegistCommand;
import com.spring.AtoZ.item.dto.ItemCommand;
import com.spring.AtoZ.item.dto.ItemDetailCommand;
import com.spring.AtoZ.item.dto.ItemRegistCommand;
import com.spring.AtoZ.item.dto.StandardCodeCheckCommand;
import com.spring.AtoZ.item.dto.UpdateStandardCommand;
import com.spring.AtoZ.item.service.ItemService;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.StandardVO;

@Controller
@RequestMapping("/CO/item")
public class ItemContorller {

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ItemDAO itemDAO;
	
	@Autowired
	private CommonService commonService;
	
	@Resource(name="excelUploadPath")
	private String excelUploadPath;
	
	@RequestMapping("/itemList")
	public ModelAndView itemList(ModelAndView mnv, SearchMap sm, @RequestParam(defaultValue="") String searchType, @RequestParam(defaultValue="") String keyword,HttpSession session) throws Exception{
		String url = "item/itemList.frame";
		
		sm.put("searchType", searchType);
		sm.put("keyword", keyword);
		sm.put("co_code", ((ClientVO)session.getAttribute("loginUser")).getCl_code());
		sm.setPerPage(18);
		sm.setUrl("/CO/item/itemList");
		Map<String, Object> dataMap = itemService.getItemList(sm);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@ResponseBody
	@RequestMapping("/itemDetail")
	public ResponseEntity<ItemCommand> itemDetail(int item_no,HttpSession session) throws Exception {
		ItemDetailCommand idc = new ItemDetailCommand();
		idc.setCo_code(((ClientVO)session.getAttribute("loginUser")).getCl_code());
		idc.setItem_no(item_no);
		ItemCommand item = itemService.getItemDetail(idc);
		return new ResponseEntity<ItemCommand>(item, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/chkStdCode")
	public String chkStdCode(HttpSession session, String std_code, HttpServletResponse response) throws Exception {
		StandardCodeCheckCommand sccc = new StandardCodeCheckCommand();
		sccc.setStd_code(std_code);
		sccc.setCo_code(((ClientVO)session.getAttribute("loginUser")).getCl_code());
		String res_co_code = itemService.getStdCode(sccc);
		return res_co_code;
	}
	
	@ResponseBody
	@RequestMapping(value="/registStandard", method=RequestMethod.POST)
	public ResponseEntity<Void> registStandard(HttpSession session, StandardVO standard) throws Exception {
		standard.setCo_code(((ClientVO)session.getAttribute("loginUser")).getCl_code());
		standard.setStd_no(itemDAO.selectStandardSequenceNextValue());
		try {
			itemService.registStandard(standard);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@ResponseBody
	@RequestMapping("/standardList")
	public ResponseEntity<Map<String, Object>> standardList(SearchMap sm, @RequestParam(defaultValue="")String Skeyword, @RequestParam(defaultValue="")String SsearchType, HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> result = null;
		String co_code = ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		sm.put("co_code", co_code);
		sm.put("SsearchType", SsearchType);
		sm.put("Skeyword", Skeyword);
		sm.setUrl("CO/item/standardList");
		Map<String, Object> dataMap = itemService.getStandardList(sm);
		result = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/standardDetail",method=RequestMethod.POST)
	public ResponseEntity<StandardVO> standardDetail(int std_no) throws Exception {
		StandardVO standard = itemService.getStandard(std_no);
		return new ResponseEntity<StandardVO>(standard, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyStandard",method=RequestMethod.POST)
	public ResponseEntity<Void> modifyStandard(UpdateStandardCommand usc) throws Exception {
		try {
			itemService.modifyStandard(usc);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/removeStandard",method=RequestMethod.POST)
	public ResponseEntity<Void> removeStandard(int std_no) throws Exception {
		try {
			itemService.removeStandard(std_no);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@ResponseBody
	@RequestMapping("/cooperatorList")
	public ResponseEntity<Map<String, Object>> cooperatorList(SearchMap sm,  @RequestParam(defaultValue="")String keyword, @RequestParam(defaultValue="")String searchType) throws Exception {
		ResponseEntity<Map<String, Object>> result = null;
		sm.put("searchType", searchType);
		sm.put("keyword", keyword);
		sm.setUrl("CO/item/cooperatorList");
		Map<String, Object> dataMap = itemService.getCooperatorList(sm);
		result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/itemRegist",method=RequestMethod.POST)
	public ResponseEntity<Void> itemRegist(GetItemRegistCommand girc, HttpSession session) throws Exception {
		int item_no = itemDAO.selectItemSequenceNextValue();
		String co_code= ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		ItemRegistCommand irc = new ItemRegistCommand();
		irc.setItem_no(item_no);
		irc.setCo_code(co_code);
		irc.setStd_name(girc.getStd_name());
		irc.setGb_code(girc.getGb_code());
		irc.setGr_code(girc.getGr_code());
		irc.setType_code(girc.getType_code());
		irc.setItem_name(girc.getItem_name());
		irc.setReg_name(girc.getReg_name());
		irc.setCp_name(girc.getCp_name());
		irc.setItem_wgt(girc.getItem_wgt());
		try {
			itemService.registItem(irc);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/itemModify",method=RequestMethod.POST)
	public ResponseEntity<Void> itemModify(HttpSession session,GetItemRegistCommand girc) throws Exception {
		String co_code = ((ClientVO)session.getAttribute("loginUser")).getCl_code();
		ItemRegistCommand irc = new ItemRegistCommand();
		irc.setItem_no(girc.getItem_no());
		irc.setStd_name(girc.getStd_name());
		irc.setCo_code(co_code);
		irc.setGb_code(girc.getGb_code());
		irc.setGr_code(girc.getGr_code());
		irc.setType_code(girc.getType_code());
		irc.setItem_name(girc.getItem_name());
		irc.setUpd_name(girc.getUpd_name());
		irc.setCp_name(girc.getCp_name());
		irc.setItem_wgt(girc.getItem_wgt());
		try {
			itemService.modifyItem(irc);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/itemRemove",method=RequestMethod.POST)
	public ResponseEntity<Void> itemRemove(int item_no) throws Exception {
		try {
			itemService.removeItem(item_no);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	private String saveExcel(MultipartFile multi) throws Exception {
		String fileName = null;
		
		if(!(multi.isEmpty() || multi.getSize() > 1024 * 1024 * 2)) {
			String uploadPath = excelUploadPath;
			fileName = UUID.randomUUID().toString().replace("-", "") + ".xlsx";
			
			File storeFile = new File(uploadPath, fileName);
			
			storeFile.mkdirs();
			
			multi.transferTo(storeFile);
		}
		
		return fileName;
	}
	
	@ResponseBody
	@RequestMapping(value="/excelItemInsert", method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> excelItemInsert(HttpSession session,HttpServletResponse response, HttpServletRequest request,MultipartFile multi) throws Exception {
		String fileName = saveExcel(multi);
		String msg = "";
		msg = itemService.excelItemRegist(session, fileName);
		return new ResponseEntity<String>(msg, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/excelStandardInsert", method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> excelStandardInsert(HttpSession session,HttpServletResponse response, HttpServletRequest request,MultipartFile multi) throws Exception {
		String fileName = saveExcel(multi);
		String msg = "";
		msg = itemService.excelStandardRegist(session, fileName);
		return new ResponseEntity<String>(msg, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/excelFormDown",method=RequestMethod.GET)
	public ResponseEntity<byte[]> excelFormDown() throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String filePath = excelUploadPath;
		String fileName = "ItemRegistForm.xlsx";
		try {
			in = new FileInputStream(filePath+File.separator+fileName);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment;filename=\""+new String(fileName.getBytes("utf-8"),"ISO-8859-1")+"\"");
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/excelFormDown2",method=RequestMethod.GET)
	public ResponseEntity<byte[]> excelFormDown2() throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String filePath = excelUploadPath;
		String fileName = "StandardRegistForm.xlsx";
		try {
			in = new FileInputStream(filePath+File.separator+fileName);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment;filename=\""+new String(fileName.getBytes("utf-8"),"ISO-8859-1")+"\"");
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}
}
