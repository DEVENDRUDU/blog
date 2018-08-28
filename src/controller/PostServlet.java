package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbc.DbClass;
import models.PostModelClass;

@WebServlet("/postservlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
/*	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	} */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		/*if(session.getAttribute("username")!=null)
		{
			getServletContext().getRequestDispatcher("/userhome.jsp").forward(request, response);
		}*/
		String posttitle=request.getParameter("posttitle");
		String postbody=request.getParameter("postbody");	
		String username=(String)session.getAttribute("username");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String sendDate = dateFormat.format(date);
		
		PostModelClass ps=new PostModelClass();
		ps.setUserName(username);
		ps.setPostTitle(posttitle);
		ps.setPostBody(postbody);
		ps.setPostTime(sendDate);
		
		String sql="insert into PostTable(username,posttitle,postbody,posttime,post_id) values(?,?,?,?,seq_post_id.Nextval)";
		int i=DbClass.createPost(ps,sql);
		if(i!=0)
		{	
			getServletContext().getRequestDispatcher("/userhome.jsp").forward(request,response);
		} else {
			getServletContext().getRequestDispatcher("/createpost.jsp").include(request,response);
		}
		//doGet(request, response);
	}
}
