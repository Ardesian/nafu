$(document).ready(function() {
  $(".file-input [type=file]").on("change", function updateFileName(event) {
    var $input = $(this)

    $input.parents(".input-row").find(".filename").text($input.val().replace(/([^\\]*\\)*/, ""))
  })
})
