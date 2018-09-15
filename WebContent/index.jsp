<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.*" %>
 <%@ page import="controller.*" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>index page</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<%@ include file="base.jsp" %><br><br>

<% if(session.getAttribute("username")!=null)
	 	{
		//getServletContext().getRequestDispatcher("/userhome.jsp").forward(request, response);
	 	response.sendRedirect("/newsite/userhome.jsp");
	 	}
	 %>  <br>
<div class="container"><% session.setAttribute("msg"," "); %></div>	<br><br> 
<div class="container">
<div class="row">
	<div class="col-md-10">
					<% List l=DispModel.getPosts();			
					Object post[]=l.toArray();%>
					<%for(Object o:post){										
		 				 PostModelClass pm=(PostModelClass)o; %>
			<form action="postdetails.jsp" method="post">
			<div class="panel panel-danger">
				<div class="panel-heading "><button type="submit" style="border:none;background:none"> <%= pm.getPostTitle() %></button> </div>
				<div class="panel-body"><p><%= pm.getPostBody() %>s</p></div>
				<input type="hidden" name="posttitle" value="<%= pm.getPostTitle() %>">
				<input type="hidden" name="postbody" value="<%= pm.getPostBody() %>">
				<input type="hidden" name="username" value="<%= pm.getUserName() %>">
				<input type="hidden" name="postid" value="<%= pm.getPostId() %>">
				</div>
			</form>
			<% } %>
		
	</div>
</div>
</div>
</body>
</html>