package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbc.DbClass;
import models.CommentModel;
@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comment=request.getParameter("comment");
		int postid=Integer.parseInt(request.getParameter("postid"));
		//HttpSession session=request.getSession();
		//String username=(String)session.getAttribute("username");
		String username=request.getParameter("username");
		CommentModel cm=new CommentModel();
		cm.setComment(comment);
		cm.setPostId(postid);
		cm.setUserName(username);
		
		String sql="insert into CommentsTable(postid,comments,username) values(?,?,?)";
		int b=DbClass.insertComment(cm,sql);
		if(b!=0)
		{
			getServletContext().getRequestDispatcher("/postdetailswithcomment.jsp").forward(request, response);
		}		
	}
}
