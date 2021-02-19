package com.spring.AtoZ.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.AtoZ.common.dto.SearchMap;
import com.spring.AtoZ.member.dto.DetailMemberCommand;
import com.spring.AtoZ.member.dto.UpdateMemberCommand;
import com.spring.AtoZ.member.service.MemberService;
import com.spring.AtoZ.serviceUse.service.ServiceUseService;
import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.WHPictureVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ServiceUseService serviceUseService;
	
	@Resource(name="whpictureUploadPath")
	private String whpictureUploadPath;
	
	@RequestMapping("/SY/member/memberList")
	public ModelAndView memberList(ModelAndView mnv, SearchMap sm, @RequestParam(defaultValue="") String searchType, @RequestParam(defaultValue="") String keyword) throws Exception{
		String url = "member/memberList.frame";
		
		sm.put("searchType", searchType);
		sm.put("keyword", keyword);
		sm.setUrl("/SY/member/memberList");
		Map<String, Object> dataMap = memberService.getClientList(sm);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/SY/member/companyDetail")
	@ResponseBody
	public ResponseEntity<DetailMemberCommand> companyDetail(String cl_code) throws Exception {
		DetailMemberCommand client = memberService.getClient(cl_code);
		return new ResponseEntity<DetailMemberCommand>(client,HttpStatus.OK);
	}
	
	@RequestMapping("/AL/member/memberDetail")
	public ModelAndView memberDetail(ModelAndView mnv) throws Exception {
		String url = "member/memberDetail.frame";
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/AL/member/memberModifyForm")
	public ModelAndView memberModifyForm(ModelAndView mnv) throws Exception{
		String url = "member/memberModifyForm.frame";
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/AL/member/memberModify",method=RequestMethod.POST)
	public String memberModify(HttpSession session, HttpServletRequest request, HttpServletResponse response,String cl_id, String cl_name, String cl_ceo, String cl_regno, String cl_email, String cl_tel, String wh_addr, String co_addr) throws Exception {
		UpdateMemberCommand umc = new UpdateMemberCommand();
		umc.setCl_ceo(cl_ceo);
		umc.setCl_email(cl_email);
		umc.setId(cl_id);
		umc.setCl_name(cl_name);
		umc.setCl_regno(cl_regno);
		umc.setCl_tel(cl_tel);
		if(wh_addr==null || wh_addr.equals("")) {
			umc.setCo_addr(co_addr);
			memberService.modifyCompany(umc);
		}else if(co_addr==null||co_addr.equals("")) {
			umc.setWh_addr(wh_addr);
			memberService.modifyWarehouse(umc);
		}
		ClientVO updateClient = serviceUseService.getClient(cl_id);
		session.setAttribute("loginUser", updateClient);
		return "redirect:/index/AL008";
	}
	
	@ResponseBody
	@RequestMapping(value="/WC/member/getWHImage",method=RequestMethod.GET)
	public ResponseEntity<List<WHPictureVO>> getWHImage(String cl_code) throws Exception {
		List<WHPictureVO> pictureList = memberService.getWHImage(cl_code);
		return new ResponseEntity<List<WHPictureVO>>(pictureList, HttpStatus.OK);
	}
	
	@RequestMapping("/WC/member/getPicture")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String pic_name) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.whpictureUploadPath;
		
		try {
			in = new FileInputStream(new File(imgPath, pic_name));
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			if(in != null) in.close();
		}
		return entity;
	}
}
