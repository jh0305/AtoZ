package com.spring.AtoZ.strategy.dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LocationVO implements Comparable<LocationVO>{
	private String rack_code;
	private String wz_no;
	private String[] loc_root;
	private String[] rule;
	private List<Integer> ruleScore;
	private int score;
	private String type;
	private int rk_no;
	
	public String getRack_code() {
		return rack_code;
	}
	public void setRack_code(String rack_code) {
		this.rack_code = rack_code;
	}
	public List<Integer> getRuleScore() {
		return ruleScore;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRk_no() {
		return rk_no;
	}
	public void setRk_no(int rk_no) {
		this.rk_no = rk_no;
	}
	public String getWz_no() {
		return wz_no;
	}
	public void setWz_no(String wz_no) {
		this.wz_no = wz_no;
	}
	public String[] getLoc_root() {
		return loc_root;
	}
	public void setLoc_root(String loc_root) {
		this.loc_root = loc_root.split("-");
	}
	public String[] getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule.split("-");
	}
	public int getScore() {
		return score;
	}
	
	public void setScore(String[] info) {
		this.ruleScore = new ArrayList<>();
		if(rule.length > 0) {
			for(int i=0; i<rule.length;i++) {
				if(ruleScore.size() < 2) {
					if(rule[i].indexOf(info[0])==0) {
						ruleScore.add(2);
					} else if(rule[i].indexOf(info[1])==0) {
						ruleScore.add(1);
					} 
				} else {
					break;
				}
			}
		}
		
		int sc = 0;
		for(int i=0; i<ruleScore.size(); i++) {
			sc += ruleScore.get(i).intValue();
		}
		this.score = sc;
	}
	
	@Override
	public int compareTo(LocationVO o) {
		if(this.score < o.score) {
			return 1;
		} else if(this.score > o.score) {
			return -1;
		} else if(this.score == o.score) {
			if(!Arrays.equals(this.rule, o.rule)) {
				for(int i = 0; i<ruleScore.size(); i++) {
					if(this.ruleScore.get(i) > o.ruleScore.get(i)) {
						return -1;
					} else if(this.ruleScore.get(i) < o.ruleScore.get(i)) {
						return 1;
					}
				}
			}
		}
		return 0;
	}
	
	
}
