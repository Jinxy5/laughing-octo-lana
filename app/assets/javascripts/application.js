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
//= require my_flex
//

$(document).ready(function() {

  function getBreakpoint(){
    // also cleans the breakpoint (some browsers add inverted commas)
    return $('#viewport').css('font-size').replace(/.*(1|2|3|4).*/g, '$1');
  }

  function reappendSlider(sliderId){
    console.log( 'reappended' );
    var slider =  $(document).find( '#' + sliderId )
    var sliderParent = $(document).find( '#' + slider.parent().attr('id') );
    var sliderHtml = $(slider).html();     

    slider.remove();   

    sliderParent.append('<div id = "' +  sliderId + '"></div>');
    $(document).find( '#' + sliderId ).append( sliderHtml );

  }

  function launchSlider(sliderId, a){
    console.log('launched!')

    var o = {
      'namespace' : 'flex-',
      'selector' : '.slides > li',
      'animation' : 'slide',
      'easing' : 'swing',
      'direction' : 'horizontal', 
      'reverse' : false,
      'animationLoop' : true, 
      'smoothHeight' : false,
      'startAt' : 0,
      'slideshowSpeed' : 7000,
      'animationSpeed' : 600,
      'initDelay' : 0,
      'randomize' : false,
      'pauseOnAction' : true,
      'pauseOnHover' : false,
      'useCSS' : true,
      'touch' : false,
      'video' : false,
      'controlNav' : false,
      'directionNav' : false,
      'prevText' : 'Previous',
      'nextText' : 'Next',
      'keyboard' : false,
      'multipleKeyboard' : false,
      'mousewheel' : false,
      'pausePlay' : false,
      'pauseText' : 'Pause',
      'playText' : 'Play',
      'controlsContainer' : '',
      'manualControls' : '',
      'sync' : '',
      'asNavFor' : '',
      'itemWidth' : '',
      'itemMargin' : '',
      'minItems' : 0,
      'maxItems' : 0,
      'move' : 1,
      'start' : function(){},
      'before' : function(){},
      'after' : function(){},
      'end' : function(){},
      'added' : function(){},
      'removed' : function(){}
    }

    $.extend(o, o, a);

 //   if(initial == false){
 //     reappendSlider(sliderId)
 //   }

    o['minItems'] = o['maxItems']
    o['itemWidth'] = $(document).find( '#' + sliderId ).width() / o['maxItems']

    $(document).find( '#' + sliderId ).flexslider({
      namespace : o['namespace'],
      selector : o['selector'],
      animation : o['animation'],
      easing : o['easing'],
      direction : o['direction'], 
      reverse : o['reverse'],
      animationLoop : o['animationLoop'], 
      smoothHeight : o['smoothHeight'],
      startAt : o['startAt'],
      slideshowSpeed : o['slideshowSpeed'],
      animationSpeed : o['animationSpeed'],
      initDelay : o['initDelay'],
      randomize : o['randomize'],
      pauseOnAction : o['pauseOnAction'],
      pauseOnHover : o['pauseOnHover'],
      useCSS : o['useCSS'],
      touch : o['touch'],
      video : o['video'],
      controlNav : o['controlNav'],
      directionNav : o['directionNav'],
      prevText : o['prevText'],
      nextText : o['nextText'],
      keyboard : o['keyboard'],
      multipleKeyboard : o['multipleKeyboard'],
      mousewheel : o['mousewheel'],
      pausePlay : o['pausePlay'],
      pauseText : o['pauseText'],
      playText : o['playText'],
      controlsContainer : o['controlsContainer'],
      manualControls : o['manualControls'],
      sync : o['sync'],
      asNavFor : o['asNavFor'],
      itemWidth : o['itemWidth'],
      itemMargin : o['itemMargin'],
      minItems : o['minItems'],
      maxItems : o['maxItems'],
      move : o['move'],
      start : o['start'],
      before : o['before'],
      after : o['after'],
      end : o['end'],
      added : o['added'],
      removed : o['removed']
    });    

  }

  function loopSliders(maxItems, itemWidth){
    $.map( typeASlidersIds, function( typaASliderId ){    


      slider = $(document).find( '#' + typaASliderId )
      sliderId = slider.attr('id');


      if(initial == false){
        reappendSlider(sliderId)
      }

      launchSlider(sliderId, {'maxItems' : maxItems, 'itemMargin' : itemWidth });
      
    });
  }

//$(document).find( '#' + sliderId ).width() / 1
  function xsBreakpoint(){
    loopSliders(1, 0);
  }

  function smBreakpoint(){
    loopSliders(4, 10);
  }

  function mdBreakpoint(){
    smBreakpoint();
  }

  function lgBreakpoint(){
    mdBreakpoint();
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
      // below is run every 1/4 of a second!
        var newBreakpoint = getBreakpoint(); 
 
        $.map( typeASlidersIds, function( typaASliderId ){
          $(document).find( '#' + typaASliderId ).resize();
        });  


        if(newBreakpoint != currentBreakpoint){

          launchBreakpoint( newBreakpoint );

          currentBreakpoint = newBreakpoint
        }
      // above is run every 1/4 of a second! 
    }, 250)
  });
});