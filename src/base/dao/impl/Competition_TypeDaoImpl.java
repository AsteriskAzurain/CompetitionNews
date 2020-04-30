package base.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import base.dao.Competition_TypeDao;
import base.pojo.Competition_Type;

public class Competition_TypeDaoImpl extends HibernateDaoSupport implements Competition_TypeDao {

	@Override
	public int save(Competition_Type t) {
		// TODO Auto-generated method stub
		Serializable result = this.getHibernateTemplate().save(t);
		Integer type_id = (Integer)result;
		return type_id;
	}

	@Override
	public List queryAll() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from Competition_Type t");
	}

	@Override
	public List<Competition_Type> queryByEntity(Competition_Type Competition_Type) {
		// TODO Auto-generated method stub
		String value=Competition_Type.getName();
		String hql= "from Competition_Type t where like '%"+value+"%'";
		List list=this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public void delete(int type_id) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.queryById(type_id));
	}

	@Override
	public void update(Competition_Type t) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(t);
	}

	@Override
	public Competition_Type queryById(int type_id) {
		// TODO Auto-generated method stub
		return (Competition_Type)getHibernateTemplate().get(Competition_Type.class, type_id);
	}

}
