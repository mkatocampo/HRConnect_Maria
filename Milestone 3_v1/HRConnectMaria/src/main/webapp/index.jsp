<%-- 
    Document   : index.jsp
    Created on : Jan 21, 2020, 7:44:12 AM
    Author     : Chris.Cusack
--%>
<style>
table, th, td {
  	padding: 15px;
}

body{
	background-image: url("https://i.ibb.co/TH1f7Gw/pexels-johannes-plenio-1103970.jpg");
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
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <title>HRConnect</title>
    </head>
    <body class="p-4">        
        <br><br><br>	
        <form method="POST">

			<div style="width: fit-content; padding: 20px;margin: auto; opacity: 0.7; background-color: white;">
			<!-- Display details in view mode -->	
				
				<table>
					<tr>
						<td>Username</td>
						<td><input type="text" name="username"/></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password"/></td>
					</tr>
				</table>
				<div style="width: fit-content; padding: 20px;margin: auto;">
				<input class="btn btn-primary" type="submit" value="Log In"/>
				</div>
			<%
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			DAO dao = new DAOImpl();
			User user = dao.validateUser(username,password);
			
			if(username != null || password != null){
			
			if(user.getUsername() != null)
			{%>
			    User is valid 
			<%
				response.sendRedirect("recordList");
			    session.setAttribute("sessusername", username);
			}else{%>
				Invalid user
			<%}
			}%>
			</div>
		</form>
    </body>
</html>
