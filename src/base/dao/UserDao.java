package base.dao;

import java.util.List;

import base.pojo.BBS_Posts;
import base.pojo.User;

public interface UserDao {
	public int save(User u);

	public List<BBS_Posts> queryAll();

	public User queryById(int userid);
	
	public List<User> queryByEntity(User user);
	
	public void delete(int userid);
	
	public void update(User u);
}
