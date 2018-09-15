<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	 <%@ page import="models.*" %>
	 <%@ page import="controller.*" %>
	 <%@ page import="java.util.*" %>
	    
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>UserHome</title>
<link rel="stylesheet" href="css/bootstrap.min.css" >
</head>
<body>
<br>
s	<%! int postid; %>
	 <%@ include file="userbase.jsp" %><br>
 	 <%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  	if(session.getAttribute("username")==null)
	 	{
	 		response.sendRedirect("/newsite/login.jsp");
	 	}
  	 %>   <br><br>
	<div class="container"> 
	<p style="color:#000080"><b>
	Welcome &nbsp;&nbsp;<%= session.getAttribute("username") %> </b></p></div><br>
	 
	 	<div class="container">
<div class="row">
	<div class="col-md-10">
					<% List l=DispModel.getPosts();			
					Object post[]=l.toArray();%>
					<%for(Object o:post){										
		 				 PostModelClass pm=(PostModelClass)o; %>
			<form action="postdetailswithcomment.jsp" method="post">
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
	<% session.setAttribute("msg"," "); %>
</body>
</html>