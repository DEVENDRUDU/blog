<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage</title>
</head>
<body>
	<%@ include file="base.jsp" %><br><br>
	
	<div class="container">
		<div class="alert alert-warning">
				<h4><%= session.getAttribute("msg") %></h4><br></div>
		<div class="row">
			<div class="col-md-4">
				<form action="signup" method="post"><center><label for="SignUp Form">SignUp Form</label></center><br>
					<label for="firstname">First Name</label>
					<input type="text" name="firstname" class="form-control" pattern="[A-Za-z].{3,}" title="four or more characters only alphabets" placeholder="First Name" required>
					
					<label for="lastname">Last Name</label>
					<input type="text" name="lastname" class="form-control" name="lastname"  pattern="[A-Za-z].{3,}" title="four or more characters only alphabets" placeholder="Last Name" required>
					
					<label for="mobile">Mobile</label>
					<input type="text" name="mobile" class="form-control"  pattern="[9876][0-9]{9}" title="only numbers" placeholder="Mobile Number" required>
					
					<label for="email">E-Mail</label>
					<input type="email" name="email" class="form-control" placeholder="E-Mail" required>
					
					<label for="username">User Name</label>
					<input type="text" name="username" class="form-control"  placeholder="User Name" pattern="[A-Za-z][A-Za-z0-9].{3,}" title="four or more characters including digitss" required>
					
					<label for="password">Password</label>
					<input type="password" name="password1" class="form-control"  pattern="[A-Za-z0-9].{3,}" title="password should be five or more characters"placeholder="Password" required>
					
					<label for="password">Confirm Password</label>
					<input type="password" name="password2" class="form-control"><br>
					
					<input type="submit" value="Submit" class="btn btn-success">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="Reset" class="btn btn-warning">
				</form>
			</div>
		</div>
	</div>
	<!-- 
	<form action="signup" method="post" name="signupform"s onsubmit="return validation()">
	<table class="table">
		<tr><td><b>first name</b> </td><td><input type="text" name="firstname" size="20" pattern="[A-Za-z].{3,}" title="four or more characters only alphabets" required><br></td></tr>
		
		<tr><td><b>last name</b> </td><td><input type="text" name="lastname" size="20" pattern="[A-Za-z].{3,}" title="four or more characters only alphabets" required><br></td></tr>
		
		<tr><td><b>mobile number</b></td><td><input type="text" name="mobile" size="20" pattern="[9876][0-9]{9}" title="only numbers" required><br></td></tr>
		
		<tr><td><b>e-mail </b> </td><td><input type="email" name="email" size="20" required><br></td></tr>
		
		<tr><td><b>user name</b> </td><td><input type="text" name="username" size="20"  placeholder="enter username" pattern="[A-Za-z][A-Za-z0-9].{3,}" title="four or more characters including digitss" required><br></td></tr>
		
		<tr><td><b>password </b></td><td> <input type="password" name="password1" size="20"   pattern="[A-Za-z].{3,}" title="password should be five or more characters" required><br></td></tr>
		
		<tr><td><b>confirm password</b> </td><td><input type="password" name="password2" size="20"   pattern="[A-Za-z].{3,}" title="password should be five or more characters"><br></td></tr>
		
		<tr><td><br></td></tr>
		<tr><td></td><td><input type="submit" value="submit" >
		<input type="reset" value="clear"></td></tr>
		</table>
	</form> -->
	<% session.setAttribute("msg", " "); %>
</body>
</html>