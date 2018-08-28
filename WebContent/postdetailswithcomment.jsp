<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@ page import="models.*" %>
	 <%@ page import="controller.*" %>
	 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Details in User Side</title>
<link rel="stylesheet" href="css/bootstrap.min.css" >
</head>
<body>
<style type="text/css">
.badge{
		background-color:blue;
	}
	.badge-success{
		background-color:#468847;
	}
	</style>
<br>
<%! int postid;%>

<div class="container">
	<a href="userhome.jsp"><b>Home</b></a>
</div><br><br>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading " style="background-color:#ff99c2"> <%= request.getParameter("posttitle") %></div>
				<div class="panel-footer" style="background-color:#80dfff">Post by: <%=request.getParameter("username") %></div>
				<div class="panel-body"><p><%= request.getParameter("postbody") %></p></div>
				
				<% postid=Integer.parseInt(request.getParameter("postid")); %>
	  	<% List l1=DispModel.getComm(postid);
			
			Object com[]=l1.toArray();%>
			<p style="color:red">Comments <span class="badge"> <%=com.length %></span></p>
			<%for(Object a:com)
			{
		  CommentModel cm=(CommentModel)a; %>
		  <ul class="list-group">
		  			<li class="list-group-item">
			  	  <%= cm.getUserName() %>:<%= cm.getComment()%>
			  	  </li>
			</ul>	  	  
	  	<%} %>
	  		  <div class="container">
		<div class="row">
			<div class="col-md-4">
				<form action="comment" method="post">
					<input type="hidden" name="posttitle" value="<%= request.getParameter("posttitle") %>" >
					<input type="hidden" name="postbody" value="<%= request.getParameter("postbody") %>" >
					<input type="hidden" name="postid" value="<%= postid %>">
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
	  		  	
			</div>
		</div>
	</div>
</div>
</body>
</html>