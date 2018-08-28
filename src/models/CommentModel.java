package models;

public class CommentModel {
	private String username;
	private String comment;
	private int postid;
	
	public String getUserName() {
		return username;
	}
	public void setUserName(String username) {
		this.username = username;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setPostId(int postid) {
		this.postid = postid;
	}
	public int getPostId() {
		return postid;
	}	
}
