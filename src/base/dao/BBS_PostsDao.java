package base.dao;

import java.util.List;
import base.pojo.BBS_Posts;

public interface BBS_PostsDao {
	public int save(BBS_Posts p);

	public List queryAll();

	public BBS_Posts queryById(int p_pid);
	
	public List<BBS_Posts> queryByEntity(BBS_Posts BBS_Posts);
	
	public void delete(int p_pid);
	
	public void update(BBS_Posts p);
}
