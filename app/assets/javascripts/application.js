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
//= 
//= require jquery1.11
// require turbolinks
//= require after_resize
//= require_tree .
//= require bootstrap.min
//= require responsive
//= require my_flex
//

// Can also be used with $(document).ready()
$(document).ready(function() {



  function getBreakpoint(){
    // also cleans the breakpoint (some browsers add inverted commas)
    return $('#viewport').css('font-size').replace(/.*(1|2|3|4).*/g, '$1');
  }



  function reappendSlider(sliderId){

    var slider =  $(document).find( '#' + sliderId )
    var sliderParent = $(document).find( '#' + slider.parent().attr('id') );
    var sliderHtml = $(slider).html(); 
      


    slider.remove();   

    sliderParent.append('<div id = "' +  sliderId + '"></div>');
    $(document).find( '#' + sliderId ).append( sliderHtml );

  }



  function xsBreakpoint(){

      $.map( typeASlidersIds, function( typaASliderId ){
            

        var slider = $(document).find( '#' + typaASliderId )
        var sliderId = slider.attr('id');



        if(initial == false){
         // console.log('resetting for xs');

          reappendSlider(sliderId)
        }

        $(document).find( '#' + sliderId ).flexslider({
          useCSS: false,
          slideshow: false,
          animation: 'slide',
          slideshowSpeed: 1000,
          animationLoop: true,
          itemMargin: 0,
          controlNav: false,
          directionNav: false,
          move: 1,
          itemWidth: $(document).find( '#' + sliderId ).width() / 1,
          minItems: 1,
          maxItems: 1, 
        });      
    });
  }

  function smBreakpoint(){

      $.map( typeASlidersIds, function( typaASliderId ){
        


        var slider = $(document).find( '#' + typaASliderId )
        var sliderId = $(slider).attr('id');



        if(initial == false){
         // console.log('resetting for sm');
          reappendSlider(sliderId)
        }

       // console.log( $(document).find( '#' + sliderId ).find() );

         
         $(document).find( '#' + sliderId ).flexslider({
          useCSS: false,
          slideshow: false,
          animation: 'slide',
          slideshowSpeed: 1000,
          animationLoop: true,
          itemMargin: 10,
          controlNav: false,
          directionNav: false,
          move: 1,
          itemWidth: $(document).find( '#' + sliderId ).width() / 2,
          minItems: 4,
          maxItems: 4, 
        });      

    });
  }

  function mdBreakpoint(){
         $.map( typeASlidersIds, function( typaASliderId ){
        


        var slider = $(document).find( '#' + typaASliderId )
        var sliderId = $(slider).attr('id');



        if(initial == false){
         // console.log('resetting for md');
          reappendSlider(sliderId)
        }

       // console.log( $(document).find( '#' + sliderId ).find() );

         $(document).find( '#' + sliderId ).flexslider({
          useCSS: false,
          slideshow: false,
          animation: 'slide',
          slideshowSpeed: 1000,
          animationLoop: true,
          itemMargin: 10,
          directionNav: false,
          controlNav: false,
          move: 1,
          itemWidth: $(document).find( '#' + sliderId ).width() / 2,
          minItems: 4,
          maxItems: 4, 
        });      

    });
  }

  function lgBreakpoint(){
     $.map( typeASlidersIds, function( typaASliderId ){
        


        var slider = $(document).find( '#' + typaASliderId )
        var sliderId = $(slider).attr('id');

        if(initial == false){
         // console.log('resetting for lg');
          reappendSlider(sliderId)
        }

       // console.log( $(document).find( '#' + sliderId ).find() );

         $(document).find( '#' + sliderId ).flexslider({
          useCSS: false,
          slideshow: false,
          animation: 'slide',
          slideshowSpeed: 1000,
          animationLoop: true,
          directionNav: false,
          itemMargin: 10,
          controlNav: false,
          move: 1,
          itemWidth: $(document).find( '#' + sliderId ).width() / 2,
          minItems: 4,
          maxItems: 4, 
        });      

    });
  }

  function launchBreakpoint(breakpoint){

  


    switch( breakpoint ){
      case '1':
        xsBreakpoint();
      break;
      case '2':
        smBreakpoint();
      break;
      case '3':
        mdBreakpoint();
      break;
      case '4':
        lgBreakpoint();
      break;
    }

    initial = false
  }

  var typeASlidersIds = []

  $('.sliderTypeA').each(function( key, sliderTypeAId ){
    typeASlidersIds.push( $(sliderTypeAId).attr('id') );
  });

  // get the current breakpoint
  var currentBreakpoint = getBreakpoint();
  var initial = true

 
  // typeASlidersIds.push( $('.sliderTypeA') )

  launchBreakpoint(currentBreakpoint);


  $.map( typeASlidersIds, function( typaASliderId ){

    var slider = $(document).find( '#' + typaASliderId ),
        sliderParent = slider.parent().parent(),
        sliderLeftNav = sliderParent.find( '.left-nav'),
        sliderRightNav = sliderParent.find( '.right-nav')

      sliderLeftNav.click(function(){
        $(document).find( '#' + typaASliderId ).flexslider('prev');
      });


      sliderRightNav.click(function(){
        $(document).find( '#' + typaASliderId ).flexslider('next');
      });  

  });

       


  // after resize
  var timer;
  $(window).resize(function(){
    clearTimeout(timer);
    timer = setTimeout( function(){
      // 1/4 second after resize prevents crashing the browser
        var newBreakpoint = getBreakpoint(); 
 
        $.map( typeASlidersIds, function( typaASliderId ){
          $(document).find( '#' + typaASliderId ).resize();
        });  


        if(newBreakpoint != currentBreakpoint){
         // console.log('*');

          launchBreakpoint( newBreakpoint );

        //  lastBreakpoint = currentBreakpoint
          currentBreakpoint = newBreakpoint


        }
      //
    }, 250)
  });
/*
  $('#slider-2').on('resize', function(event){
    event.stopPropagation();
  });

  function set_slide_number(selector, integer){
    selector.data('flexslider').setOpts({ minItems: integer, maxItems: integer });
    $('#slider-2').flexslider(1);
  }

  function find_slide(num){
//    return $('#slider-2 ul li:nth-child(' + num +')')
  }

  function deapplyclass(num){
  //  $('#slider-2 .flex-viewport ul li:nth-child(' + num +')').removeClass('no-margin');
  }
  
  function applyclass(num){
 //   $('#slider-2 .flex-viewport ul li:nth-child(' + num +')').addClass('no-margin');
 
 // yay   find_slide(num).addClass('no-margin');
  }



  function breakpoints(){
      if ( Response.band(0, 768) )
      {
//        selector.data('flexslider').setOpts({ minItems: integer, maxItems: integer, move: 1, itemWidth: $('#slider-2').width() / 4 });
        
        $('#slider-2').data('flexslider').setOpts({ minItems: 1, maxItems: 1 });


        $('#slider-2').flexslider(1);

//        set_slide_number( $('#slider-2'), 1 )

      }
      else if ( Response.band(768, 992) )
      {
        set_slide_number( $('#slider-2'), 4 )
      }
      else if ( Response.band(992, 1200) )
      {
        set_slide_number( $('#slider-2'), 4 )
      }
      else if ( Response.band(1200) )
      {
//       // console.log('lg')
        set_slide_number( $('#slider-2'), 4 )
      }
  }




  var all_sliders = []

  $('#slider-2').flexslider({
    slideshow: false,
    animation: 'slide',
    animationLoop: false,
    itemWidth: $('#slider-2').width() / 4,
    minItems: 4,
    maxItems: 4, 
    itemMargin: 20,
    move: 1,
    start: function(){

      $('#slider-2').resize();

      var last_slide,
          prev_last_slide = $('#slider-2').data('flexslider').minItems
      

      breakpoints()
      applyclass(last_slide);
    },
    before: function(){
        var direction = $('#slider-2').data('flexslider').direction

        var last_slide,
            prev_last_slide = $('#slider-2').data('flexslider').minItems

        var move = $('#slider-2').data('flexslider').move
        
        var prev_last_slide = last_slide

       if (direction == 'next') {
           last_slide = last_slide + move 
       } else if ( direction == 'prev') {
          last_slide = last_slide - move 
       }

       deapplyclass(prev_last_slide);
       applyclass('last_slide');

    }
  })

  Response.ready(  ); 




 


/*
    last_slide = 3 // min items
    prev_last_slide = 3 // ;ast
    move = 1 // move
    
    function deapplyclass(num){
       $('.flexslider .slides li:nth-child(' + num +')').removeClass('no-margin');
    }
    
    function applyclass(num){   
      $('.flexslider .slides li:nth-child(' + num +')').addClass('no-margin');
      
  
    }
    
    $('.flexslider').flexslider({
        animation: "slide",
        animationLoop: false,
        itemWidth: 300,
        itemMargin: 15,
        minItems: 3,
        move: 1,
        controlNav: false,
        start: function(){
            applyclass(last_slide);
        },
        before: function (){
      

           direction = $('.flexslider').data('flexslider').direction

           if (direction == 'next') {
               prev_last_slide = last_slide
               last_slide = last_slide + move 
           } else if ( direction == 'prev') {
               prev_last_slide = prev_last_slide + move
               last_slide = last_slide - move 
           }

           deapplyclass(prev_last_slide);
           applyclass(last_slide);

        },
        end: function () {
        }
*/

/*
    $(window).resize(function(){
      waitForFinalEvent( function(){
       // console.log('run:' + $(window).width() );
    /*  $('#slider-2').resize(); 
      }, 1000, 'unique');
    });


$(window).resize(function () {
  waitForFinalEvent(function(){
   // console.log('whut?')
    $('#slider-2').resize();
  }, 1000, 'some unique string');
});


  // The slider being synced must be initialized first
  // CONTROLS
/*
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

*/
   // MAIN
/*
  $('#slider').flexslider({
    animation: "fade",
    controlNav: false,
    directionNav: false,
    animationLoop: true,
    slideshow: false,
    slideshowSpeed: 3500,
    sync: "#carousel",
    useCSS: false

  });

  $('#slider-2, #slider-3').flexslider({
  	animation: 'fade',
  	controlNav: false,
  	directionNav: false,
  	animationLoop: true,
  	slideshowSpeed: 600,
    minItems: 4,
    maxItems: 6,
    useCSS: false
  });
  $('#slider-2').flexslider({
    animation: 'fade',
    controlNav: false,
    directionNav: false,
    animationLoop: true,
    slideshowSpeed: 1000,
    minItems: 2,
    maxItems: 2,
    useCSS: false
  });
  $(window).resize(function(){
    $('#slider-2').data('flexslider').setOpts({        animationLoop: false

});

//   // console.log( $('#slider-2').data('flexslider').getOpts() );
    $('#slider-2').flexslider();

  });


  $('.left-nav').on('click', function(){
  	var slider = $(this).parent().find('.flexslider')
 	slider.flexslider('prev');
  });

  $('.right-nav').on('click', function(){
  	var slider = $(this).parent().find('.flexslider')
 	slider.flexslider('next');
  });





*/
});