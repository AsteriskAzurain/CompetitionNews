package base.service;

import java.util.List;

import base.dao.impl.AdminDaoImpl;
import base.pojo.Admin;

public class BackLoginCheck {
	public AdminDaoImpl getDao() {
		return dao;
	}

	public void setDao(AdminDaoImpl dao) {
		this.dao = dao;
	}

	private AdminDaoImpl dao;

	public List<Admin> backloginCheck(Admin admin) {
		List<Admin> rs = dao.loginCheck(admin);
			return rs;
	}
	
	public List<Admin> querybyentity(Admin admin){
		List<Admin> rs = dao.queryByEntity(admin);
		return rs;
	}
	
	public int regist(Admin admin) {
		int adminid=dao.save(admin);
		if(adminid>=1) return adminid;
		else return 0;
	}
	
	public List<Admin> queryall(){
		List<Admin> rs = dao.queryAll();
		return rs;
	}
	
	public void delete(int adminid) {
		dao.delete(adminid);
	}
	
	public Admin queryById(int adminid) {
		Admin a =dao.queryById(adminid);
		System.out.println("querybyid succeed");
		return a;
	}
	
	public void update(Admin admin) {
		dao.update(admin);
	}
}
