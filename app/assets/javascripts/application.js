// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap.min

//= require jquery.flexslider
// require jquery.flexslider-min

// Can also be used with $(document).ready()
$(document).ready(function() {
  // The slider being synced must be initialized first

  // CONTROLS
  $('#carousel').flexslider({
    animation: "slide",
    allow_resize: true,
    controlNav: false,
    animationLoop: true,
    slideshow: false,
    itemWidth: 210,
    itemMargin: 5,
    asNavFor: '#slider',
    useCSS: false
  });
   // MAIN
  $('#slider').flexslider({
    animation: "fade",
    controlNav: false,
    directionNav: false,
    animationLoop: true,
    slideshow: true,
    slideshowSpeed: 3500,
    sync: "#carousel",
    useCSS: false

  });

  $('#slider-2, #slider-3').flexslider({
  	animation: 'slide',
  	controlNav: false,
  	directionNav: false,
  	animationLoop: true,
  	slideshowSpeed: 10000,
    minItems: 4,
    maxItems: 6,
    useCSS: false
  });

  $('.left-nav').on('click', function(){
  	var slider = $(this).parent().find('.flexslider')
 	slider.flexslider('prev');
  });

  $('.right-nav').on('click', function(){
  	var slider = $(this).parent().find('.flexslider')
 	slider.flexslider('next');
  });


});