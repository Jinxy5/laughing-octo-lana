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
    slider =  $(document).find( '#' + sliderId )
    sliderParent = $(document).find( '#' + slider.parent().attr('id') );
    sliderHtml = $(slider).html();     

    slider.remove();   

    sliderParent.append('<div id = "' +  sliderId + '"></div>');
    $(document).find( '#' + sliderId ).append( sliderHtml );

  }

  function launchSlider(sliderId, a){

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

  function findSlider(id){
    return $(document).find( '#' + id )
  }

  function loopSliders(maxItems, itemWidth){

 
    $.map( typeASlidersIds, function( value, type ){    


      $.map( value, function( value, key){


          switch(type){
            case 'sliderTypeA':

              slider = findSlider(value)
              sliderParent = slider.parent().parent()
              sliderLeftNav = sliderParent.find('.left-nav')
              sliderRightNav = sliderParent.find('.right-nav')

              if(initial == false){
                reappendSlider(value)
              }

              sliderLeftNav.click(function(){
                findSlider( value ).flexslider('prev');
              });

              sliderRightNav.click(function(){
                findSlider( value ).flexslider('next');
              }); 

              launchSlider(value, {'maxItems' : maxItems, 'itemMargin' : itemWidth });

            break; 

            case 'sliderTypeB':

            break;
          }


      });
    }); 
  }

  function xsBreakpoint(){
    loopSliders(1, 0);
  }

  function smBreakpoint(){
    loopSliders(4, 10);
  }

  function mdBreakpoint(){
    loopSliders(5, 10);
  }

  function lgBreakpoint(){
    loopSliders(5, 10);
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

  /* begin */
  typeASlidersIds = {}
  currentBreakpoint = getBreakpoint()
  initial = true
  timer = 0


  $('.sliderElm').each(function( key, slider ){
    type_class = $(slider).attr('class').split(' ')[0]


    if( typeASlidersIds.hasOwnProperty(type_class) == false) {
      typeASlidersIds[type_class] = []
    }

//    typeASlidersIds[type_class].push(slider);
    typeASlidersIds[type_class].push($(slider).attr('id'));
  });



  /* start now */
  launchBreakpoint(currentBreakpoint);

  /* start after reszie */
  $(window).resize(function(){
      clearTimeout(timer);
      timer = setTimeout( function(){
        // below is run every 1/4 of a second!
          var newBreakpoint = getBreakpoint(); 
   
          $.map( typeASlidersIds, function( typaASliderId ){
            findSlider(typaASliderId).resize();
          });  

          if(newBreakpoint != currentBreakpoint){

            launchBreakpoint( newBreakpoint );

            currentBreakpoint = newBreakpoint
          }
        // above is run every 1/4 of a second! 
      }, 250)
    });
  
});