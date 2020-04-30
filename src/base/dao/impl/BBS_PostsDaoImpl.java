package base.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import base.dao.BBS_PostsDao;
import base.pojo.BBS_Posts;

public class BBS_PostsDaoImpl extends HibernateDaoSupport implements BBS_PostsDao{
	@Override
	public int save(BBS_Posts p) {
		// TODO Auto-generated method stub
		Serializable result = this.getHibernateTemplate().save(p);
		Integer p_pid = (Integer)result;
		return p_pid;
	}

	@Override
	public List<BBS_Posts> queryAll() {
		// TODO Auto-generated method stub
		List<BBS_Posts> rs=this.getHibernateTemplate().find("from BBS_Posts p");
		System.out.println("dao succeed");
		return rs;
	}

	@Override
	public List<BBS_Posts> queryByEntity(BBS_Posts BBS_Posts) {
		// TODO Auto-generated method stub
		String value= BBS_Posts.getP_ptheme();
		String hql= "from BBS_Posts p where p.p_ptheme like '%"+value+"%'";
        System.out.println(value);
		List list=this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public void delete(int p_pid) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.queryById(p_pid));
		System.out.println("dao-succuess");
	}

	@Override
	public void update(BBS_Posts p) {
		// TODO Auto-generated method stub
		//this.getHibernateTemplate().saveOrUpdate(p);
		Session session = this.getSession();
		Query query = session.createQuery("update BBS_Posts po set po.p_ptheme= ? , po.p_ptext= ? where po.p_pid = ? ");
		query.setString(0,p.getP_ptheme());
		query.setString(1, p.getP_ptext());
		query.setInteger(2, p.getP_pid());

		query.executeUpdate();
	}

	@Override
	public BBS_Posts queryById(int p_pid) {
		// TODO Auto-generated method stub
		return (BBS_Posts)getHibernateTemplate().get(BBS_Posts.class, p_pid);
	}
}
