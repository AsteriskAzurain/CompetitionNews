package base.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import base.dao.BBS_CommentDao;
import base.pojo.Comment;

public class BBS_CommentDaoImpl extends HibernateDaoSupport implements BBS_CommentDao{
	@Override
	public int save(Comment c) {
		// TODO Auto-generated method stub
		Serializable result = this.getHibernateTemplate().save(c);
		Integer c_cid = (Integer)result;
		return c_cid;
	}

	@Override
	public List<Comment> queryAll() {
		// TODO Auto-generated method stub
		List<Comment> rs=this.getHibernateTemplate().find("from Comment c");
		System.out.println("dao succeed");
		return rs;
	}

	@Override
	public List<Comment> queryByEntity(Comment Comment) {
		// TODO Auto-generated method stub
		String value= Comment.getC_ctext();
		String hql= "from Comment c where c.c_ctext like '%"+value+"%'";
        System.out.println(value);
		List list=this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public void delete(int c_cid) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.queryById(c_cid));
		System.out.println("dao-succuess");
	}

	@Override
	public void update(Comment c) {
		// TODO Auto-generated method stub
		//this.getHibernateTemplate().saveOrUpdate(p);
		Session session = this.getSession();
		////////////////////////////////
		Query query = session.createQuery("update Comment co set co.c_caccount= ? ,co.c_uaccount= ? , co.c_ctext= ? where co.c_cid = ? ");
		query.setInteger(0,c.getC_caccount());
		query.setInteger(1,c.getC_uaccount());
		query.setString(3, c.getC_ctext());
		
		query.executeUpdate();
	}

	@Override
	public Comment queryById(int c_cid) {
		// TODO Auto-generated method stub
		return (Comment)getHibernateTemplate().get(Comment.class, c_cid);
	}
}
