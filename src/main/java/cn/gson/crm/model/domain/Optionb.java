package cn.gson.crm.model.domain;

public class Optionb {
	private int optid;
	private String newname;
	private String newcon;
	private int quesid;
	
	public Optionb() {
		super();
	}
	public Optionb(String newname, String newcon) {
		super();
		this.newname = newname;
		this.newcon = newcon;
	}
	public Optionb(int optid, String newname, String newcon, int quesid) {
		super();
		this.optid = optid;
		this.newname = newname;
		this.newcon = newcon;
		this.quesid = quesid;
	}
	public int getOptid() {
		return optid;
	}
	public void setOptid(int optid) {
		this.optid = optid;
	}
	public String getNewname() {
		return newname;
	}
	public void setNewname(String newname) {
		this.newname = newname;
	}
	public String getNewcon() {
		return newcon;
	}
	public void setNewcon(String newcon) {
		this.newcon = newcon;
	}
	public int getQuesid() {
		return quesid;
	}
	public void setQuesid(int quesid) {
		this.quesid = quesid;
	}
	@Override
	public String toString() {
		return "Optionb [optid=" + optid + ", newname=" + newname + ", newcon=" + newcon + ", quesid=" + quesid + "]";
	}
	
	

}
