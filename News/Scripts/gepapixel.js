$(function () {
	var $chk = $('<input/>').attr({ type: 'checkbox', name: 'actionDelete', id: 'select-all', value: '' });
	$('th:first').append($chk);
});

$(function () {
	$("#deleteActionRun").click(function () {
		return confirm("Are you sure you want to delete?");
	});

	$('#select-all').click(function (event) {
		if (this.checked) {
			// Iterate each checkbox
			$(':checkbox').each(function () {
				this.checked = true;
			});
		}
		if (!this.checked) {
			// Iterate each checkbox
			$(':checkbox').each(function () {
				this.checked = false;
			});
		}
	});
});



$(function () {
    CKEDITOR.replace('Content', {
        filebrowserWindowWidth: 800,
        filebrowserWindowHeight: 600
    });
});