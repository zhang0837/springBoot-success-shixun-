package cn.gson.crm.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
@Component
public class Answer {
	
	private int note_id;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date par_time;
	private String voter;
	private int anon;
	private String ans;
	private int que_id;
	public int getNote_id() {
		return note_id;
	}
	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}
	public Date getPar_time() {
		return par_time;
	}
	public void setPar_time(Date par_time) {
		this.par_time = par_time;
	}
	public String getVoter() {
		return voter;
	}
	public void setVoter(String voter) {
		this.voter = voter;
	}
	public int getAnon() {
		return anon;
	}
	public void setAnon(int anon) {
		this.anon = anon;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public int getQue_id() {
		return que_id;
	}
	public void setQue_id(int que_id) {
		this.que_id = que_id;
	}

	
	
	
}
