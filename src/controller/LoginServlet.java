package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbc.DbClass;
import models.ModelClass;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 //  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String password1=request.getParameter("password1");
		HttpSession session=request.getSession();
		/*if(session.getAttribute("username")==null)
		{
			response.sendRedirect("/newsite/login.jsp");
		}*/
		if(username==null || username.equals("") && password1==null || password1.equals(""))
		{
			
			session.setAttribute("msg","Please provide required fields");
			getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
		}else {
			//set values to model class
			ModelClass m=new ModelClass();
			m.setUserName(username);
			m.setPassword1(password1);
			
			String sql="select * from UsersTable where username=? and password=?";
			ResultSet rs=DbClass.loginUser(m,sql);
			try {
				if(rs.next())
				{	
					session=request.getSession();
					session.setAttribute("username",username);
					session.setAttribute("firstname", rs.getString(1));
					session.setAttribute("lastname", rs.getString(2));
					session.setAttribute("mobile", rs.getString(3));
					session.setAttribute("email", rs.getString(4));
					getServletContext().getRequestDispatcher("/userhome.jsp").forward(request, response);
				}
				else {
					 session=request.getSession();
					session.setAttribute("msg","Invalid UserName / Password");
					getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}catch(NullPointerException ne){
				getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
			}			
		}
		//doGet(request, response);
	}

}

