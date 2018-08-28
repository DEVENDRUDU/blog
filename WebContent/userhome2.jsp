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
<%! int postid; %>
	 <%@ include file="userbase.jsp" %><br>
 <%-- 	<%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  	if(session.getAttribute("username")==null)
	 	{
	 		response.sendRedirect("newsite/login.jsp");
	 	}
	 %> 
 --%>	 welcome &nbsp;&nbsp;<%= session.getAttribute("username") %>
<div class="container">	 
	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading"><center>Posts</center></div>
		<% List l=DispModel.getPosts();
			Object post[]=l.toArray();%>
	 
	  <table class="table">
	  <%for(Object o:post)
			{
		  PostModelClass pm=(PostModelClass)o;%>
		  <tr><td><h3><%= pm.getPostTitle() %></h3></td></tr>
		 <tr><td><small>post by:<%= pm.getUserName() %></small></td></tr>
	  	<tr><td>post body: <%= pm.getPostBody() %></td></tr>
	  	<tr><td> </td></tr>
	  	<% postid=pm.getPostId(); %>
	  	<% List l1=DispModel.getComm(postid);
			
			Object com[]=l1.toArray();%>
			<%for(Object a:com)
			{
		  CommentModel cm=(CommentModel)a; %>
	  	<tr><td>comment:<%= cm.getComment()%> </td></tr>
	  	<% } %>
	<tr><td>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<form action="comment" method="post">
					<input type="hidden" name="postid" value="<%= pm.getPostId() %>">
	  				<input type="hidden" name="username" value="<%= session.getAttribute("username") %>">
					<!-- <input type="textarea" rows ="4" cols="10" name="comment" placeholder="Comment" required> -->
					<div class="input-group">
					<input type="text" class="form-control" rows ="4" cols="10" placeholder="Comment" name="comment"  title="comment something on post" required> 
					
	      			<span class="input-group-btn">
					<input type="submit" class="btn btn-success" value="Comment" class="form-control"></span></div>
				</form>
			</div>
		</div>
	</div>
  			<%-- <form action="comment" method="post">
  				<input type="hidden" name="postid" value="<%= pm.getPostId() %>">
  				<input type="hidden" name="username" value="<%= session.getAttribute("username") %>">
  				<input type="text" name="comment" value="comment">
  				<input type="submit" value="submit">
  			</form> --%>
  	</td></tr>
  	<% } %>
  </table>
</div>	
</div> 
</body>
</html>