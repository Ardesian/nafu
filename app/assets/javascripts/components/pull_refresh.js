$(document).ready(function() {
  var dragstart, dragcurrent, refreshing = false;
  var refreshThreshold = 200

  $("body").on("mousedown touchstart", function(evt) {
    if (evt.pageY < $(document).height() / 2 && $(".content").scrollTop() < (refreshThreshold / 2)) {
      dragstart = evt.pageY
    }
  }).on("mouseup touchend", function() {
    dragstart = undefined
    refreshing = false
  }).on("mousemove touchmove", function(evt) {
    if (refreshing == false && dragstart) {
      dragcurrent = evt.pageY - dragstart

      if (dragcurrent > refreshThreshold) {
        refreshing = true
        $(document).trigger("pull-refresh")
        console.log("Refresh!");

        $.get(window.location.href).complete(function(evt, xhr, data, a, b, c) {
          var html = evt.responseText.substring(evt.responseText.indexOf("<html>"))
          var newBody = $("<div>").append(html).find(".page-wrapper")

          if (newBody.length > 0) {
            $(".page-wrapper").replaceWith(newBody)
          }
        })
      }
    }
  })
})
