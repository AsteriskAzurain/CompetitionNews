package base.service;

import java.util.List;

import base.dao.impl.Volunteer_InfoDaoImpl;
import base.pojo.Admin;
import base.pojo.Volunteer_Info;

public class VolunteerCheck {
	public Volunteer_InfoDaoImpl getDao() {
		return dao;
	}

	public void setDao(Volunteer_InfoDaoImpl dao) {
		this.dao = dao;
	}

	private Volunteer_InfoDaoImpl dao;

//	public List<Admin> backloginCheck(Admin admin) {
//		List<Admin> rs = dao.loginCheck(admin);
//			return rs;
//	}
	
	public List<Volunteer_Info> querybyentity(Volunteer_Info volunteer_Info){
		List<Volunteer_Info> rs = dao.queryByEntity(volunteer_Info);
		return rs;
	}
	
	public int regist(Volunteer_Info volunteer_Info) {
		int volunteer_id=dao.save(volunteer_Info);
		if(volunteer_id>=1) return volunteer_id;
		else return 0;
	}
	
	public List<Volunteer_Info> queryall(){
		List<Volunteer_Info> rs = dao.queryAll();
		return rs;
	}
	
	public void delete(int volunteer_id) {
		dao.delete(volunteer_id);
	}
	
	public Volunteer_Info queryById(int volunteer_id) {
		Volunteer_Info v =dao.queryById(volunteer_id);
		System.out.println("querybyid succeed");
		return v;
		
	}
	
	public void update(Volunteer_Info volunteer_Info) {
		dao.update(volunteer_Info);
	}
}
