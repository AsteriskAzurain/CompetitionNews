package base.pojo;

public class Volunteer_Info {
	private int volunteer_id;
	private String name;
	private String title;
	private String summary;
	private String img;
	private String context;
	private String tab;
	private java.util.Calendar creatime;
	private Integer view_count;
	
	public java.util.Calendar getCreatime() {
		return creatime;
	}
	public void setCreatime(java.util.Calendar creatime) {
		this.creatime = creatime;
	}
	public int getVolunteer_id() {
		return volunteer_id;
	}
	public void setVolunteer_id(int volunteer_id) {
		this.volunteer_id = volunteer_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getTab() {
		return tab;
	}
	public void setTab(String tab) {
		this.tab = tab;
	}

	public Integer getView_count() {
		return view_count;
	}
	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}
	@Override
	public String toString() {
		return "Volunteer_Info [volunteer_id=" + volunteer_id + ", name=" + name + ", title=" + title + ", summary="
				+ summary + ", img=" + img + ", context=" + context + ", tab=" + tab + ", creatime=" + creatime
				+ ", view_count=" + view_count + "]";
	}

}
