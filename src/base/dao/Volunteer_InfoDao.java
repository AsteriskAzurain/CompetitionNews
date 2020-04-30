package base.dao;

import java.util.List;
import base.pojo.Volunteer_Info;

public interface Volunteer_InfoDao {
	public int save(Volunteer_Info i);

	public List queryAll();

	public Volunteer_Info queryById(int volunteer_id);
	
	public List<Volunteer_Info> queryByEntity(Volunteer_Info Volunteer_Info);
	
	public void delete(int volunteer_id);
	
	public void update(Volunteer_Info i);
}
