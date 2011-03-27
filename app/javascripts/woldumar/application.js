$(function() {
  // session registration form niceness  
  $("#add_child").click(function() {
    // clone last child element
    var $child = $(".child").last().clone();
    // clear all input values
    var count = parseInt($child.find('input').first().attr('name').replace(/\D/g, ''), 10);
    console.log(count);
    $child.find("input, select").each(function() {
      var $t = $(this);
      if ($t.attr('type') != 'button') {
        // update index counters on elements for rails params passing
        // if it's a nested session element, only replace first int
        if ($t.hasClass('session')) {
          var name = $t.attr('name');
          var newName = name.substring(0, name.indexOf(count, 0));
          newName += count+1;
          newName += name.substring(name.indexOf(count, 0)+1);
          $t.attr('name', newName);
        } else { // otherwise global replace
          $t.attr('name', $t.attr('name').replace(count, count+1));
        }
        $t.val('');
      }
    });
    
    $(".children").append($child);
  });
  
  
});