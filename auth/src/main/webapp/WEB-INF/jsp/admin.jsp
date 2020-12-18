<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User List</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-table@1.18.1/dist/bootstrap-table.min.css">

</head>
<body>
	<table border="1" width="80%" align="center">
		<tr>
			<td height="350px" valign="top" width="100%">

				<h3>User List</h3>
				<form action="<s:url value="/checkbx"/>" method="get">
					<div id="toolbar">
						<button id="block" name="actions" value="block"
							class="btn btn-danger">Block</button>
						<button id="unblock" name="actions" value="unblock"
							class="btn btn-danger">
							<i class="fa fa-unlock"></i>
						</button>
						<button id="remove" name="actions" value="remove"
							class="btn btn-danger">
							<i class="fa fa-trash"></i>
						</button>
					</div>
					<table id="table" data-toggle="table" data-toolbar="#toolbar" data-click-to-select="true"
						 border="1" data-id-field="id" data-select-item-name="cid" cellpadding="3" width="100%">

						<thead>
							<tr>
								<th data-checkbox=true></th>
								<th data-field="id">ID</th>
								<th>NAME</th>
								<th>EMAIL</th>
								<th>REGISTRY DATE</th>
								<th>LAST LOGIN</th>
								<th>STATUS</th>
							</tr>
						</thead>
						<c:if test="${empty allUsers}">
							<tr>
								<td align="center" colspan="8" class="error">No Records
									Present</td>
							</tr>
						</c:if>

						<c:forEach var="c" items="${allUsers}" varStatus="st">
							<tr>
								<td data-checkbox=true></td>
								<td>${c.id}</td>
								<td>${c.username}</td>
								<td>${c.email}</td>
								<td>${c.registration}</td>
								<td>${c.lastLogin}</td>
								<td>${c.status}</td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</td>
		</tr>
	</table>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script
		src="https://unpkg.com/bootstrap-table@1.18.1/dist/bootstrap-table.min.js"></script>
</body>
</html>