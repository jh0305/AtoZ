package com.spring.AtoZ.vo;

public class ZoneVO {
	private int wz_no;
	private String wz_loc;
	private String wh_code;
	private String cm_code;
	private String wz_dsc;
	private int wz_order;
	private double wz_lngth;
	private double wz_width;
	private double wz_area;
	private String co_code;
	private double wz_xpoint;
	private double wz_ypoint;
	private String dong_name;
	private String floor_name;
	private String trg_code;
	private int rk_no;
	private int up_no;
	
	private String up_loc;
	
	@Override
	public String toString() {
		return "ZoneVO [wz_no=" + wz_no + ", wz_loc=" + wz_loc + ", wh_code=" + wh_code + ", cm_code=" + cm_code
				+ ", wz_dsc=" + wz_dsc + ", wz_order=" + wz_order + ", wz_lngth=" + wz_lngth + ", wz_width=" + wz_width
				+ ", wz_area=" + wz_area + ", co_code=" + co_code + ", wz_xpoint=" + wz_xpoint + ", wz_ypoint="
				+ wz_ypoint + ", dong_name=" + dong_name + ", floor_name=" + floor_name + ", trg_code=" + trg_code
				+ ", rk_no=" + rk_no + ", up_no=" + up_no + "]";
	}
	public int getWz_no() {
		return wz_no;
	}
	public void setWz_no(int wz_no) {
		this.wz_no = wz_no;
	}
	public String getWz_loc() {
		return wz_loc;
	}
	public void setWz_loc(String wz_loc) {
		this.wz_loc = wz_loc;
	}
	public String getWh_code() {
		return wh_code;
	}
	public void setWh_code(String wh_code) {
		this.wh_code = wh_code;
	}
	public String getCm_code() {
		return cm_code;
	}
	public void setCm_code(String cm_code) {
		this.cm_code = cm_code;
	}
	public String getWz_dsc() {
		return wz_dsc;
	}
	public void setWz_dsc(String wz_dsc) {
		this.wz_dsc = wz_dsc;
	}
	public int getWz_order() {
		return wz_order;
	}
	public void setWz_order(int wz_order) {
		this.wz_order = wz_order;
	}
	public double getWz_lngth() {
		return wz_lngth;
	}
	public void setWz_lngth(double wz_lngth) {
		this.wz_lngth = wz_lngth;
	}
	public double getWz_width() {
		return wz_width;
	}
	public void setWz_width(double wz_width) {
		this.wz_width = wz_width;
	}
	public double getWz_area() {
		return wz_area;
	}
	public void setWz_area(double wz_area) {
		this.wz_area = wz_area;
	}
	public String getCo_code() {
		return co_code;
	}
	public void setCo_code(String co_code) {
		this.co_code = co_code;
	}
	public double getWz_xpoint() {
		return wz_xpoint;
	}
	public void setWz_xpoint(double wz_xpoint) {
		this.wz_xpoint = wz_xpoint;
	}
	public double getWz_ypoint() {
		return wz_ypoint;
	}
	public void setWz_ypoint(double wz_ypoint) {
		this.wz_ypoint = wz_ypoint;
	}
	public String getDong_name() {
		return dong_name;
	}
	public void setDong_name(String dong_name) {
		this.dong_name = dong_name;
	}
	public String getFloor_name() {
		return floor_name;
	}
	public void setFloor_name(String floor_name) {
		this.floor_name = floor_name;
	}
	public String getTrg_code() {
		return trg_code;
	}
	public void setTrg_code(String trg_code) {
		this.trg_code = trg_code;
	}
	public int getRk_no() {
		return rk_no;
	}
	public void setRk_no(int rk_no) {
		this.rk_no = rk_no;
	}
	public int getUp_no() {
		return up_no;
	}
	public void setUp_no(int up_no) {
		this.up_no = up_no;
	}
	public String getUp_loc() {
		return up_loc;
	}
	public void setUp_loc(String up_loc) {
		this.up_loc = up_loc;
	}
}
