package web.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

import base.dao.impl.Competition_TypeDaoImpl;
import base.pojo.Competition_Info;
import base.pojo.Competition_Type;
import base.service.Competition_info_service;

public class CompetitionInfoAction extends ActionSupport {
	private Competition_info_service service;
	private Map<String, Object> reMap;
	private Competition_TypeDaoImpl typedao;

	@JSON(serialize=false)
	public Competition_info_service getService() {
		return service;
	}
	
	@JSON(serialize=false)
	public Competition_TypeDaoImpl getTypedao() {
		return typedao;
	}

	public void setTypedao(Competition_TypeDaoImpl typedao) {
		this.typedao = typedao;
	}

	public void setService(Competition_info_service service) {
		this.service = service;
	}
	
	public Map<String, Object> getReMap() {
		return reMap;
	}

	public void setReMap(Map<String, Object> reMap) {
		this.reMap = reMap;
	}

	public String cinfoqueryallaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		List<Competition_Info> rs=service.queryall();
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		reMap = map;
		return SUCCESS;
	}

	public String cinfosaveaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String name = request.getParameter("name");
//		String typename= request.getParameter("typename");
//		Competition_Type type=new Competition_Type();
//		type.setName(typename);
//		type=typedao.queryByEntity(type).get(0);
//		int type_id = type.getType_id();
		String id=request.getParameter("type_id");
		int type_id =Integer.parseInt(id);
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		String img = request.getParameter("img");
		String context = request.getParameter("context");
		String tab = request.getParameter("tab");
//		Date time = new java.util.Date() ;
//		String createtime = time.toString();
		
		Competition_Info info=new Competition_Info();
		info.setName(name);
		info.setType_id(type_id);
		info.setTitle(title);
		info.setSummary(summary);
		info.setImg(img);
		info.setContext(context);
		info.setTab(tab);
		info.setCreatime(Calendar.getInstance());
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
	
	public String cinfodeleteaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String id=request.getParameter("competition_id");
		int competition_id=Integer.parseInt(id);
		service.delete(competition_id);
		return SUCCESS;
	}
	
	public String cinfoquerybyentityaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		String name = request.getParameter("name");
//		String id=request.getParameter("type_id");
//		int type_id=Integer.parseInt(id);
		
		Competition_Info info=new Competition_Info();
//		info.setType_id(type_id);
		info.setName(name);
		List<Competition_Info> rs=service.queryByEntity(info);
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		reMap = map;
		
		return SUCCESS;
	}
	
	public String cinfoupdateaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();

		// 可修改的属性：简称、类别、标题、摘要、图片、内容、标签
		String id=request.getParameter("competition_id");
		int competition_id=Integer.parseInt(id);
		String name = request.getParameter("name");
//		String typename= request.getParameter("typename");
//		int type_id = typedao.querybyname(typename);
		String tid=request.getParameter("type_id");
		int type_id =Integer.parseInt(tid);
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		String img = request.getParameter("img");
		String context = request.getParameter("context");
		String tab = request.getParameter("tab");
		
		Competition_Info info=new Competition_Info();
		info.setCompetition_id(competition_id);
		info.setName(name);
		info.setType_id(type_id);
		info.setTitle(title);
		info.setSummary(summary);
		info.setImg(img);
		info.setContext(context);
		info.setTab(tab);
		
		service.update(info);
		
		return SUCCESS;
	}
	
	public String cinfoloadaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();

		String id = request.getParameter("competition_id");
		int competition_id = Integer.parseInt(id);
		
		Competition_Info info = service.queryById(competition_id);
		Map<String, Object> map = new HashMap<>();
		map.put("currentInfo", info);
		reMap = map;
		
		return SUCCESS;
	}
	
	public String cinfoquerybytypeaction() {
		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();

		String id = request.getParameter("type_id");
		int type_id =Integer.parseInt(id);
		
		List<Competition_Info> rs=service.queryByType(type_id);
		Map<String, Object> map = new HashMap<>();
		map.put("resultlist", rs);
		reMap = map;
		
		return SUCCESS;
	}
}
