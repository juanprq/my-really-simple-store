(function($){
	$(document).ready(function(){
		$('a.destroy').click(function(event) {
			event.preventDefault();
			url = $(this).attr('href');
			window.location.href = url + '?_method=delete';
		});
	});
})($);