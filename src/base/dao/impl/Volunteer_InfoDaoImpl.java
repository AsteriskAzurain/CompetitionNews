package base.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import base.dao.Volunteer_InfoDao;
import base.pojo.Volunteer_Info;

public class Volunteer_InfoDaoImpl extends HibernateDaoSupport implements Volunteer_InfoDao {

	@Override
	public int save(Volunteer_Info i) {
		// TODO Auto-generated method stub
		Serializable result = this.getHibernateTemplate().save(i);
		Integer volunteer_id = (Integer)result;
		return volunteer_id;
	}

	@Override
	public List queryAll() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from Volunteer_Info i");
	}

	@Override
	public List<Volunteer_Info> queryByEntity(Volunteer_Info Volunteer_Info) {
		// TODO Auto-generated method stub
		String value= Volunteer_Info.getName();
		String hql= "from Volunteer_Info i where i.name like '%"+value+"%'";
        System.out.println(value);
		List list=this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public void delete(int volunteer_id) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.queryById(volunteer_id));
		System.out.println("dao-succuess");
	}

	@Override
	public void update(Volunteer_Info i) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(i);
	}

	@Override
	public Volunteer_Info queryById(int volunteer_id) {
		// TODO Auto-generated method stub
		return (Volunteer_Info)getHibernateTemplate().get(Volunteer_Info.class, volunteer_id);
	}

}
