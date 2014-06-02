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

//= require jquery1.11
//= require jquery_ujs
// require turbolinks
//= require after_resize
//= require_tree .
//= require bootstrap.min
//= require my_flex
//

$(document).ready(function() {

//////////////


/*
$('textarea').bind("click", function(e){
    insert_character()
     
    var start = $(this).prop('selectionStart'),
        end = $(this).prop('selectionEnd')
    
    console.log( $(this).prop('selectionStart') );
    console.log( $(this).prop('selectionEnd') );
    
    var content = $(this).val();
    var insertion = "ax";
    
    console.log('*')    
    console.log( insertion.length )
    console.log(content.substr(0,3));
    console.log( insertion )
    console.log(content.substr(insertion.length));

    var newContent = content.substr(0,1) + insertion + content.substr(2,content.length);
    $(this).val(newContent);
    // if startposition = a markdown symbol and endposition = the same markdown symbol, remove the characters at the startposition and the end position
});
*/

var start_position,
    end_position,
    last_start_position = null,
    last_end_position = null,
    last_command = { command : null, last_start_position : null, last_end_position : null }
 //     }

$('#insert').bind('click', function(){
  insert_character(2, 'carrot')
});

$('#remove').bind('click', function(){
  remove_character(2)
});



$('#insert_link').bind('click', function(){
  generic_command('add_link', function(start_position, end_position, original_content){ 
    link = "[linkey]("
    end_position = end_position + link.length

    if(end_position !== start_position + 1){ // stops empty bold markdown from being created
      if(get_original()[start_position] !== '['){
        if(get_original()[end_position - 2] !== ')'){ // why -2? I don't even know anymore 

          insert_character(start_position, link)
          insert_character(end_position, ')')

        }
      }      
    }

  });
});

// regex 

// /(\*[^*]\*)/g


$('#remove_link').bind('click', function(){
  generic_command('remove_link', function(start_position, end_position, original_content){ 
    

    end_position = end_position - 1

    console.log( get_original()[start_position] + get_original()[end_position] )


    if(get_original()[start_position] == '['){
      console.log('passed this!')
      if(get_original()[end_position] == ')'){

        console.log('and this!')
        console.log(start_position)
        console.log(end_position)

      length = end_position - start_position

      replace_character(start_position, '', { position_modifier: length + 1})
      // insert_generic(start_position, end_position, 'x')
      // remove_character(start_position); 
      // remove_character(end_position - 1); // - 1 because that's the length of the character we've just taken away (the first *) 
      } 
    }

  });
});

$('#insert_bold').bind('click', function(){
  generic_command('add_bold', function(start_position, end_position, original_content){ 
    insert_generic(start_position, end_position, '*')  
  });
});

$('#remove_bold').bind('click', function(){
  generic_command('remove_bold', function(start_position, end_position, original_content){ 
    remove_generic(start_position, end_position, '*')
  });
});



function insert_generic(start_position, end_position, character){

    end_position = end_position + 1

    if(end_position !== start_position + 1){ // stops empty bold markdown from being created
      if(get_original()[start_position] !== character){
        if(get_original()[end_position - 2] !== character){ // why -2? I don't even know anymore 

          insert_character(start_position, character)
          insert_character(end_position, character)

        }
      }      
    }
}

function remove_generic(start_position, end_position, character){
  end_position = end_position - 1

  if(get_original()[start_position] == character){
    if(get_original()[end_position] == character){
      remove_character(start_position); 
      remove_character(end_position - 1); // - 1 because that's the length of the character we've just taken away (the first *) 
    } 
  }
}

function get_original(){
  return $('textarea').val()
}


function generic_command(name, run){
  var start_position = $('textarea').prop('selectionStart'),
      end_position = $('textarea').prop('selectionEnd'),
      current_command = { command : name, last_start_position : start_position, last_end_position : end_position },
      original_content = $('textarea').val()

  if(current_command !== last_command ){


    run(start_position, end_position, original_content)

    last_command = current_command
  }
  
}



function start_and_end_position(){
}


function replace_character(position, characters, a){
    o = { 
      'position_modifier' : 0
    }
    
    $.extend(o, a);

    console.log('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&')
    console.log(position)
    console.log(position + o['position_modifier'])
    
    var original_content = $('textarea').val(),
        new_content = original_content.substr(0, position) + characters + original_content.substr(position + o['position_modifier'], original_content.length);

    $('textarea').val(new_content)

    
};

function insert_character(position, character){
  
  var original_content = $('textarea').val(),
      current_character = original_content[position]


      if(character !== current_character){
        replace_character(position, character);      
      }

      
}

function remove_character(position){


  var original_content = $('textarea').val(),
    current_character = original_content[position] 


    
    if('*' == current_character){
      replace_character(position, '', { 'position_modifier' : 1 })    
    } else {
  //    console.log('not a star,' + original_content[position] );
    }
}




/////////////
  function getBreakpoint(){
    // also cleans the breakpoint (some browsers add inverted commas)
    return $('#viewport').css('font-size').replace(/.*(1|2|3|4).*/g, '$1');
  }

  function reappendSlider(sliderId){
    slider =  findSlider(sliderId)
    sliderParent = $(document).find( '#' + slider.parent().attr('id') );
    sliderHtml = $(slider).html();


    slider.detach();
    slider.remove();


    sliderParent.append('<div id = "' +  sliderId + '"></div>');
    findSlider(sliderId).append( sliderHtml );

/*
    slider = findSlider(sliderId)
    sliderParent = slider.parent().parent()
    sliderLeftNav = sliderParent.find('.left-nav')
    sliderRightNav = sliderParent.find('.right-nav')

    sliderLeftNav.unbind();
    sliderRightNav.unbind();
*//*
    sliderLeftNav.click(function(){
      findSlider( id ).flexslider('prev');
    });

    sliderRightNav.click(function(){
      findSlider( id ).flexslider('next');
    }); 
*/
  }

  function launchSlider(sliderId, a){

    o = {
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
      'pauseOnAction' : false,
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

    $.extend(o, a);

    o['minItems'] = o['maxItems']
    o['itemWidth'] = findSlider(sliderId).width() / o['maxItems']


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
    
    console.log();
  }

  function launchTypeA(id, maxItems, itemMargin){
   
    if(initial == false){
    
      reappendSlider(id)
    
    } else {

      slider = findSlider(id)
      sliderParent = slider.parent().parent()
      sliderLeftNav = sliderParent.find('.left-nav')
      sliderRightNav = sliderParent.find('.right-nav')



      sliderLeftNav.click(function(){
        findSlider( id ).flexslider('prev');
      });

      sliderRightNav.click(function(){
        findSlider( id ).flexslider('next');
      }); 

    }
    
    launchSlider(id, {'maxItems' : maxItems, 'itemMargin' : itemMargin, 'move' : 1});
  }

  function findSlider(id){
    return $(document).find( '#' + id )
  }

  function loopSliders(){

 
    $.map( typeASlidersIds, function( value, type ){    


      $.map( value, function( value, key){


          switch(type){
            case 'sliderTypeA':

              switch(breakpoint){
                case 'xs':
                    
                //                  console.log('xs');

                  launchTypeA(value, 1, 0)

                break;

                case 'sm':
                  
                              //    console.log('sm');

                  launchTypeA(value, 3, 10)
                  
                break;
                
                case 'md':
    
                //                  console.log('md');

                  launchTypeA(value, 4, 10)
                  
                break;

                case 'lg':
    
                //  console.log('lg');

                 launchTypeA(value, 5, 10)
                  
                break;
              }



            break; 

            case 'sliderTypeB':

              switch(breakpoint){
                case 'xs':
                    
                
                break;

                case 'sm':
                  
                  
                break;
                
                case 'md':
    
                  
                break;

                case 'lg':
    
                  
                break;
              }

            break;
          }


      });
    }); 
  }

  function xsBreakpoint(){
    breakpoint = 'xs'
  }

  function smBreakpoint(){
    breakpoint = 'sm'
  }

  function mdBreakpoint(){
    breakpoint = 'md'
  }

  function lgBreakpoint(){
    breakpoint = 'lg'
  }

  function launchBreakpoint(breakpoint){
    
    console.log( 'here:' )
    console.log( breakpoint )

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

    loopSliders();
    initial = false
  }

  /* begin */
  var typeASlidersIds = {},
      currentBreakpoint = getBreakpoint(),
      initial = true,
      timer


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