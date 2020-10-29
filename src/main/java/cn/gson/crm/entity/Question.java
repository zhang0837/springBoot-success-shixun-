package cn.gson.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class Question {

	private String title;
	private String optt;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOptt() {
		return optt;
	}

	public void setOptt(String optt) {
		this.optt = optt;
	}

}
