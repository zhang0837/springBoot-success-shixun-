package cn.gson.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class Option {
	private int opt_id;
	private int new_name;
	private String new_con;
	private int que_id;
	public int getOpt_id() {
		return opt_id;
	}
	public void setOpt_id(int opt_id) {
		this.opt_id = opt_id;
	}
	public int getNew_name() {
		return new_name;
	}
	public void setNew_name(int new_name) {
		this.new_name = new_name;
	}
	public String getNew_con() {
		return new_con;
	}
	public void setNew_con(String new_con) {
		this.new_con = new_con;
	}
	public int getQue_id() {
		return que_id;
	}
	public void setQue_id(int que_id) {
		this.que_id = que_id;
	}
	
	
}
