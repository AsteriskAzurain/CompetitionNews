package base.dao;

import java.util.List;
import base.pojo.Comment;

public interface BBS_CommentDao {
	public int save(Comment c);

	public List queryAll();

	public Comment queryById(int c_cid);
	
	public List<Comment> queryByEntity(Comment Comment);
	
	public void delete(int c_cid);
	
	public void update(Comment c);
}
