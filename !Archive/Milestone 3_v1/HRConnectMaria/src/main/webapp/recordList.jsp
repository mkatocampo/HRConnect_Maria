<%-- 
    Document   : books
    Created on : Jan 21, 2020, 7:44:23 AM
    Author     : Chris.Cusack

    The view to show all books
--%>

<%@page import="java.util.List"%>
<%@page import="edu.nbcc.model.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<!DOCTYPE html>
<html>
<head>
<%@include file="WEB-INF/jspf/header.jspf"%>
<title>Employee Records</title>
</head>
<body class="p-4">
	<%@include file="WEB-INF/jspf/navigation.jspf"%>
	<br><h2><i>List Employee Record</i></h2><br>
	
	<div style="width: fit-content; padding: 20px;margin: auto; opacity: 0.7; background-color: white;">
	<%
	if (request.getAttribute("vm") != null){
		List<Employee> vm = (List<Employee>)request.getAttribute("vm");
		if (vm.size() > 0){
	%>
			
			<table class="table table-striped">
	
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Date  of Birth</th>
					<th>Gender</th>
					<th>Country</th>
					<th>Email</th>
					<th>Hired Date</th>
				</tr>
			
				<% for (Employee emp:vm){%>
				<tr>
					<td><a href="record/<%=emp.getId()%>"><%=emp.getId()%></td>
					<td><%=emp.getFirstName()%></td>
					<td><%=emp.getLastName()%></td>
					<td><%=emp.getDob()%></td>
					<td><%=emp.getGender()%></td>
					<td><%=emp.getCountry()%></td>
					<td><%=emp.getEmail()%></td>
					<td><%=emp.getHiredDate()%></td>
				</tr>
				<%}%>
			</table>
			<div style="width: fit-content; padding: 20px;margin: auto;">
				<button class="btn btn-primary" onclick="window.print()" name="Print" style="width:180px;height: 60px;">Print Employee List</button>
			</div>
			<%}
		}else{
		
	%>
	<h4>No Records</h4>
	<%} %>
	</div>
</body>
</html>
