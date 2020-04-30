package base.dao;

import java.util.List;

import base.pojo.Admin;

public interface AdminDao {
	public int save(Admin a);

	public List queryAll();

	public List<Admin> queryByEntity(Admin admin);
	
	public void delete(int adminid);
	
	public Admin queryById(int adminid);
	
	public void update(Admin admin);
}
