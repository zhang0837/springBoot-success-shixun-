package cn.gson.crm.model.domain;

public class Questionb {
	private int reqid;
	private String title;
	private int required;
	private String type;
	private int noteid;
	
	public Questionb() {
		super();
	}


	public Questionb(String title, int required, String type, int noteid) {
		super();
		this.title = title;
		this.required = required;
		this.type = type;
		this.noteid = noteid;
	}
	

	public Questionb(String title, int required, String type) {
		super();
		this.title = title;
		this.required = required;
		this.type = type;
	}


	public Questionb(int reqid, String title, int required, String type, int noteid) {
		super();
		this.reqid = reqid;
		this.title = title;
		this.required = required;
		this.type = type;
		this.noteid = noteid;
	}


	public int getReqid() {
		return reqid;
	}


	public void setReqid(int reqid) {
		this.reqid = reqid;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public int getRequired() {
		return required;
	}


	public void setRequired(int required) {
		this.required = required;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public int getNoteid() {
		return noteid;
	}


	public void setNoteid(int noteid) {
		this.noteid = noteid;
	}


	@Override
	public String toString() {
		return "Questionb [reqid=" + reqid + ", title=" + title + ", required=" + required + ", type=" + type
				+ ", noteid=" + noteid + "]";
	}
	
	

}
