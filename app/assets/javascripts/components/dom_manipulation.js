$(document).ready(function() {
  $(document)
    .on("change", "select[data-reveal]", revealSelect)

  onLoadDomEvents()
})

var onLoadDomEvents = function() {
  $("select[data-reveal]").change()

  $(".hide-option").each(function() {
    // $(this).appendTo($(this).parent().siblings("select"))
  })
}

var revealElement = function(element) {
  element.removeClass("hidden").prop("disabled", false)
  element.find(":not(:hidden) select:not(.hidden), :not(:hidden) input:not(.hidden), :not(:hidden) textarea:not(.hidden)").prop("disabled", false)
  element.children("select:not(.hidden), input:not(.hidden), textarea:not(.hidden)").prop("disabled", false)
}

var hideElement = function(element) {
  element.addClass("hidden").find("select, input, textarea").andSelf().prop("disabled", true)
}

var revealSelect = function(evt) {
  var toReveal = $(this).attr("data-reveal")
  var $elements = $("[data-" + toReveal + "]")
  hideElement($elements)
  if (typeof $(this).val() != "string" || $(this).val().length == 0) { return }
  var $element = $("[data-" + toReveal + "~=" + $(this).val() + "], [data-" + toReveal + "='']")
  revealElement($element)
}
