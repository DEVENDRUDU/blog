<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.ModelClass" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	
	 <%@ include file="userbase.jsp" %><br><br><br>
	 		<%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  	if(session.getAttribute("username")==null)
	 	{
	 		response.sendRedirect("/newsite/login.jsp");
	 	}
	 %> 
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<form action="profile" method="post">
				<center><label for="SignUp Form " style="color:#cc0044"><center><h3><b><u>Update Profile</u></b></h3></center></label></center><br>
					<label for="firstname">First Name</label>
					<input type="text" name="firstname" class="form-control" pattern="[A-Za-z].{3,}" title="four or more characters only alphabets" placeholder="First Name" value="<%= session.getAttribute("firstname")%>" required>
					
					<label for="lastname">Last Name</label>
					<input type="text" name="lastname" class="form-control" name="lastname"  pattern="[A-Za-z].{3,}" title="four or more characters only alphabets" placeholder="Last Name" value="<%= session.getAttribute("lastname") %>" required>
					
					<label for="mobile">Mobile</label>
					<input type="text" name="mobile" class="form-control"  pattern="[9876][0-9]{9}" title="only numbers" placeholder="Mobile Number" value="<%= session.getAttribute("mobile") %>" required>
					
					<label for="email">E-Mail</label>
					<input type="email" name="email" class="form-control" placeholder="E-Mail" value="<%= session.getAttribute("email") %>" required>
					<br>
					<input type="submit" value="Update" class="btn btn-success">&nbsp;&nbsp;&nbsp;&nbsp;
					
				</form>
			</div>
		</div>
	</div>
	<%-- <form action="profile" method="post">
		<center><table>
			<tr><td>first name </td><td><input type="text" name="firstname" value="<%= session.getAttribute("firstname")%>" size="20" pattern="[A-Za-z].{3,}" title="four or more characters only alphabets" required></td></tr>	
			<tr><td>last name </td><td><input type="text" name="lastname" value="<%= session.getAttribute("lastname") %>" size="20" pattern="[A-Za-z].{3,}" title="four or more characters only alphabets" required></td></tr>
			<tr><td>mobile number</td><td><input type="text" name="mobile" value="<%= session.getAttribute("mobile") %>" size="20" pattern="[9876][0-9]{9}" title="only numbers" required></td></tr>
			<tr><td>e-mail </td><td> <input type="email" name="email" value="<%= session.getAttribute("email") %>" required></td></tr>			
			<tr><td></td><td> <input type="submit" value="update"></td></tr>
			</table></center>
	</form> --%>
</body>
</html>