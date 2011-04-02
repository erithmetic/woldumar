$(function() {
  // session registration form niceness  
  $("#add_child").click(function() {
    // clone last child element
    var $child = $(".child").last().clone();
    // clear all input values
    var count = parseInt($child.find('input').first().attr('name').replace(/\D/g, ''), 10);
    $child.find("input, select").each(function() {
      var $t = $(this);
      if ($t.attr('type') != 'button') {
        // update index counters on elements for rails params passing
        // if it's a nested session element, only replace first int
        if ($t.hasClass('session')) {
          $t.attr('name', replaceCounts($t.attr('name'), count, false));
          $t.attr('id', replaceCounts($t.attr('id'), count, false));
        } else { // otherwise global replace
          $t.attr('name', $t.attr('name').replace(count, count+1));
          $t.attr('id', $t.attr('id').replace(count, count+1));
        }
        if ($t.attr('type') != 'radio') {
          $t.val('');
        }
        $t.attr('checked', '');
      }
    });
    
    $child.find('label').each(function() {
      var $t = $(this);
      $t.attr('for', replaceCounts($t.attr('for'), count, false));
    });
    
    $(".children").append($child.show());
  });
  
  $('.add_session').click(function() {
    var $session = $(this).parent().find("div.session").last().clone();
    var count = parseInt($session.find('input').first().attr('name').replace(/\D/g, '')[1], 10);
    
    $session.find("input,select").each(function() {
      var $t = $(this);
      $t.attr('name', replaceCounts($t.attr('name'), count, true));
      $t.attr('id', replaceCounts($t.attr('id'), count, true));
      $t.val('');
      $t.attr('checked', '');
    });
    $session.find('label').each(function() {
      var $t = $(this);
      $t.attr('for', replaceCounts($t.attr('for'), count, true));
    });
    
    $(this).parent().find('.sessions').append($session.show());
  });
  
  $(".destroy").live('click', function() {
    if ($(this).attr('checked') === true) {
      $(this).parent().parent().slideUp('slow');
    }
  });
});

var replaceCounts = function(name, count, fromEnd) {
  var newName = '';
  
  if (fromEnd) {
    newName = name.substring(0, name.lastIndexOf(count, name.length));
    newName += count+1;
    newName += name.substring(name.lastIndexOf(count, name.length)+1);
  } else {
    var newName = name.substring(0, name.indexOf(count, 0));
    newName += count+1;
    newName += name.substring(name.indexOf(count, 0)+1);
  }
  
  return newName;
};

$(document).ready(function() {
  var timeout    = 500;
  var closetimer = 0;
  var ddmenuitem = 0;

  function jsddm_open() {
    jsddm_canceltimer();
    jsddm_close();
    ddmenuitem = $(this).find('ul').css('visibility', 'visible');
  }

  function jsddm_close() {
    if(ddmenuitem)
      ddmenuitem.css('visibility', 'hidden');
  }

  function jsddm_timer() {
    closetimer = window.setTimeout(jsddm_close, timeout);
  }

  function jsddm_canceltimer() {
    if(closetimer) {
      window.clearTimeout(closetimer);
      closetimer = null;
    }
  }

  $('ul.site_nav > li').hover(jsddm_open, jsddm_timer)
  $(document).click(jsddm_close);
});
