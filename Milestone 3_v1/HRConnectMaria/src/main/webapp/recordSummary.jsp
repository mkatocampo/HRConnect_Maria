<%-- 
    Document   : bookSummary
    Created on : Jan 28, 2020, 8:23:04 AM
    Author     : Chris.Cusack

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
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <title>Employee</title>
    </head>
    <body class="p-4">
        <%@include file="WEB-INF/jspf/navigation.jspf" %>
	<br><h2><i>Employee Save</i></h2><br>
	
		<div style="width: fit-content; padding: 20px;margin: auto; opacity: 0.7; background-color: white;">
        	<%
        	Employee deletedRecord = null;
   	    	Employee savedRecord = null;
   	    	Employee createdRecord = null;
   	   	        	    		
    		if (request.getAttribute("deletedRecord") != null){
    			deletedRecord = (Employee)request.getAttribute("deletedRecord");
    		}
      	    		
      		if (request.getAttribute("savedRecord") != null){
      			savedRecord = (Employee)request.getAttribute("savedRecord");
      		}
      		
      		if (request.getAttribute("createdRecord") != null){
      			createdRecord =(Employee)request.getAttribute("createdRecord");
      		}
    	      		
  	      	Employee emp = null;
  	      			
	      	if (deletedRecord != null){
       		%>
       	
		<h2>Employee with Id: <%=deletedRecord.getId()%> has been deleted </h2>
		<%
		} else if (savedRecord != null || createdRecord != null){
			if (savedRecord != null){
				emp = savedRecord;
			}
			if (createdRecord != null){
				emp = createdRecord;
			}	
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
           </table>
    	   <%}else{ %>
    	   <a href="${pageContext.request.contextPath}/recordList">Employee List</a>
      <%}%>
       </div>
    </body>
</html>
