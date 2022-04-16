<%-- 
    Document   : employee list
    Created on : Apr 2, 2022
    Author     : Maria Ocampo

    The view to show all books
--%>

<%@page import="java.util.List"%>
<%@page import="edu.nbcc.model.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<title>Employee Records</title>
</head>
<body class="p-4">
	<%@include file="WEB-INF/jspf/navigation.jspf"%>
	<div
		style="width: max-width; padding: 20px; margin: auto; opacity: 0.7; background-color: white;">
	<i><h3 style="text-align:center;">Employee Records</h3></i><hr>
		<form action="recordList" method="GET">
			<div class="form-row align-items-center">
				<div class="col">
					First Name </br> <input type="text" name="firstName"
						class="form-control" />
				</div>
				<div class="col">
					Last Name </br> <input type="text" name="lastName" class="form-control" />
				</div>
				<div class="col">
					Hire Date </br> <input type="date" name="hireDate" class="form-control" />
				</div>
				<div class="col">
					Terminated Date</br> <input type="date" name="terminatedDate"
						class="form-control" />
				</div>
				<div class="col">
					Is Active</br> <select name="isActive" class="form-control">
						<option value=""></option>
						<option value="1">True</option>
						<option value="0">False</option>
					</select>
				</div>
				<div class="col">
					Gender</br> <select name="gender" class="form-control">
						<option value=""></option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
					</select>
				</div>
				<input type="hidden" name="filter" value="true" />
			</div>
			<div style="width: fit-content; padding-top: 20px; margin: auto;">
				<button type="submit" class="btn btn-primary"
					style="width: 180px; height: 60px;">Apply Filters</button>
			</div>
		</form>
	</div>
	<br />

	<div
		style="width: max-width; padding: 20px; margin: auto; opacity: 0.7; background-color: white;">
		<%
		if (request.getAttribute("vm") != null) {
			List<Employee> vm = (List<Employee>) request.getAttribute("vm");
			if (vm.size() > 0) {
		%>

		<b>Number of Records Found: <%=vm.size()%> records
		</b></br> <b>Report Date: <%=new java.util.Date()%></b></br> </br>

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

			<%
			for (Employee emp : vm) {
			%>
			<tr>
				<td><a href="record/<%=emp.getId()%>"><%=emp.getId()%></td>
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
			<%
			}
			%>
		</table>
		<div style="width: fit-content; padding: 20px; margin: auto;">
			<button class="btn btn-primary" onclick="window.print()" name="Print"
				style="width: 180px; height: 60px;">Print Employee List</button>
		</div>
		<%
		}
		} else {
		%>
		<h4>No Records</h4>
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
