package base.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import base.dao.Competition_InfoDao;
import base.pojo.Competition_Info;
import base.pojo.User;

public class Competition_InfoDaoImpl extends HibernateDaoSupport implements Competition_InfoDao {

	@Override
	public int save(Competition_Info i) {
		// TODO Auto-generated method stub
		Serializable result = this.getHibernateTemplate().save(i);
		Integer competition_id = (Integer)result;
		return competition_id;
	}

	@Override
	public List queryAll() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from Competition_Info i");
	}

	@Override
	public List<Competition_Info> queryByEntity(Competition_Info info) {
		// TODO Auto-generated method stub
//		int typeid=info.getType_id();
		String name=info.getName();
//		String hql= "from Competition_Info i where i.type_id="+typeid+" & i.name like '%"+name+"%'";
		String hql= "from Competition_Info i where i.name like '%"+name+"%'";
		List<Competition_Info> list=this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public void delete(int competition_id) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.queryById(competition_id));
		System.out.println("dao-succuess");
	}

	@Override
	public void update(Competition_Info i) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(i);
	}

	@Override
	public Competition_Info queryById(int competition_id) {
		// TODO Auto-generated method stub
		return (Competition_Info)getHibernateTemplate().get(Competition_Info.class, competition_id);
	}

	@Override
	public List<Competition_Info> queryByType(int type_id) {
		// TODO Auto-generated method stub
		String hql= "from Competition_Info i where i.type_id = "+type_id;
		List<Competition_Info> list=this.getHibernateTemplate().find(hql);
		return list;
	}

}
