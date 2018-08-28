package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbc.DbClass;
public class DispModel {

	public  static List getPosts()
	{
		List l=new ArrayList();
		String sql="select * from PostTable order by post_id desc";
	ResultSet rs=DbClass.getPost(sql);
	try {
		while(rs.next())
		{
			PostModelClass pm=new PostModelClass();
			int postid=rs.getInt(1);
			pm.setPostId(rs.getInt(1));
			pm.setUserName(rs.getString(2));
			pm.setPostTitle(rs.getString(3));
			pm.setPostBody(rs.getString(4));
			l.add(pm);	
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return l;
	}
	public  static List getComm(int postid)
	{
		List l1=new ArrayList();
		String sql="select * from CommentsTable where postid="+postid+"";
		ResultSet rs=DbClass.getComment(sql);
	try {
		while(rs.next())
		{
			CommentModel cm=new CommentModel();
			cm.setPostId(rs.getInt(1));
			cm.setComment(rs.getString(2));
			cm.setUserName(rs.getString(3));
			l1.add(cm);
		}
	}catch(SQLException e)
	{
		e.printStackTrace();
	}
	return l1;
	}
	public  static List getComm()
	{
		List l1=new ArrayList();
		String sql="select * from CommentsTable";
		ResultSet rs=DbClass.getComment(sql);
	try {
		while(rs.next())
		{
			CommentModel cm=new CommentModel();
			cm.setPostId(rs.getInt(1));
			cm.setComment(rs.getString(2));
			cm.setUserName(rs.getString(3));
			l1.add(cm);
		}
	}catch(SQLException e)
	{
		e.printStackTrace();
	}
	return l1;
	}
}