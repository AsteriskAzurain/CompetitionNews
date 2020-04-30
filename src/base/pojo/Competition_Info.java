package base.pojo;

public class Competition_Info {
	private int competition_id;
	private String name;
	private Integer type_id;
	private String title;
	private String summary;
	private String img;
	private String context;
	private String tab;
	private java.util.Calendar creatime;
	private Integer view_count;

	
	public int getCompetition_id() {
		return competition_id;
	}


	public void setCompetition_id(int competition_id) {
		this.competition_id = competition_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getType_id() {
		return type_id;
	}


	public void setType_id(Integer type_id) {
		this.type_id = type_id;
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


	public java.util.Calendar getCreatime() {
		return creatime;
	}


	public void setCreatime(java.util.Calendar creatime) {
		this.creatime = creatime;
	}


	public Integer getView_count() {
		return view_count;
	}


	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}


	@Override
	public String toString() {
		return "Competition_Info [competition_id=" + competition_id + ", name=" + name + ", type_id=" + type_id
				+ ", title=" + title + ", summary=" + summary + ", img=" + img + ", context=" + context + ", tab=" + tab
				+ ", creatime=" + creatime + ", view_count=" + view_count + "]";
	}

}
