
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	
<%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  	if(session.getAttribute("username")==null)
	 	{
	 		response.sendRedirect("/newsite/login.jsp");
	 	}
	 %> 
	 <%@ include file="userbase.jsp" %><br><br><br>
	<!--  <form action="postservlet" method="post">
	 <table><center><th><h3>Create Post</h3></th></center>
	 	 	<tr><td>enter post title</td><td><input type="text" name="posttitle" size="20" pattern="[A-Za-z].{3,}" title="four or more characters only alphabets" required></td></tr>
	 		post body: <input type="textarea" rows="10" cols="" name="postbody"><br>
	 			<tr><td>post body</td><td><textarea rows="2" cols="30" name="postbody"  required></textarea></td></tr>
	 			 <br><br>  <tr><td></td><td> <input type="submit" value="post"></td></tr>
	 			   </table>
	 </form> -->
	 <div class="container">
		<div class="row">
			<div class="col-md-4">
			<form action="postservlet" method="post">
	
				<label for="post title">Post Title</label>
				<input type="text" name="posttitle" class="form-control" placeholder="Post Title" pattern="[A-Za-z].{3,}" required>
				
				<label for="password">Post Body</label>
	<!-- input type="password" name="" class="form-control" placeholder="Post Body"><br> -->
				<textarea rows="5" cols="30" name="postbody" class="form-control" placeholder="Post Title" required></textarea>
				<br>				
				<input type="submit" value="Post" class="btn btn-success">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="Clear" class="btn btn-warning">
			</form>
			</div>
		</div>
	</div>
	<% session.setAttribute("msg", " "); %>
</body>
</html>