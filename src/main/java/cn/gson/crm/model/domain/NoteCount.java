package cn.gson.crm.model.domain;

public class NoteCount {
    private  String title;
    private  Integer count;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public NoteCount(String title, Integer count) {
		super();
		this.title = title;
		this.count = count;
	}
	public NoteCount() {
		super();
	}
	@Override
	public String toString() {
		return "NoteCount [title=" + title + ", count=" + count + "]";
	}
}