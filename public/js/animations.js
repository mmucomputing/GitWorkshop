$(document).ready(function() {
	$('h1').hide().addClass('animated tada').show();


	$('.person').hide().each(function(i, el) {
		setTimeout(function() {
			$(el).addClass('animated bounceInDown').show();
		}, 500 * i);
	});
});