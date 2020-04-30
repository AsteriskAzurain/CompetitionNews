package base.pojo;

public class Competition_Type {
	private int type_id;
	private String name;
	private int del;

	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "Competition_Type [type_id=" + type_id + ", name=" + name + ", del=" + del + "]";
	}
}
