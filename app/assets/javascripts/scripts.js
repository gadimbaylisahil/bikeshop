//alerts and notices
$('.alert').on('closed.bs.alert', function () {
  $('alert').hide();
})

//Alert fade out 2,5 seconds
window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 2500);

// product ratings
$(document).on('ready page:load', function(){
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });

    $('.rated').raty({ path: '/assets',
    	readOnly: true,
    	score: function() {
        return $(this).attr('data-score');
    	}
    });
});

// Elevator zoom
$(document).on('ready page:load', function(){
	$('.img-zoom').elevateZoom();
});

