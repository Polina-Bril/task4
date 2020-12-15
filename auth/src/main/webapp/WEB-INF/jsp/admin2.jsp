<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Task 4</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</head>
<body>
<!--<#include "navbar.ftlh"> -->
<div class="container mt-5">
   <div id="toolbar">
      <button id="block" class="btn btn-danger" disabled>
      Block
    </button>
    <button id="unblock" class="btn btn-danger" disabled>
       <i class="fa fa-unlock"></i>
    </button>
                <button id="remove" class="btn btn-danger" disabled>
      <i class="fa fa-trash"></i>
    </button>
         
       </div>
  <table
    id="table"
    data-toolbar="#toolbar"
    data-toggle="table"
    data-height="460"
    data-checkbox-header="true"
    data-click-to-select="true"
    data-show-refresh="true"
    data-response-handler="responseHandler">
    <thead>
      <tr>
        <th data-field="state" data-checkbox="true"></th>
        <th data-field="id">User ID</th>
        <th data-field="name">UserName</th>
        <th data-field="mail">E-mail</th>
        <th data-field="regDate">Registry Date</th>
        <th data-field="loginDate">Last Log-In Date</th>
       <th data-field="status">Status</th>
      </tr>
    </thead>
    <c:forEach items="${allUsers}" var="user">
    <tr>
		<th data-field="state" data-checkbox="true"></th>
      <th data-field="id">${user.id}</th>
      <th data-field="name">${user.username}</th>
      <th data-field="mail">${user.email}</th> 
      <th data-field="regDate">${user.registration}</th>
      <th data-field="loginDate">Last Log-In Date</th>
     <th data-field="status">st</th>
          
      </tr>
    </c:forEach>
  </table>
  <script>
    var $table = $('#table')
    var selections = []

    function getIdSelections() {
      return $.map($table.bootstrapTable('getSelections'), function (row) {
        return row.id
      })
    }

    function responseHandler(res) {
      $.each(res.rows, function (i, row) {
        row.state = $.inArray(row.id, selections) !== -1
      })
      return res
    }

    function initTable() {
       $table.on('check.bs.table uncheck.bs.table ' +
        'check-all.bs.table uncheck-all.bs.table',
      function () {
        $remove.prop('disabled', !$table.bootstrapTable('getSelections').length)

        selections = getIdSelections()
      })
  }
    $(function() {
      initTable()

    })
  </script>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- <script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script> -->
<script src="https://unpkg.com/bootstrap-table@1.18.1/dist/bootstrap-table.min.js"></script>
</body>
</html>
