package base.service;

import java.util.List;

import base.dao.impl.BBS_PostsDaoImpl;
import base.pojo.BBS_Posts;

public class BBS_post_service {
	private BBS_PostsDaoImpl dao;

	public BBS_PostsDaoImpl getDao() {
		return dao;
	}

	public void setDao(BBS_PostsDaoImpl dao) {
		this.dao = dao;
	}
	
	public int save(BBS_Posts po) {
		int p_pid=dao.save(po);
		if(p_pid>=601) return p_pid;
		else return 0;
	}
	 public void delete(int p_pid) {
		 dao.delete(p_pid);
	 }
	 
	 public void update(BBS_Posts po) {
		 dao.update(po);
	 }
	 
	 public List<BBS_Posts> queryall(){
		 List<BBS_Posts> rs=dao.queryAll();
		 System.out.println("service succeed");
		 return rs;
	 }
	 
	 public List<BBS_Posts> queryByEntity(BBS_Posts po){
		 List<BBS_Posts> rs=dao.queryByEntity(po);
		 return rs;
	 }
	 
	 public BBS_Posts queryById(int p_pid) {
		 BBS_Posts po=dao.queryById(p_pid);
		 return po;
	 }
	
	
}
