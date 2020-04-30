package base.dao;

import java.util.List;

import base.pojo.Competition_Type;

public interface Competition_TypeDao {
	public int save(Competition_Type t);

	public List queryAll();

	public Competition_Type queryById(int type_id);
	
	public List<Competition_Type> queryByEntity(Competition_Type Competition_Type);
	
	public void delete(int type_id);
	
	public void update(Competition_Type t);
}
