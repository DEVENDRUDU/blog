package models;
import java.util.ArrayList;
import java.util.List;

public class PostModelClass {
	private String username;
	private String posttitle;
	private String postbody;
	private String posttime;
	private int postid;
	
	public  List getPosts()
	{
		List l=new ArrayList();
		PostModelClass p=new PostModelClass();
		p.setUserName(username);
		p.setPostTitle(posttitle);
		p.setPostBody(postbody);
		l.add(p);
		return l;
	}
	public String getPostTitle() {
		return posttitle;
	}
	public void setPostTitle(String posttitle) {
		this.posttitle = posttitle;
	}
	public String getPostBody() {
		return postbody;
	}
	public void setPostBody(String postbody) {
		this.postbody = postbody;
	}
	public String getPostTime() {
		return posttime;
	}
	public void setPostTime(String posttime) {
		this.posttime = posttime;
	}
	public void setUserName(String username) {
		this.username=username;
	}
	public String getUserName()	{
		return username;
	}
	public void setPostId(int postid) {
		this.postid=postid;
	}
	public int getPostId()
	{
		return postid;
	}
}
