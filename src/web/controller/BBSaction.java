package web.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

import base.pojo.BBS_Posts;
import base.pojo.User;
import base.service.BBS_post_service;
import base.service.LoginCheck;

public class BBSaction extends ActionSupport{
	private BBS_post_service service;
	private Map<String, Object> reMap;
	private LoginCheck userservice;
	@JSON(serialize=false)
	public BBS_post_service getService() {
		return service;
	}
	public void setService(BBS_post_service service) {
		this.service = service;
	}
	public Map<String, Object> getReMap() {
		return reMap;
	}
	public void setReMap(Map<String, Object> reMap) {
		this.reMap = reMap;
	}
	@JSON(serialize=false)
	public LoginCheck getUserservice() {
		return userservice;
	}
	public void setUserservice(LoginCheck userservice) {
		this.userservice = userservice;
	}
	public String bbspostqueryallaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		List<BBS_Posts> rs=service.queryall();
		System.out.println("controller succeed");
		System.out.println(rs.toString());
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		System.out.println("map succeed");
		System.out.println(map.toString());
		reMap = map;
		return SUCCESS;
	}
	
	public String bbspostsaveaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		
		String p_ptheme = request.getParameter("") ;
		String poster = request.getParameter("");
		int p_paccount =Integer.parseInt(poster);
//		String p_pnick= request.getParameter("");
		String p_pnick= service.queryById(p_paccount).getP_pnick();
		String p_ptext= request.getParameter("") ;
		
		BBS_Posts po= new BBS_Posts();
		po.setP_ptheme(p_ptheme);
//		po.setP_ptime(new java.sql.Date(p_ptime.getTime()));
		po.setP_ptime(Calendar.getInstance());
		po.setP_paccount(p_paccount);
		po.setP_pnick(p_pnick);
		po.setP_ptext(p_ptext);
		
		int p_pid=service.save(po);
		if(p_pid==0)return ERROR;
		else return SUCCESS;
	}
	
	public String bbspostdeleteaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String id=request.getParameter("p_pid");
		int p_pid=Integer.parseInt(id);
		service.delete(p_pid);
		System.out.println("delete succeed");
		return SUCCESS;
	}
	
	public String bbspostloadaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		
		String id=request.getParameter("p_pid");
		int p_pid=Integer.parseInt(id);
		BBS_Posts po=service.queryById(p_pid);
		Map<String, Object> map = new HashMap<>();
		map.put("currentPost", po);
		reMap = map;
		
		return SUCCESS;
	}
	
	public String bbspostupdateaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		
		//可修改的属性：主题、内容、时间
		String id=request.getParameter("p_pid");
		int p_pid=Integer.parseInt(id);
		String p_ptheme = request.getParameter("p_ptheme") ;
		String p_ptext= request.getParameter("p_ptext") ;
		
		BBS_Posts po= new BBS_Posts();
		po.setP_pid(p_pid);
		po.setP_ptheme(p_ptheme);
//		po.setP_ptime(Calendar.getInstance());
		po.setP_ptext(p_ptext);
		
		service.update(po);
		
		return SUCCESS;
	}
	
	public String bbspostquerybyeneityaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		
		String p_ptheme = request.getParameter("p_ptheme") ;
		BBS_Posts po= new BBS_Posts();
		po.setP_ptheme(p_ptheme);
		
		List<BBS_Posts> postlist=service.queryByEntity(po);
		Map<String, Object> map = new HashMap<>();
		map.put("PostList", postlist);
		reMap = map;
		
		return SUCCESS;
	}
	/*
	 * public String cinfosaveaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String name = request.getParameter("name");
		String typename= request.getParameter("typename");
		//int type_id = typedao.querybyname(typename);
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		String img = request.getParameter("img");
		String context = request.getParameter("context");
		String tab = request.getParameter("tab");
		Date time = new java.util.Date() ;
		String createtime = time.toString();
		
		Competition_Info info=new Competition_Info();
		info.setName(name);
//		info.setType_id(type_id);
		info.setTitle(title);
		info.setSummary(summary);
		info.setImg(img);
		info.setContext(context);
		info.setTab(tab);
		info.setCreatime(createtime);
		info.setView_count(0);
		
		int competition_id=service.save(info);
		if(competition_id>=401) {
			info.setCompetition_id(competition_id);
			return SUCCESS;
		}
		else {
			request.setAttribute("errorMessage", "注册失败，请检查信息后再试。");
			return ERROR;
		}
	}
	 * */
	public String bbspostaddcheckaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String p_ptheme = request.getParameter("p_ptheme");
		String p_ptext= request.getParameter("p_ptext");
		String uaccount = request.getParameter("uaccount") ;
		int userid=Integer.parseInt(uaccount);

		User user =userservice.querybyid(userid);
		String nickname=user.getUsername();
		
		BBS_Posts po= new BBS_Posts();
		po.setP_ptheme(p_ptheme);
		po.setP_ptext(p_ptext);
		po.setP_paccount(userid);
		po.setP_ptime(Calendar.getInstance());
		po.setP_pnick(nickname);
		
		service.save(po);
		
		return SUCCESS;
	}
	
}
