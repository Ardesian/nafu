$(document).ready(function() {
  App.shifts = App.cable.subscriptions.create({
    channel: "ShiftsChannel"
  }, {
    connected: function() {
      console.log("Connected");
    },
    received: function(data) {
      if (data.shift_url) {
        window.location.href = data.shift_url
      }
    }
  })
})
