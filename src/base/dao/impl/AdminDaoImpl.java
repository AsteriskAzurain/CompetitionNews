package base.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import base.dao.AdminDao;
import base.pojo.Admin;

public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao {

	@Override
	public int save(Admin a) {
		// TODO Auto-generated method stub
		Serializable result = this.getHibernateTemplate().save(a);
		Integer adminid = (Integer) result;
		return adminid;
	}

	@Override
	public List queryAll() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from Admin a");
	}
	public List<Admin> loginCheck(Admin admin){
		String hql= "from Admin a where a.adminname=? and a.adminpassword=?";
        String[] value= new String[]{admin.getAdminname(), admin.getAdminpassword()};
        List list=this.getHibernateTemplate().find(hql,value);
        System.out.println("loginchecked");
		return list;
	}
	@Override
	public List<Admin> queryByEntity(Admin admin) {
		// TODO Auto-generated method stub
//		Session session =this.getSessionFactory().getCurrentSession();
		String value= admin.getAdminname();
		List<Admin> list=new ArrayList<Admin>(); 
		String hql= "from Admin a where a.adminname like '%"+value+"%'";
//		Query query = session.createQuery(hql);
//		query.setParameter(0, "%" + value + "%");
		list=this.getHibernateTemplate().find(hql);
        System.out.println("querybyeneity:"+list.toString());
		return list;
	}

	@Override
	public void delete(int adminid) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.queryById(adminid));
	}

	@Override
	public Admin queryById(int adminid) {
		// TODO Auto-generated method stub
		return (Admin) getHibernateTemplate().get(Admin.class, adminid);
	}

	@Override
	public void update(Admin admin) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(admin);
	}

}
