package base.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import base.dao.UserDao;
import base.pojo.Admin;
import base.pojo.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	@Override
	public int save(User u) {
		// TODO Auto-generated method stub
		Serializable result = this.getHibernateTemplate().save(u);
		Integer userid = (Integer) result;
		return userid;
	}

	@Override
	public List queryAll() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from User u");
	}

	public List<User> logincheck(User user) {
		// TODO Auto-generated method stub
		String hql = "from User u where u.username=? and u.password=?";
		String[] value = new String[] { user.getUsername(), user.getPassword() };
		System.out.println(value);
		List list = this.getHibernateTemplate().find(hql, value);
		return list;
	}

	@Override
	public List<User> queryByEntity(User user) {
		// TODO Auto-generated method stub
		String value = user.getUsername();
		List<User> list=new ArrayList<User>(); 
		System.out.println(value);
		String hql = "from User u where u.username like '%"+value+"%'";
		list = this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public void delete(int userid) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.queryById(userid));
		System.out.println("dao-succuess");
	}

	@Override
	public void update(User u) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(u);
	}

	@Override
	public User queryById(int userid) {
		// TODO Auto-generated method stub
		User u=(User) getHibernateTemplate().get(User.class, userid);
		return u;
	}

}
