<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>	
	<%@ include file="base.jsp" %>
	<br><br><br><br>
	 <% if(session.getAttribute("username")!=null)
		{%>
		<jsp:forward page="/userhome.jsp" />
		<% } %> 
		
	<%-- <% if(session.getAttribute("username")!=null)
		{%>
		<c:redirect url="/userhome.jsp" />
		<% } %> --%>
	<%-- <% if(session.getAttribute("msg").equals("")) 
		session.setAttribute("msg","   ");
	%>  
	 <%= session.getAttribute("msg") %><br> --%>
	
	<!-- <form action="login" method="post">
		<table class="table">
			<tr><td>user name  </td><td><input type="text" name="username"></td></tr>
			<tr><td>password </td><td> <input type="password" name="password1"></td></tr><br>
			<tr><td></td><td><input type="submit" value="login" class="btn btn-success">
			<input type="reset" value="clear" b></td></tr> 
		</form> </table>-->
	
	<div class="container">
				<div class="alert alert-warning">
				<h4><%= session.getAttribute("msg") %></h4><br></div>
		<div class="row">
			<div class="col-md-4">
			<form action="login" method="post">
	
				<label for="username">User Name</label>
				<input type="text" name="username" class="form-control" placeholder="User Name">
				
				<label for="password">Password</label>
				<input type="password" name="password1" class="form-control" placeholder="Password"><br>
				
				<input type="submit" value="Login" class="btn btn-success">
				<input type="reset" value="Reset" class="btn btn-warning">
			</form>
			</div>
		</div>
	</div>
	<% session.setAttribute("msg", " "); %>
</body>
</html>