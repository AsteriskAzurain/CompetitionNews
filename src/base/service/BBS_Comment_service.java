
package base.service;

import java.util.List;

import base.dao.impl.BBS_CommentDaoImpl;
import base.pojo.Comment;

public class BBS_Comment_service {
	private BBS_CommentDaoImpl dao;

	public BBS_CommentDaoImpl getDao() {
		return dao;
	}

	public void setDao(BBS_CommentDaoImpl dao) {
		this.dao = dao;
	}
	
	public int save(Comment co) {
		int c_cid=dao.save(co);
		if(c_cid>=600) return c_cid;
		else return 0;
	}
	 public void delete(int c_cid) {
		 dao.delete(c_cid);
	 }
	 
	 public void update(Comment co) {
		 dao.update(co);
	 }
	 
	 public List<Comment> queryall(){
		 List<Comment> rs=dao.queryAll();
		 System.out.println("service succeed");
		 return rs;
	 }
	 
	 public List<Comment> queryByEntity(Comment co){
		 List<Comment> rs=dao.queryByEntity(co);
		 return rs;
	 }
	 
	 public Comment queryById(int c_cid) {
		 Comment co=dao.queryById(c_cid);
		 return co;
	 }
	
	
}
