var change_nav_type;

$(function() {
  change_nav_type($('.nav-options input[checked=checked]').val());
  $('.nav-options input[name=nav-type]').click(function(e) {
    return change_nav_type($(e.target).val());
  });
  $('a.open-menu').click(function(e) {
    $('body').toggleClass('navigation-open');
    return false;
  });
  return $('a.close').click(function(e) {
    $('body').removeClass('navigation-open');
    return false;
  });
});

change_nav_type = function(selected) {
  return $('body').attr('class', "" + (selected.replace(/\-/, ' ')));
};
