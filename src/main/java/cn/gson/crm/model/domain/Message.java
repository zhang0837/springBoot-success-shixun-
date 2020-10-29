package cn.gson.crm.model.domain;

public class Message {
	private String msg;
	private Wenjuanbiao wjb;
	private boolean pd;
	public Message() {
		super();
	}
	
	public Message(boolean pd) {
		super();
		this.pd = pd;
	}

	public Message(String msg) {
		super();
		this.msg = msg;
	}
	public Message(Wenjuanbiao wjb) {
		super();
		this.wjb = wjb;
	}
	
	public Message(String msg, Wenjuanbiao wjb, boolean pd) {
		super();
		this.msg = msg;
		this.wjb = wjb;
		this.pd = pd;
	}
	public Message(String msg, boolean pd) {
		super();
		this.msg = msg;
		this.pd = pd;
	}
	public Message(String msg, Wenjuanbiao wjb) {
		super();
		this.msg = msg;
		this.wjb = wjb;
	}
	
	public boolean getPd() {
		return pd;
	}
	public void setPd(boolean pd) {
		this.pd = pd;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Wenjuanbiao getWjb() {
		return wjb;
	}
	public void setWjb(Wenjuanbiao wjb) {
		this.wjb = wjb;
	}
	@Override
	public String toString() {
		return "Message [msg=" + msg + ", wjb=" + wjb + "]";
	}
	
	

}
