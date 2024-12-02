$(document).on('turbolinks:load', function () {
    var passwordField = $('#user_password')
    var confirmationField = $('#user_password_confirmation')
  
   
    if (confirmationField.length) {
      confirmationField.on('input', confirmationAlerts)
      passwordField.on('input', confirmationAlerts)
    }
  
    function confirmationAlerts() {
      if (confirmationField.val() == '') {
        reset()
      } else if (passwordField.val() == confirmationField.val()) {
          success()
        } else {
          fail()
      }
    }
  
    function reset() {       
      $('.success').addClass('hide')
      $('.fail').addClass('hide')
    }
  
    function success() {    
      $('.success').removeClass('hide')
      $('.fail').addClass('hide')
    }
  
    function fail() {      
      $('.fail').removeClass('hide')
      $('.success').addClass('hide')
    }
  })