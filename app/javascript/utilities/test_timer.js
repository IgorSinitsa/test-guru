$(document).on('turbolinks:load', function() {
  let $timer = $('.test-duration')
  
    if ($timer.length) {
      var secounds = $timer.data("duration")
      setInterval(function(){
        secounds--
        if (secounds <= 0) {
          $("form").submit()
        }
        var date = new Date(0, 0, 0)
        date.setSeconds(secounds)
        var h = date.getHours()
        var m = date.getMinutes()
        var s = date.getSeconds()
        $timer.text(`${h}:${m}:${s}`)
      }, 1000)
    }
 })
  
  