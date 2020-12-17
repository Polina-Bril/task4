<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User List</title>
<s:url var="url_css" value="/static/css/style.css" />
<link href="${url_css}" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.18.1/dist/bootstrap-table.min.js"></script>
<script
	src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>

</head>
<body>
	<table border="1" width="80%" align="center">
		<tr>
			<td height="350px" valign="top" width="100%">
				<%-- Page Content Area--%>
				<h3>User List</h3>
				<form action="<s:url value="/checkbx"/>">
					<div id="toolbar">
						<button id="action" value="block" class="btn btn-danger">Block</button>
						<button id="action" value="unblock" class="btn btn-danger">
							<i class="fa fa-unlock"></i>
						</button>
						<button id="action" value="remove" class="btn btn-danger">
							<i class="fa fa-trash"></i>
						</button>

					</div>
					<table id="table" data-toggle="table" data-toolbar="#toolbar"
						border="1" cellpadding="3" width="100%" data-response-handler="responseHandler" 	data-select-item-name="btn">

						<thead>
							<tr>
								<th data-field="state" data-checkbox=true></th>
								<th data-field="ID">ID</th>
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
								<th data-field="state" data-checkbox=true></th>
								<td data-field="ID">${c.id}</td>
								<td>${c.username}</td>
								<td>${c.email}</td>
								<td>${c.registration}</td>
								<td>${c.lastLogin}</td>
								<td>${c.status}</td>
								<!--    <s:url var="url_del" value="/user/del_contact">
                                        <s:param name="cid" value="${c.id}"/>
                                    </s:url>   
                                    <s:url var="url_edit" value="/user/edit_contact">
                                        <s:param name="cid" value="${c.id}"/>
                                    </s:url> 
                                    <td><a href="${url_edit}">Edit</a> | <a href="${url_del}">Delete</a></td>
                               -->
							</tr>
						</c:forEach>
					</table>
					<script>
					  var $table = $('#table')
					  
					   function getIdSelections() {
    return $.map($table.bootstrapTable('getSelections'), function (row) {
      return row.ID
    })
  }
					 					  
					  function responseHandler(res) {
					    $.each(res.rows, function (i, row) {
					      row.state = $.inArray(row.ID, selections) !== -1
					    })
					    return res
					  }
					  $(function() {
						  responseHandler(getIDSelections())
						   
						  })
					 
					</script>
					
				</form>
	</table>
</body>
</html>