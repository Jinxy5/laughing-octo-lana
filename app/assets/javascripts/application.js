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
$(window).load(function() {
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
    asNavFor: '#slider'
  });
   // MAIN
  $('#slider').flexslider({
    animation: "fade",
    controlNav: false,
    directionNav: false,
    animationLoop: true,
    slideshow: true,
    slideshowSpeed: 3500,
    sync: "#carousel"
  });

  $('#slider-2, #slider-3').flexslider({
  	animation: 'slide',
  	directionNav: false,
  	animationLoop: true,
  	slideshowSpeed: 10000
  });

  $('.hot-panel-1 .left-nav').on('click', function(){
  	$('#slider-2').flexslider('prev');
  });

  $('.hot-panel-1 .right-nav').on('click', function(){
  	$('#slider-2').flexslider('next');
  });
});