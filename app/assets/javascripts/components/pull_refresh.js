$(document).ready(function() {
  var dragstart, dragcurrent, refreshing = false;
  var refreshThreshold = 100

  var backgroundReload = function() {
    if (refreshing) { return }
    refreshing = true
    $(".pull-refresh-container").text("Reloading!")
    $(document).trigger("pull-refresh")

    $.get(window.location.href).complete(function(evt, xhr, data, a, b, c) {
      var html = evt.responseText.substring(evt.responseText.indexOf("<html>"))
      var newBody = $("<div>").append(html).find(".page-wrapper")

      if (newBody.length > 0) {
        $(".page-wrapper").replaceWith(newBody)
        refreshing = false
      }
    })
  }

  var animatePullDown = function(amount) {
    $(".pull-refresh-container").html(amount)
    $(".pull").text(amount)
  }

  $(document).on("scroll", function(evt) {
    animatePullDown($(this).scrollTop())

    if (!refreshing && $(this).scrollTop() < -refreshThreshold) {
      backgroundReload()
    }
  })
})
