package com.spring.AtoZ.serviceUse.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.AtoZ.vo.ClientVO;
import com.spring.AtoZ.vo.WHTypeVO;

public class WHClient {
	private String cl_code;
	private String id;
	private String pwd;
	private String cl_name;
	private String cl_ceo;
	private String cl_regno;
	private String cl_tel;
	private String cl_email;
	private String co_addr;
	private String wh_addr;
	private String cre_ymd;
	private String head_code;
	private int act_yn;
	private String cl_type;
	private String sts_code;
	private String pic_name;
	private String cm_code;
	private String[] cm_codeList;
	private String[] dong_nameList;
	private String[] floor_nameList;
	private String[] df_dscList;
	private int[] df_widthList;
	private int[] df_lngthList;
	private int[] df_areaList;
	private List<MultipartFile> picture;
	private List<WHTypeVO> code;
	
	public String getSts_code() {
		return sts_code;
	}
	public void setSts_code(String sts_code) {
		this.sts_code = sts_code;
	}
	public String getCl_code() {
		return cl_code;
	}
	public void setCl_code(String cl_code) {
		this.cl_code = cl_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public String getCl_ceo() {
		return cl_ceo;
	}
	public void setCl_ceo(String cl_ceo) {
		this.cl_ceo = cl_ceo;
	}
	public String getCl_regno() {
		return cl_regno;
	}
	public void setCl_regno(String cl_regno) {
		this.cl_regno = cl_regno;
	}
	public String getCl_tel() {
		return cl_tel;
	}
	public void setCl_tel(String cl_tel) {
		this.cl_tel = cl_tel;
	}
	public String getCl_email() {
		return cl_email;
	}
	public void setCl_email(String cl_email) {
		this.cl_email = cl_email;
	}
	public String getCre_ymd() {
		return cre_ymd;
	}
	public void setCre_ymd(String cre_ymd) {
		this.cre_ymd = cre_ymd;
	}
	public int getAct_yn() {
		return act_yn;
	}
	public void setAct_yn(int act_yn) {
		this.act_yn = act_yn;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	public List<MultipartFile> getPicture() {
		return picture;
	}
	public void setPicture(List<MultipartFile> picture) {
		this.picture = picture;
	}
	public String getCo_addr() {
		return co_addr;
	}
	public void setCo_addr(String co_addr) {
		this.co_addr = co_addr;
	}
	public String getCl_type() {
		return cl_type;
	}
	public void setCl_type(String cl_type) {
		this.cl_type = cl_type;
	}
	public String getHead_code() {
		return head_code;
	}
	public void setHead_code(String head_code) {
		this.head_code = head_code;
	}
	public String getCm_code() {
		return cm_code;
	}
	public void setCm_code(String cm_code) {
		this.cm_code = cm_code;
	}
	public List<WHTypeVO> getCode() {
		return code;
	}
	public void setCode(List<WHTypeVO> code) {
		this.code = code;
	}
	public String[] getCm_codeList() {
		return cm_codeList;
	}
	public void setCm_codeList(String[] cm_codeList) {
		this.cm_codeList = cm_codeList;
	}
	
	public String getWh_addr() {
		return wh_addr;
	}
	public void setWh_addr(String wh_addr) {
		this.wh_addr = wh_addr;
	}
	
	public String[] getDong_nameList() {
		return dong_nameList;
	}
	public void setDong_nameList(String[] dong_nameList) {
		this.dong_nameList = dong_nameList;
	}
	public String[] getFloor_nameList() {
		return floor_nameList;
	}
	public void setFloor_nameList(String[] floor_nameList) {
		this.floor_nameList = floor_nameList;
	}
	public String[] getDf_dscList() {
		return df_dscList;
	}
	public void setDf_dscList(String[] df_dscList) {
		this.df_dscList = df_dscList;
	}
	public int[] getDf_widthList() {
		return df_widthList;
	}
	public void setDf_widthList(int[] df_widthList) {
		this.df_widthList = df_widthList;
	}
	public int[] getDf_lngthList() {
		return df_lngthList;
	}
	public void setDf_lngthList(int[] df_lngthList) {
		this.df_lngthList = df_lngthList;
	}
	public int[] getDf_areaList() {
		return df_areaList;
	}
	public void setDf_areaList(int[] df_areaList) {
		this.df_areaList = df_areaList;
	}
	public ClientVO toWHClient() {
		ClientVO client = new ClientVO();
		client.setId(this.id);
		client.setPwd(this.pwd);
		client.setCl_name(this.cl_name);
		client.setCl_ceo(this.cl_ceo);
		client.setCl_regno(this.cl_regno);
		client.setCl_tel(this.cl_tel.replace(",", "-"));
		client.setCl_email(this.cl_email.replace(",", "@"));
		client.setCo_addr(this.co_addr);
		client.setWh_addr(this.wh_addr);
		client.setCre_ymd(this.cre_ymd);
		client.setCl_type(this.cl_type);
		client.setCm_code(this.cm_code);
		client.setCm_codeList(this.cm_codeList);
		client.setDong_nameList(this.dong_nameList);
		client.setFloor_nameList(this.floor_nameList);
		client.setDf_dscList(this.df_dscList);
		client.setDf_widthList(this.df_widthList);
		client.setDf_lngthList(this.df_lngthList);
		client.setDf_areaList(this.df_areaList);
		return client;
	}
}
