// init mobile menu

$(document).on('ready', function(){
  var $header = $('#desktop-header')
  var $mobile_menu_button = $header.find('#mobile-menu-button')
  var $mobile_close_menu_button = $header.find('#mobile-close-button')

  $mobile_menu_button.on('click', function(event){
      event.preventDefault()
      $header.toggleClass('mobile-menu-open')
  })

  $mobile_close_menu_button.on('click', function(event){
      event.preventDefault()
      $header.removeClass('mobile-menu-open')
  })





})

