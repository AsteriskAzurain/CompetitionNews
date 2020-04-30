package base.dao;

import java.util.List;
import base.pojo.Competition_Info;

public interface Competition_InfoDao {
	public int save(Competition_Info i);

	public List queryAll();

	public Competition_Info queryById(int competition_id);
	
	public List<Competition_Info> queryByEntity(Competition_Info Competition_Info);
	
	public void delete(int competition_id);
	
	public void update(Competition_Info i);
	
	public List<Competition_Info> queryByType(int type_id);
}
