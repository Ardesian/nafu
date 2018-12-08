$(document).ready(function() {
  App.shifts = App.cable.subscriptions.create({
    channel: "ShiftsChannel"
  }, {
    connected: function() {
      console.log("Connected");
    },
    received: function(data) {
      console.log("Received:", data);
    }
  })
})
