$(document).on("ready page:load", function() {
  $(".datepicker:not(.hasDatepicker)").datepicker({
    dateFormat: $.datepicker.RFC_2822,
    changeMonth: true,
    changeYear: true
  })
})
