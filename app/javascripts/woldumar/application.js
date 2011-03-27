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
        } else { // otherwise global replace
          $t.attr('name', $t.attr('name').replace(count, count+1));
        }
        $t.val('');
      }
    });
    
    $(".children").append($child);
  });
  
  $('.add_session').click(function() {
    var $session = $(this).parent().find("div.session").last().clone();
    var count = parseInt($session.find('input').first().attr('name').replace(/\D/g, '')[1], 10);
    $session.find("input,select").each(function() {
      var $t = $(this);
      $t.attr('name', replaceCounts($t.attr('name'), count, true))
      $t.val('');
    });
    
    $(this).parent().find('.sessions').append($session);
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
}