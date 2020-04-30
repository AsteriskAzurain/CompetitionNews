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
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

import base.pojo.Comment;
import base.service.BBS_Comment_service;

public class BBSCommentAction extends ActionSupport{
	private BBS_Comment_service service;
	private Map<String, Object> reMap;
	@JSON(serialize=false)
	public BBS_Comment_service getService() {
		return service;
	}
	public void setService(BBS_Comment_service service) {
		this.service = service;
	}
	public Map<String, Object> getReMap() {
		return reMap;
	}
	public void setReMap(Map<String, Object> reMap) {
		this.reMap = reMap;
	}
	
	public String bbscommentqueryallaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		List<Comment> rs=service.queryall();
		System.out.println("controller succeed");
		System.out.println(rs.toString());
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		System.out.println("map succeed");
		System.out.println(map.toString());
		reMap = map;
		return SUCCESS;
	}
	
	public String bbscommentsaveaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		
		String cid = request.getParameter("");
		int c_cid =Integer.parseInt(cid);
		String caccount = request.getParameter("");
		int c_caccount =Integer.parseInt(caccount);
		String uaccount = request.getParameter("");
		int c_uaccount =Integer.parseInt(uaccount);
		String c_ctext= request.getParameter("") ;
		
		Comment co= new Comment();
		co.setC_cid(c_cid);
		co.setC_caccount(c_caccount);
		co.setC_uaccount(c_uaccount);
		co.setC_ctext(c_ctext);
		co.setC_ctime(Calendar.getInstance());
		
		int p_pid=service.save(co);
		if(p_pid==0)return ERROR;
		else return SUCCESS;
	}
	
	public String bbscommentdeleteaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String id=request.getParameter("c_cid");
		int c_cid=Integer.parseInt(id);
		service.delete(c_cid);
		System.out.println("delete succeed");
		return SUCCESS;
	}
	
	public String bbscommentloadaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		
		String id=request.getParameter("c_cid");
		int c_cid=Integer.parseInt(id);
		Comment co=service.queryById(c_cid);
		Map<String, Object> map = new HashMap<>();
		map.put("currentComment", co);
		reMap = map;
		
		return SUCCESS;
	}
	
	public String bbscommentupdateaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		
		//可修改的属性：不予修改
		String id=request.getParameter("c_cid");
		int c_cid=Integer.parseInt(id);
		String caccount=request.getParameter("c_caccount");
		int c_caccount=Integer.parseInt(caccount);
		String uaccount=request.getParameter("c_uaccount");
		int c_uaccount=Integer.parseInt(uaccount);
		String c_ctext= request.getParameter("c_ctext") ;
		
		Comment co= new Comment();
		co.setC_cid(c_cid);
		co.setC_caccount(c_caccount);
		co.setC_uaccount(c_uaccount);
		co.setC_ctext(c_ctext);
		
		service.update(co);
		
		return SUCCESS;
	}
	
	public String bbscommentquerybyeneityaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		
		String c_ctext = request.getParameter("c_ctext") ;
		Comment co= new Comment();
		co.setC_ctext(c_ctext);
		
		List<Comment> commentlist=service.queryByEntity(co);
		Map<String, Object> map = new HashMap<>();
		map.put("CommentList", commentlist);
		reMap = map;
		
		return SUCCESS;
	}
	
}
