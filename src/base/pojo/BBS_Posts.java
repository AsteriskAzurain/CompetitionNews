package base.pojo;

import java.sql.Date;

public class BBS_Posts {
	private int p_pid;
	private String p_ptheme;
//	private Date p_ptime;
	private java.util.Calendar p_ptime;
	private int p_paccount;
	private String p_pnick;
	private String p_ptext;
	public int getP_pid() {
		return p_pid;
	}
	public void setP_pid(int p_pid) {
		this.p_pid = p_pid;
	}
	public String getP_ptheme() {
		return p_ptheme;
	}
	public void setP_ptheme(String p_ptheme) {
		this.p_ptheme = p_ptheme;
	}
//	public Date getP_ptime() {
//		return p_ptime;
//	}
//	public void setP_ptime(Date p_ptime) {
//		this.p_ptime = p_ptime;
//	}
	public int getP_paccount() {
		return p_paccount;
	}
	public java.util.Calendar getP_ptime() {
		return p_ptime;
	}
	public void setP_ptime(java.util.Calendar p_ptime) {
		this.p_ptime = p_ptime;
	}
	public void setP_paccount(int p_paccount) {
		this.p_paccount = p_paccount;
	}
	public String getP_pnick() {
		return p_pnick;
	}
	public void setP_pnick(String p_pnick) {
		this.p_pnick = p_pnick;
	}
	public String getP_ptext() {
		return p_ptext;
	}
	public void setP_ptext(String p_ptext) {
		this.p_ptext = p_ptext;
	}
	@Override
	public String toString() {
		return "BBS_Posts [p_pid=" + p_pid + ", p_ptheme=" + p_ptheme + ", p_ptime=" + p_ptime + ", p_paccount="
				+ p_paccount + ", p_pnick=" + p_pnick + ", p_ptext=" + p_ptext + "]";
	}	
	
}
