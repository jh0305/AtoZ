package com.spring.AtoZ.common.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SearchMap{
	
	private Map<String, Object> search;
	private int page =1 ;
	private int perPage = 10;
	private String url;
	
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public SearchMap() {
		search = new HashMap<String, Object>();
	}
	
	public int getPageStartRowNum() {  //각 페이지 마다 시작하는 행번호
		return (this.page-1)*perPage;
	}
	
	

	public Map<String, Object> getSearch() {
		return search;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}
	public void setPage(String page) {
		if(page!=null && !page.isEmpty())
			this.page = Integer.parseInt(page);
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public void setPerPage(String perPage) {
		if(perPage!=null && !perPage.isEmpty())
		this.perPage = Integer.parseInt(perPage);
	}
	public Object put(String key, Object value) {
		
		return search.put(key, value);
	}
	
//	public Object putString(String key, String value) {
//		if(value == null) return search.put(key, null);
//		
//		String[] arrStr = value.split(",");
//		
//		return search.put(key, arrStr);
//	}
//	
//	public Object putDate(String key, String value) throws ParseException {
//		if(value == null) {
//			return search.put(key, null);
//		}
//		
//		String[] arrStr = value.split(",");
//		List<Date> arrDate = new ArrayList<Date>();
//		
//		SimpleDateFormat sdf = new SimpleDateFormat();
//		for(String s : arrStr) {
//			Date date = sdf.parse(s);
//			arrDate.add(date);
//		}
//		
//		return search.put(key, arrDate);
//		
//	}
	
	public Object get(Object key) {
		// TODO Auto-generated method stub
		return search.get(key);
	}
	
	public List<String> getKeys(){
		Set<String> keySet = search.keySet();
		List<String> keys = new ArrayList<String>();
		for(String key : keySet) {
			keys.add(key);
		}
		return keys;
	}
	 
	
}
















