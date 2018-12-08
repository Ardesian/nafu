console.log("Hello, World");
$(document).ready(function() {
  App.shifts = App.cable.subscriptions.create({
    channel: "ShiftsChannel"
  }, {
    connected: function() {
      console.log("Connected");
      // $.get("/chat_list").success(function(data) {
      //   updateBlip(data.count)
      // })
    },
    received: function(data) {
      console.log("Received:", data);
      // updateBlip(data.count)
    }
  })

  updateBlip = function(count) {
    // var count = parseInt(count) || 0
    // $(".chat-list.blip").text(count)
    // if (count > 0) {
    //   $(".chat-list.blip").removeClass("hidden")
    // } else {
    //   $(".chat-list.blip").addClass("hidden")
    // }
  }
})
