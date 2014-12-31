$ ->
  change_nav_type $('.nav-options input[checked=checked]').val()
  $('.nav-options input[name=nav-type]').click (e) -> change_nav_type $(e.target).val()

  $('a.open-menu').click (e) ->
    $('body').toggleClass 'navigation-open'
    false

  $('a.close').click (e) ->
    $('body').removeClass 'navigation-open'
    false


change_nav_type = (selected) ->
  $('body').attr 'class', "#{selected.replace(/\-/, ' ')}"