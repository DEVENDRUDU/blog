package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbc.DbClass;
import models.ModelClass;
@WebServlet("/profile")
public class ProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		HttpSession session=request.getSession();
		String username=(String)session.getAttribute("username");
		ModelClass m=new ModelClass();
		m.setUserName(username);
		m.setFirstName(firstname);
		m.setLastName(lastname);
		m.setMobile(mobile);
		m.setEmail(email);
		if(session.getAttribute("username")==null)
		{
			response.sendRedirect("/blogsite/login.jsp");
		}
		String sql="update UsersTable set firstname=?,lastname=?,mobile=?,email=? where username=?";
		int i=DbClass.updateUser(m,sql);
		if(i!=0)
		{
			//HttpSession session=request.getSession();
			//session.setAttribute("username",username);
			session.setAttribute("firstname", firstname);
			session.setAttribute("lastname", lastname);
			session.setAttribute("mobile", mobile);
			session.setAttribute("email", email);
		
			session.setAttribute("msg", "User updated successfully");
			getServletContext().getRequestDispatcher("/userhome.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "User updated profile fail");
			getServletContext().getRequestDispatcher("/updateprofile.jsp").include(request, response);
		}
		//doGet(request, response);
	}

}
