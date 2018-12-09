$(document).ready(function() {
  App.shift_leads = App.cable.subscriptions.create({
    channel: "ShiftLeadsChannel"
  }, {
    connected: function() {
    },
    received: function(data) {
      $(".badge.login-queue").attr("data-value", data.count)

      if ($(".queued-list").length == 0) { return }
      // Add missing cells
      var ids = []
      $(data.html).each(function() {
        var cell = $(this), id = cell.find("a[data-user-id]").attr("data-user-id")
        ids.push(id)

        if ($(".queued-list").find("a[data-user-id=" + id + "]").length == 0) {
          $(".queued-list").append(cell)
        }
      })
      // Remove extra cells
      $(".queued-list").find(".table-view-cell").each(function() {
        var cell = $(this), id = cell.find("a[data-user-id]").attr("data-user-id")
        if (ids.indexOf(id) == -1) { cell.remove() }
      })
    },
    approve: function(uid) {
      return this.perform("approve", {
        uid: uid
      })
    }
  })

  $(document).on("click", ".approve-user", function(evt) {
    evt.preventDefault()
    App.shift_leads.approve($(this).attr("data-user-id"))
    $(this).closest(".table-view-cell").remove()
    return false
  })
})
