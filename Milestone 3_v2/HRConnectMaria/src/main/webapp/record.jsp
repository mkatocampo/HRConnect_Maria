<%-- 
    Document   : employee
    Created on : Apr 2, 2022
    Author     : Maria Ocampo


    The view supports a retrieval / creation of employee information

--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.nbcc.model.*"%>


<style>
table, th, td {
	padding: 15px;
}

td {
	width: 150px;
}

body {
	background-image:
		url("https://i.ibb.co/TH1f7Gw/pexels-johannes-plenio-1103970.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

@media print {
	.no-print, .no-print * {
		display: none !important;
	}
}
</style>
<!DOCTYPE html>
<html>
<head>
<%@include file="WEB-INF/jspf/header.jspf"%>
<%
if (session.getAttribute("sessusername") != null) {
%>
<title>Employee Record</title>

</head>

<body class="p-4">
	<%@include file="WEB-INF/jspf/navigation.jspf"%>
	<%
	if (request.getAttribute("vm") != null) {
		EmployeeModel vm = (EmployeeModel) request.getAttribute("vm");
	%>
	<div
		style="width: max-width; padding: 20px; margin: auto; opacity: 0.7; background-color: white;">
		<i><h3 style="text-align:center;">Employee Information Sheet</h3></i>
		<hr>
		<form method="POST" action="save">
			<table width="100%">

				<th>Personal Details</th>
				<%
				if (vm.getEmployee() != null && vm.getEmployee().getId() != 0) {
				%>
				<tr>
					<td>Employee Id</td>
					<td>${vm.employee.id}<input type="hidden"
						value='${vm.employee.id}' name="id" /></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<%
				} else {
				%>
				<input type="hidden" value='0' name="id" />
				<%
				}
				%>

				<tr>
					<td>First Name <b style="color: red;">*</b></td>
					<td><input type="text" name="firstName" class="form-control"
						value='${vm.employee.firstName}' required /></td>
					<td>Last Name <b style="color: red;">*</b></td>
					<td><input type="text" name="lastName" class="form-control"
						value='${vm.employee.lastName}' required /></td>
					<td>Date Of Birth <b style="color: red;">*</b></td>
					<td><input type="date" class="form-control" name="dob"
						value='${vm.employee.dob}' required /></td>

				</tr>

				<tr>
					<td>SIN <b style="color: red;">*</b></td>
					<td><input type="number" name="sin" class="form-control"
						value='${vm.employee.sin}' required /></td>
					<td>Gender</td>
					<td><select name="gender" class="form-control">

							<%
							String selectedMale = "";
							String selectedFemale = "";

							if (vm.getEmployee().getId() > 0) {
								selectedMale = vm.getEmployee().getGender().equals("Male") ? "selected" : "";
								selectedFemale = vm.getEmployee().getGender().equals("Female") ? "selected" : "";
							}
							%>

							<option value="Male" <%=selectedMale%>>Male</option>
							<option value="Female" <%=selectedFemale%>>Female</option>
					</select></td>
					<td></td>
					<td></td>

				</tr>
				<th>Address Details</th>
				<tr>
					<td>Street Address <b style="color: red;">*</b></td>
					<td><input type="text" name="streetAddress"
						class="form-control" value='${vm.employee.streetAddress}' required /></td>
					<td>Postal Code</td>
					<td><input type="text" name="postalCode" class="form-control"
						value='${vm.employee.postalCode}' /></td>
					<td>Province <b style="color: red;">*</b></td>
					<td><input type="text" name="province" class="form-control"
						value='${vm.employee.province}' required /></td>
				</tr>

				<tr>
					<td>City</td>
					<td><input type="text" name="city" class="form-control"
						value='${vm.employee.city}' /></td>
					<td>Country <b style="color: red;">*</b></td>
					<td><input type="text" name="country" class="form-control"
						value='${vm.employee.country}' required /></td>
					<td></td>
					<td></td>
				</tr>
				<th>Contact Details</th>
				<tr>
					<td>Email <b style="color: red;">*</b></td>
					<td><input type="email" name="email" class="form-control"
						value='${vm.employee.email}' required /></td>
					<td>Phone Number</td>
					<td><input type="text" name="phoneNumber" class="form-control"
						value='${vm.employee.phoneNumber}' /></td>
					<td></td>
					<td></td>
				</tr>
				<th>Work Details</th>
				<tr>
					<td>Hired Date <b style="color: red;">*</b></td>
					<td><input type="date" name="hiredDate" class="form-control"
						value='${vm.employee.hiredDate}' required /></td>
					<td>Terminated Date</td>
					<td><input type="date" name="terminatedDate"
						class="form-control" value='${vm.employee.terminatedDate}' /></td>
					<td>Is Active <b style="color: red;">*</b></td>
					<td><select name="isActive" class="form-control">

							<%
							String isActive = "";
							String isInactive = "";

							if (vm.getEmployee().getId() > 0) {
								isActive = vm.getEmployee().isActive() ? "selected" : "";
								isInactive = !vm.getEmployee().isActive() ? "selected" : "";
							}
							%>

							<option value="true" <%=isActive%>>true</option>
							<option value="false" <%=isInactive%>>false</option>
					</select></td>
				</tr>

				<tr>
					<td>Salary <b style="color: red;">*</b></td>
					<td><input type="number" name="salary" class="form-control"
						value='${vm.employee.salary}' required /></td>
					<td>Job <b style="color: red;">*</b></td>
					<td><select name="jobId" class="form-control">
							<%
							ArrayList<Job> jobList = (ArrayList<Job>) request.getAttribute("jobList");
							for (Job j : jobList) {
								String selected = j.getId() == vm.getEmployee().getJobId() ? "selected" : "";
							%>
							<option value="<%=j.getId()%>" <%=selected%>><%=j.getJobTitle()%></option>
							<%
							}
							%>
					</select></td>
					<td>EmployeeType <b style="color: red;">*</b></td>
					<td><select name="employeeTypeId" class="form-control">
							<%
							ArrayList<EmployeeType> employeeTypeList = (ArrayList<EmployeeType>) request.getAttribute("employeeTypeList");
							for (EmployeeType et : employeeTypeList) {
								String selected = et.getId() == vm.getEmployee().getEmployeeTypeId() ? "selected" : "";
							%>
							<option value="<%=et.getId()%>" <%=selected%>><%=et.getEmpType()%></option>
							<%
							}
							%>
					</select></td>
				</tr>
			</table>

			<hr>
			<!-- Decide on what buttons to render. When updating, show Save and Delete, create show Create -->
			<div style="width: fit-content; margin: auto;">
				<%
				if (vm.getEmployee() != null && vm.getEmployee().getId() > 0) {
				%>
				<input class="btn btn-primary no-print" type="submit" value="Delete"
					name="action" style="width: 180px; height: 60px;" /> <input
					class="btn btn-primary no-print" type="submit" value="Save"
					name="action" style="width: 180px; height: 60px;" />

				<%
				} else {
				%>

				<input class="btn btn-primary no-print" type="submit" value="Create"
					name="action" style="width: 180px; height: 60px;" />
				<%
				}
				%>
			</div>
		</form>
		<%
		if (vm.getEmployee() != null && vm.getEmployee().getId() > 0) {
		%>
		<div style="width: fit-content; margin: auto;">
			<button class="btn btn-primary no-print" onclick="window.print()"
				style="width: 360px; height: 60px;">Print Employee
				Information</button>
		</div>
		<%
		}
		%>
	</div>

	<%
	}
	%>

	<!--Set up errors here -->
	<%
	if (request.getAttribute("error") != null) {
		ErrorModel em = (ErrorModel) request.getAttribute("error");
		if (em.getErrors() != null && em.getErrors().size() > 0) {
	%>
	<ul class="alert alert-danger">
		<%
		for (String err : em.getErrors()) {
		%>
		<li><%=err%></li>
		<%
		}
		%>
	</ul>
	<%
	}
	}
	%>
	<%
	} else {
	response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	%>
</body>
</html>
