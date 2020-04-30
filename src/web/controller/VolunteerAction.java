package web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import base.pojo.Admin;
import base.pojo.Volunteer_Info;
import base.service.BackLoginCheck;
import base.service.VolunteerCheck;

public class VolunteerAction extends ActionSupport {
	private VolunteerCheck service;
	private Map<String, Object> reMap;

	public Map<String, Object> getReMap() {
		return reMap;
	}

	public void setReMap(Map<String, Object> reMap) {
		this.reMap = reMap;
	}

	public void setService(VolunteerCheck service) {
		this.service = service;
	}

	public String initpage() {
		return SUCCESS;
	}

	private void addCookie(HttpServletResponse resp, String key, String value) {
		try {
			Cookie cookie = new Cookie(key, URLEncoder.encode(value, "UTF-8"));
			cookie.setPath("/");
			resp.addCookie(cookie);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String volunteeraddcheckaction() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		String img = request.getParameter("img");
		String context = request.getParameter("context");
		String tab = request.getParameter("tab");
		Volunteer_Info v = new Volunteer_Info();
		v.setName(name);
		v.setTitle(title);
		v.setSummary(summary);
		v.setImg(img);
		v.setContext(context);
		v.setTab(tab);
		v.setCreatime(Calendar.getInstance());
		v.setView_count(0);
		System.out.println(v.toString());
		int volunteer_id = service.regist(v);
		if (volunteer_id == 0)
			return ERROR;
		else {
			return SUCCESS;
		}

	}

	public String volunteerqueryallaction() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		List<Volunteer_Info> rs = service.queryall();
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		reMap = map;
		return SUCCESS;
	}

	public String volunteerdeleteaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String id = request.getParameter("volunteer_id");
		int volunteer_id = Integer.parseInt(id);
		service.delete(volunteer_id);
		System.out.println("delete succeed");
		return SUCCESS;
	}

	public String volunteerquerybyeneityaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String name = request.getParameter("name");
		Volunteer_Info volunteer_Info = new Volunteer_Info();
		volunteer_Info.setName(name);
		List<Volunteer_Info> rs = service.querybyentity(volunteer_Info);
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		reMap = map;
		return SUCCESS;
	}

	public String volunteerloadaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();

		String id = request.getParameter("volunteer_id");
		int volunteer_id = Integer.parseInt(id);
		System.out.println(volunteer_id);
		Volunteer_Info volunteer_Info = service.queryById(volunteer_id);
		Map<String, Object> map = new HashMap<>();
		System.out.println(volunteer_Info.toString());
		map.put("currentvolunteer", volunteer_Info);
		reMap = map;
		return SUCCESS;
	}

	public String volunteerupdateaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();

		// 可修改的属性：标题、内容、摘要、图片、内容、标签
		String id=request.getParameter("vid");
		int volunteer_id=Integer.parseInt(id);
		String name = request.getParameter("vname");
		String title = request.getParameter("vtitle");
		String summary = request.getParameter("vsummary");
		String img = request.getParameter("vimg");
		String context = request.getParameter("vcontext");
		String tab = request.getParameter("vtab");

		Volunteer_Info v = new Volunteer_Info();
		v.setVolunteer_id(volunteer_id);
		v.setName(name);
		v.setTitle(title);
		v.setSummary(summary);
		v.setImg(img);
		v.setContext(context);
		v.setTab(tab);
		service.update(v);

		return SUCCESS;
	}
}
