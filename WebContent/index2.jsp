<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="models.*" %>
 <%@ page import="controller.*" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home</title>
<link rel="stylesheet" href="css/bootstrap.min.css" >
</head>
<body>
	<%@ include file="base.jsp" %><br>
	<% session.setAttribute("msg",""); %>
	<!-- <ul class="nav nav-tabs">
	  <li role="presentation" ><a href="#">Home</a></li>
	  <li role="presentation"><a href="posts.jsp">posts</a>
	  <li role="presentation" style="float:right;"><a href="login.jsp">Login</a></li>
	  <li role="presentation" style="float:right;"><a href="signup.jsp">SignUp</a></li>
	</ul> -->
<br><br>
<%-- <% List list=PostClass.getPosts();
	Object[] o=list.toArray();
	for(int i=o.length-1;i>=0;i--)
	{
		PostClass p=(PostClass)o[i];
		out.print(p.getUserName()); %><br><%
		out.print(p.getPostTitle()); %> <br><%
		out.print(p.getPostBody()); %><br><%
	}
	%> --%> 
<%! int postid; %>
	<div class="container">
	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading"><center>Posts</center></div>
		<% List l=DispModel.getPosts();
			
			Object post[]=l.toArray();%>
	  <!-- Table -->
	  <table class="table">
	  <%for(Object o:post)
			{
		  PostModelClass pm=(PostModelClass)o; %>
		 
	  	<tr><td><h3><%= pm.getPostTitle() %></h3></td></tr>
	  	<tr><td><small>post by:<%= pm.getUserName() %></small></td></tr>
	  	<tr><td>post body:<%= pm.getPostBody() %></td></tr>
	  	<% postid=pm.getPostId(); %>
	  	<% List l1=DispModel.getComm(postid);
			
			Object com[]=l1.toArray();%>
			<%for(Object a:com)
			{
		  CommentModel cm=(CommentModel)a; %>
	  	<tr><td>comment:<%= cm.getComment()%> </td></tr>
	  	<%} %>
	  	<% } %>
	  	<tr><td></td></tr>
	  	<tr><td> </td></tr>
	  </table>
	</div>
	</div>
	<%-- <% List l=DispModel.getPosts();
		Object post[]=l.toArray();
		for(Object o:post)
		{
			PostModelClass pm=(PostModelClass)o;
			out.print(pm.getUserName()); %><br><%
			out.print(pm.getPostTitle()); %><br><%
			out.print(pm.getPostBody());%> <br><%
		}
	%> --%>
</body>
</html>