package web.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import base.pojo.Admin;
import base.pojo.User;
import base.service.LoginCheck;

public class UserAction extends ActionSupport {
	private LoginCheck service;
	private Map<String, Object> reMap;

	public Map<String, Object> getReMap() {
		return reMap;
	}

	public void setReMap(Map<String, Object> reMap) {
		this.reMap = reMap;
	}

	public void setService(LoginCheck service) {
		this.service = service;
	}

	public String initpage() {
		return SUCCESS;
	}

	public String logincheckaction() throws Exception {
		// HttpServletRequest request, HttpServletResponse response
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);

		List<User> rs = service.loginCheck(u);
		if (rs.size() > 0) {
			System.out.println("success");
			User user = rs.get(0);
			addCookie(response, "username", user.getUsername());
			addCookie(response,"userid",String.valueOf(user.getUserid()));
			Map<String, Object> map = new HashMap<>();
			map.put("currentUser", user);
			reMap = map;

			return SUCCESS;
		} else
			return ERROR;
	}
	
    private void addCookie(HttpServletResponse resp, String key, String value){        
        try {
            Cookie cookie = new Cookie(key, URLEncoder.encode(value,"UTF-8"));
            cookie.setPath("/");
            resp.addCookie(cookie);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }        
    }  

	public String registcheckaction() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String pswd1 = request.getParameter("pswd1");
		String pswd2 = request.getParameter("pswd2");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String major = request.getParameter("major");
		User u = new User();
		if (pswd1.equals(pswd2)) {
			u.setUsername(username);
			u.setPassword(pswd1);
			if (sex == "on")
				u.setSex("男");
			else
				u.setSex("女");
			u.setEmail(email);
			u.setMajor(major);
			int userid = service.regist(u);
			if (userid == 0)
				return ERROR;
			else {
				u.setUserid(userid);
				Map<String, Object> map = new HashMap<>();
				map.put("newUser", u);
				reMap = map;
			}
			return SUCCESS;
		} else {
			request.setAttribute("errorMessage", "注册失败，请检查信息后再试。");
			return ERROR;
		}

	}

	public String queryallaction() throws ServletException, IOException {
		List<User> rs=service.queryall();
		System.out.println(rs);
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		request.setAttribute("resultlist", rs);
		//System.out.println(request.getAttribute("resultlist").toString());
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		reMap = map;
//		request.getRequestDispatcher("managesystem/ms_vip.jsp").forward(request, response);
		return SUCCESS;
	}
	
	public String deleteuseraction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String id=request.getParameter("userid");
		int userid=Integer.parseInt(id);
		//userid=request.getSession().getAttribute("userid");
		System.out.println(userid);
		service.deleteuser(userid);
		System.out.println("controller-succuess");
		return SUCCESS;
	}

	public String userquerybyeneityaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String username = request.getParameter("username");
		User user = new User();
		user.setUsername(username);
		List<User>rs = service.querybyentity(user);
		System.out.println(rs.toString());
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		reMap = map;
		return SUCCESS;
	}

	public String userloadaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		String id = request.getParameter("userid");
		int userid = Integer.parseInt(id);
		User user =service.querybyid(userid);
		Map<String, Object> map = new HashMap<>();
		map.put("currentUser", user);
		reMap = map;
		return SUCCESS;
	}
	
	public String userupdateaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();

		// 可修改的属性：用户名、密码、邮箱、性别、专业
		String id=request.getParameter("userid");
		int userid=Integer.parseInt(id);
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String pswd = request.getParameter("pswd");
		String sex = request.getParameter("sex");
		String major = request.getParameter("major");
		
		User user = new User();
		user.setUserid(userid);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(pswd);
		user.setSex(sex);
		user.setMajor(major);
		
		service.update(user);
		
		return SUCCESS;
	}
}
