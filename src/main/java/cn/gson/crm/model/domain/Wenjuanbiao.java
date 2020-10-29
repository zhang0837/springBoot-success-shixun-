package cn.gson.crm.model.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class Wenjuanbiao {
	private int noteid;
	private String title;
	private String desc;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date starttime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date endtime;
	private int state;
	private int anon;
	private String creator;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createtime;
	
	public Wenjuanbiao() {
		super();
	}
	

	public Wenjuanbiao(String title, Date starttime, Date endtime, int anon) {
		super();
		this.title = title;
		this.starttime = starttime;
		this.endtime = endtime;
		this.anon = anon;
	}
	


	public Wenjuanbiao(String title, String desc, Date starttime, Date endtime, int anon) {
		super();
		this.title = title;
		this.desc = desc;
		this.starttime = starttime;
		this.endtime = endtime;
		this.anon = anon;
	}


	public Wenjuanbiao(String title, String desc, Date starttime, Date endtime, int state, int anon, String creator,
			Date createtime) {
		super();
		this.title = title;
		this.desc = desc;
		this.starttime = starttime;
		this.endtime = endtime;
		this.state = state;
		this.anon = anon;
		this.creator = creator;
		this.createtime = createtime;
	}

	public Wenjuanbiao(String title, Date starttime, Date endtime, int state, int anon, String creator,
			Date createtime) {
		super();
		this.title = title;
		this.starttime = starttime;
		this.endtime = endtime;
		this.state = state;
		this.anon = anon;
		this.creator = creator;
		this.createtime = createtime;
	}

	public int getNoteid() {
		return noteid;
	}

	public void setNoteid(int noteid) {
		this.noteid = noteid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getAnon() {
		return anon;
	}

	public void setAnon(int anon) {
		this.anon = anon;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "Wenjuanbiao [noteid=" + noteid + ", title=" + title + ", desc=" + desc + ", starttime=" + starttime
				+ ", endtime=" + endtime + ", state=" + state + ", anon=" + anon + ", creator=" + creator
				+ ", createtime=" + createtime + "]";
	}
	
	

}
