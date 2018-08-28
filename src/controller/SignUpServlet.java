package controller;
import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstname= request.getParameter("firstname");
		String lastname= request.getParameter("lastname");
		String mobile= request.getParameter("mobile");
		String email= request.getParameter("email");
		String username= request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2= request.getParameter("password2");
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();

		// set all the values into model class
		if(password1.equals(password2))
		{		
		ModelClass m=new ModelClass();
		m.setFirstName(firstname);
		m.setLastName(lastname);
		m.setMobile(mobile);
		m.setEmail(email);
		m.setUserName(username);
		m.setPassword1(password1);
		
		// call the DatabaseClass to insert data
		String sql1="select username from Users where username='"+username+"'";
		ResultSet rs=DbClass.users(sql1);
		try {
			if(rs.next())
			{	 
				session.setAttribute("msg", "UserName is already exists please try another UserName");
				//pw.println("<h4> username is already exists please try another username</h4>");
				getServletContext().getRequestDispatcher("/signup.jsp").include(request, response);
			}
			else {
				String sql="insert into UsersTable values(?,?,?,?,?,?)";
				String sql2="insert into Users values('"+username+"')";
				DbClass.usersNames(sql2);
				int i=DbClass.registerUser(m,sql);
				
				if(i!=0)
				{
					//pw.println("<h4> successfully registered</h4>");
					//HttpSession session=request.getSession();
					session.setAttribute("msg", "SuccessFully Registered");
					getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
				}else {
					getServletContext().getRequestDispatcher("/signup.jsp").include(request, response);
				}
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		}
		else {
			//pw.println("<h4>password should not be matched</h4>");
			session.setAttribute("msg", "password shoud not be matched");
			getServletContext().getRequestDispatcher("/signup.jsp").include(request, response);
		}
	}
}
