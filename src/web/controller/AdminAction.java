package web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import base.pojo.Admin;
import base.service.BackLoginCheck;

public class AdminAction extends ActionSupport {
	private BackLoginCheck service;
	private Map<String, Object> reMap;

	public Map<String, Object> getReMap() {
		return reMap;
	}

	public void setReMap(Map<String, Object> reMap) {
		this.reMap = reMap;
	}

	public void setService(BackLoginCheck service) {
		this.service = service;
	}

	public String initpage() {
		return SUCCESS;
	}

	public String backlogincheckaction() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
//		String adminname = request.getParameter("adminname");
//		String adminpassword = request.getParameter("adminpassword");
		String adminname = request.getParameter("aname");
		String adminpassword = request.getParameter("apassword");
		Admin a = new Admin();
		a.setAdminname(adminname);
		a.setAdminpassword(adminpassword);

		List<Admin> rs = service.backloginCheck(a);
		if (rs.size() > 0) {
			System.out.println("success");
			Admin admin = rs.get(0);
			addCookie(response, "adminname", admin.getAdminname());
			Map<String, Object> map = new HashMap<>();
			map.put("currentAdmin", admin);
			reMap = map;

			return SUCCESS;
		} else
			return ERROR;
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

	public String adminaddcheckaction() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String adminname = request.getParameter("adminname");
		String pswd1 = request.getParameter("pswd1");
		String pswd2 = request.getParameter("pswd2");
		Admin a = new Admin();
		if (pswd1.equals(pswd2)) {
			a.setAdminname(adminname);
			a.setAdminpassword(pswd1);
			int adminid = service.regist(a);
			if (adminid == 0)
				return ERROR;
			else {
				return SUCCESS;
			}

		} else {
			request.setAttribute("errorMessage", "注册失败。");
			return ERROR;
		}

	}

	public String adminqueryallaction() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		List<Admin> rs = service.queryall();
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		reMap = map;
		return SUCCESS;
	}

	public String admindeleteaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String id = request.getParameter("adminid");
		int adminid = Integer.parseInt(id);
		service.delete(adminid);
		System.out.println("delete succeed");
		return SUCCESS;
	}

	public String adminquerybyeneityaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String adminname = request.getParameter("adminname");
		Admin admin = new Admin();
		admin.setAdminname(adminname);
		List<Admin> rs = service.querybyentity(admin);
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		reMap = map;
		return SUCCESS;
	}

	public String adminloadaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();

		String id = request.getParameter("adminid");
		int adminid = Integer.parseInt(id);
		System.out.println(adminid);
		Admin admin = service.queryById(adminid);
		Map<String, Object> map = new HashMap<>();
		map.put("currentAdmin", admin);
		reMap = map;
		return SUCCESS;
	}

	public String adminupdateaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();

		// 可修改的属性：用户名、密码
		String id=request.getParameter("adminid");
		int adminid=Integer.parseInt(id);
		String adminname = request.getParameter("adminname");
		String pswd = request.getParameter("pswd");

		Admin a = new Admin();
		a.setAdminid(adminid);
		a.setAdminname(adminname);
		a.setAdminpassword(pswd);
		service.update(a);

		return SUCCESS;
	}
}
