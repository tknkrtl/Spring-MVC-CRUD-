<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

	<meta charset="ISO-8859-1">
	<title>List Customers</title>
	<!--  reference our stylesheet -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	
</head>


<body>

	<div id="wrapper">
	
		<div id="header">
			<h2> CRM - Customer Relationship Manager</h2>
		</div>
	
	</div>
	
	<div id="container">
	
		<div id="content">
			<!--  new button : Add Customer -->
			
			<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd'; return false;"
			class="add-button"
			/>			
			
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="tempCustomer" items="${customers}">
				
				<!--  construct an update link with customer id -->
				<c:url var="updateLink" value="/customer/showFormForUpdate">
					<c:param name="customerId" value="${tempCustomer.id}" />
 				</c:url>
 				
 				<!--  construct an delete link with customer id -->
				<c:url var="deleteLink" value="/customer/delete">
					<c:param name="customerId" value="${tempCustomer.id}" />
 				</c:url>
				
				
				<tr>
					<td> ${tempCustomer.firstName}
					<td> ${tempCustomer.lastName}
					<td> ${tempCustomer.email}
					<td> 
						<!-- display the update link -->
						<a href="${updateLink}">Update</a>
						|
						<a href="${deleteLink}"
						onclick="return confirm('Are you sure you want to delete this customer')">Delete</a>					
					</td>
				</c:forEach>
				
			</table>
			
		</div>
	
	</div>

</body>


</html>