package base.service;

import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import base.dao.impl.Competition_InfoDaoImpl;
import base.pojo.Competition_Info;

public class Competition_info_service {
	private Competition_InfoDaoImpl dao;
	
	@JSON(serialize=false)
	public Competition_InfoDaoImpl getDao() {
		return dao;
	}

	public void setDao(Competition_InfoDaoImpl dao) {
		this.dao = dao;
	}
	
	public List<Competition_Info> queryall(){
		List<Competition_Info> rs=dao.queryAll();
		return rs;
	}

	public int save(Competition_Info info) {
		int competition_id=dao.save(info);
		return competition_id;
	}
	
	public void delete(int competition_id) {
		dao.delete(competition_id);
	}
	
	public void update(Competition_Info info) {
		dao.update(info);
	}
	
	public Competition_Info queryById(int competition_id) {
		return dao.queryById(competition_id);
	}
	
	public List<Competition_Info> queryByEntity(Competition_Info info){
		List<Competition_Info> rs=dao.queryByEntity(info);
		return rs;
	}
	
	public List<Competition_Info> queryByType(int type_id) {
		return dao.queryByType(type_id);
	}

}
