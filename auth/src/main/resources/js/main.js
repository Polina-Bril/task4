var $table = $('#table')
var $remove = $('#remove')
var selections = []

function getIdSelections() {
	return $.map($table.bootstrapTable('getSelections'),
		function(row) {
			return row.id
		})
}

function responseHandler(res) {
	$.each(res.rows, function(i, row) {
		row.state = $.inArray(row.id, selections) !== -1
	})
	return res
}
function initTable() {
	$remove.click(function() {
		var ids = getIdSelections()
		$table.bootstrapTable('remove', {
			field: 'id',
			values: ids
		})
	})
}
$(function() {
	initTable()
})