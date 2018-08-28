package dbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.CommentModel;
import models.ModelClass;
import models.PostModelClass;

public class DbClass {
	private static Connection connect() {
	Connection con=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
			//System.out.println("connected");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException se)
		{
			se.printStackTrace();
		}
		return con;
	}
	public static int registerUser(ModelClass m, String sql) {
		int i=0;
		try {
			Connection con=connect();
			PreparedStatement st=con.prepareStatement(sql);
 			st.setString(1, m.getFirstName());
			st.setString(2, m.getLastName());
			st.setString(3, m.getMobile());
			st.setString(4, m.getEmail());
			st.setString(5, m.getUserName());
			st.setString(6, m.getPassword1());
			i=st.executeUpdate();
			con.commit();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	public static ResultSet loginUser(ModelClass m, String sql) {
		Connection con=connect();
		ResultSet rs=null;
		try {
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, m.getUserName());
			st.setString(2, m.getPassword1());
			rs=st.executeQuery();
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public static int createPost(PostModelClass ps, String sql) {
		Connection con=connect();
		int i=0;
		try {
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, ps.getUserName());
			st.setString(2, ps.getPostTitle());
			st.setString(3, ps.getPostBody());
			st.setString(4, ps.getPostTime());
			//st.setInt(5, seq_post_id.NextVal);
			i=st.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return i;
	}	
	 public static ResultSet getPost(String sql)
	{
		Connection con=connect();
		ResultSet rs=null;
		try {
			PreparedStatement st=con.prepareStatement(sql);
			 rs=st.executeQuery();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return rs; 
	}
	public static ResultSet users(String sql1) {
		Connection con=connect();
		ResultSet rs=null;
		try {
			PreparedStatement st=con.prepareStatement(sql1);
			rs=st.executeQuery();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return rs;
	}
	public static void usersNames(String sql2) {
		
		Connection con=connect();
		PreparedStatement st;
		try {
			st = con.prepareStatement(sql2);
			st.executeUpdate();
			con.commit();
		} catch (SQLException e) {
				e.printStackTrace();
		}
	}
	public static int updateUser(ModelClass m, String sql) {
		int i=0;
		Connection con=connect();
		try {
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, m.getFirstName());
			st.setString(2, m.getLastName());
			st.setString(3, m.getMobile());
			st.setString(4, m.getEmail());
			st.setString(5, m.getUserName());
			i=st.executeUpdate();
			con.commit();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return i;
	}
	public static int insertComment(CommentModel cm, String sql) {
		Connection con=connect();
		int b=0;
		try {
			PreparedStatement st=con.prepareStatement(sql);
			st.setInt(1, cm.getPostId());
			st.setString(2, cm.getComment());
			st.setString(3, cm.getUserName());
			b=st.executeUpdate();
			con.commit();
						
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return b;
	}
	public static ResultSet getComment(String sql) {
		Connection con=connect();
		ResultSet rs=null;
		try {
			PreparedStatement st=con.prepareStatement(sql);
			rs=st.executeQuery();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return rs;
	}
}
