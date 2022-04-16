<%-- 
    Document   : index.jsp
    Created on : April 16, 2022
    Author     : Maria Ocampo
--%>
<style>
table, th, td {
	padding: 15px;
}

body {
	background-image:
		url("https://i.ibb.co/TH1f7Gw/pexels-johannes-plenio-1103970.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.nbcc.model.*"%>
<%@page import="edu.nbcc.dao.*"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="WEB-INF/jspf/header.jspf"%>
<title>HRConnect</title>
</head>
<body class="p-4">
	<div style="width: 500px; margin: auto;">
		<img src="${pageContext.request.contextPath}/Images/hrconnectlogo.jpg"
			width="500px;"></img>
	</div>
	<div
		style="width: 500px; height: auto; padding: 20px; margin: auto; opacity: 0.6; background-color: white;">
		<form method="POST">
			<h5>Please login to proceed</h5>
			<div style="text-align: center;">
				<hr>
				<input type="text" name="username" placeholder="Username"
					class="form-control form-control-lg" /><br /> <input
					type="password" name="password" placeholder="Password"
					class="form-control form-control-lg" /><br /> <input
					style="padding: 15px; width: 200px;" class="btn btn-primary"
					type="submit" value="Log In" />
			</div>

			<br />

			<%
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			DAO dao = new DAOImpl();
			User user = dao.validateUser(username, password);

			if (username != null || password != null) {

				if (user.getUsername() != null) {
					response.sendRedirect("recordList");
					session.setAttribute("sessusername", username);
				} else {
			%>
			<div class="alert alert-danger" role="alert">Login credentials
				is incorrect. Please try again.</div>
			<%
			}
			}
			%>
		</form>
	</div>
</body>
</html>
