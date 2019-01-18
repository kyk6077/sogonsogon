var docElem = document.documentElement,
	header = document.querySelector( '.cbp-af-header' ),
	didScroll = false,
	changeHeaderOn = 300;

	function init() {
		window.addEventListener( 'scroll', function( event ) {
			if( !didScroll ) {
				didScroll = true;
				setTimeout( scrollPage, 250 );
			}
		}, false );
	}

	function scrollPage() {
		var sy = scrollY();
		if ( sy >= changeHeaderOn ) {
			$(header).attr('class','cbp-af-header cbp-af-header-shrink');
		}
		else {
			$(header).attr('class','cbp-af-header');
		}
		didScroll = false;
	}

	function scrollY() {
		return window.pageYOffset || docElem.scrollTop;
	}

init();
