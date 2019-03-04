<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Customer</title>

	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
			<!-- Add button for new Customer -->
			<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd'; return false;" class="add-button" />			
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
					<!-- get customers from theModel  --> 
				<c:forEach var="cust" items="${customers}">
				
				<!--  construct update Link with customer ID -->
				<c:url var="updateLink" value="/customer/showFormForUpdate">
					<c:param name="customerId" value="${cust.id}" ></c:param>
				</c:url>
				
				<c:url var="deleteLink" value="/customer/delete">
					<c:param name="customerId" value="${cust.id}" ></c:param>
				</c:url>
								
					<tr>
						<td>${cust.firstName}</td>
						<td>${cust.lastName}</td>
						<td>${cust.email}</td>
						<td><a href="${updateLink}">Update</a>
						| <a href="${deleteLink}" onclick="if (!(confirm('Are you sure???????'))) return false" >Delete</a>
						</td>	
					</tr>
				</c:forEach>
				
			</table>
			
		</div>
	</div>

</body>
</html>