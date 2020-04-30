package base.service;

import java.util.List;

import base.dao.impl.UserDaoImpl;
import base.pojo.Admin;
import base.pojo.User;

public class LoginCheck {

	public UserDaoImpl getDao() {
		return dao;
	}

	public void setDao(UserDaoImpl dao) {
		this.dao = dao;
	}

	private UserDaoImpl dao;

	public List<User> loginCheck(User user) {
		List<User> rs = dao.logincheck(user);
			return rs;
	}
	
	public int regist(User user) {
		int userid=dao.save(user);
		if(userid>101) return userid;
		else return 0;
	}
	
	public List<User> queryall(){
		List<User> rs= dao.queryAll();
		return rs;
	}
	
	public void deleteuser(int userid) {
		dao.delete(userid);
		System.out.println("service-succuess");
	}
	
	public List<User> querybyentity(User user) {
		// TODO Auto-generated method stub
		List<User> rs=dao.queryByEntity(user);
		return rs;
	}
	
	public User querybyid(int userid) {
		User u=dao.queryById(userid);
		return u;
	}
	
	public void update(User user) {
		dao.update(user);
	}
}
