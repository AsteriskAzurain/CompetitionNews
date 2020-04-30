package base.pojo;

public class Comment {
	private int c_no; //评论编号
	private Integer c_cid;  //帖子id
	private String c_ctext;  //评论内容
	private Integer c_uaccount;  //发帖人
	private Integer c_caccount;  //评论人
	private java.util.Calendar c_ctime;  //评论时间

	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public Integer getC_cid() {
		return c_cid;
	}
	public void setC_cid(Integer c_cid) {
		this.c_cid = c_cid;
	}
	public String getC_ctext() {
		return c_ctext;
	}
	public void setC_ctext(String c_ctext) {
		this.c_ctext = c_ctext;
	}
	public Integer getC_uaccount() {
		return c_uaccount;
	}
	public void setC_uaccount(Integer c_uaccount) {
		this.c_uaccount = c_uaccount;
	}
	public Integer getC_caccount() {
		return c_caccount;
	}
	public void setC_caccount(Integer c_caccount) {
		this.c_caccount = c_caccount;
	}
	public java.util.Calendar getC_ctime() {
		return c_ctime;
	}
	public void setC_ctime(java.util.Calendar c_ctime) {
		this.c_ctime = c_ctime;
	}

	@Override
	public String toString() {
		return "Comment [c_no=" + c_no + ", c_cid=" + c_cid + ", c_ctext=" + c_ctext + ", c_uaccount=" + c_uaccount
				+ ", c_caccount=" + c_caccount + ", c_ctime=" + c_ctime + "]";
	}
	
	
}
