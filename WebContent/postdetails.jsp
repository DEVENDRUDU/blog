<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="models.*" %>
 <%@ page import="controller.*" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>display</title>


<link rel="stylesheet" href="css/bootstrap.min.css">
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
<%! int postid;%>
<br>
<div class="container">
	<a href="index.jsp"><b>Home</b></a>
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
			  	 <%= cm.getUserName() %>:
			   <%= cm.getComment() %> 
			  	  </li>
			</ul>	  	  
	  	<%} %>
	  		  	
			</div>
		</div>
	</div>
</div> 
<% session.setAttribute("msg"," "); %>
</body>
</html>