<%-- 
    Document   : record summary
    Created on : Apr 2, 2022
    Author     : Maria Ocampo

    The view for the process book
    Support
    -Create
    -Saving changes
    -Delete
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.nbcc.model.*"%>

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

<!DOCTYPE html>
<html>
<head>
<%@include file="WEB-INF/jspf/header.jspf"%>
<%
if (session.getAttribute("sessusername") != null) {
%>
<title>Employee</title>
</head>
<body class="p-4">
	<%@include file="WEB-INF/jspf/navigation.jspf"%>
	<div
		style="width: max-width; padding: 20px; margin: auto; opacity: 0.7; background-color: white;">
				<i><h3 style="text-align:center;">Employee Summary</h3></i>
		<%
		Employee deletedRecord = null;
		Employee savedRecord = null;
		Employee createdRecord = null;

		if (request.getAttribute("deletedRecord") != null) {
			deletedRecord = (Employee) request.getAttribute("deletedRecord");
		}

		if (request.getAttribute("savedRecord") != null) {
			savedRecord = (Employee) request.getAttribute("savedRecord");
		}

		if (request.getAttribute("createdRecord") != null) {
			createdRecord = (Employee) request.getAttribute("createdRecord");
		}

		Employee emp = null;

		if (deletedRecord != null) {
		%>
			<div class="alert alert-success" role="alert">Employee with Id: <%=deletedRecord.getId()%> has been deleted</div>

		<%
		} else if (savedRecord != null || createdRecord != null) {
		if (savedRecord != null) {
			emp = savedRecord;%>
			<div class="alert alert-success" role="alert">
			  Employee with Id: <%=savedRecord.getId()%> has been successfully updated. 
			</div><%
		}
		if (createdRecord != null) {
			emp = createdRecord;%>
			<div class="alert alert-success" role="alert">
			  Employee with Id: <%=createdRecord.getId()%> has been successfully created. 
			</div><%
		}
		%>

		<table class="table table-striped">
			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Date of Birth</th>
				<th>Gender</th>
				<th>Country</th>
				<th>Email</th>
				<th>Hired Date</th>
				<th>Terminated Date</th>
				<th>Is Active</th>
			</tr>
			<tr>
				<td><a href="<%=emp.getId()%>"><%=emp.getId()%></td>
				<td><%=emp.getFirstName()%></td>
				<td><%=emp.getLastName()%></td>
				<td><%=emp.getDob()%></td>
				<td><%=emp.getGender()%></td>
				<td><%=emp.getCountry()%></td>
				<td><%=emp.getEmail()%></td>
				<td><%=emp.getHiredDate()%></td>
								<td><%if (emp.getTerminatedDate() == null){%>
					N/A
					<%}else{ %> 
						<%=emp.getTerminatedDate()%>
					<%}%>
				</td>
				<td><%=emp.isActive()%></td>
			</tr>
		</table>
		<%
		} else {
		%>
		<a href="${pageContext.request.contextPath}/recordList">Employee
			List</a>
		<%
		}
		%>
					<%
	} else {
	response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	%>
	</div>
</body>
</html>
