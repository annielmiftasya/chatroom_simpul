//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require actioncable
//= require_tree .

// Add this to ensure messages.js is included
//= require messages

App.room = App.cable.subscriptions.create(
  { channel: "RoomChannel", room: ROOM_ID },
  {
    received: function (data) {
      // Data yang diterima adalah pesan baru
      // Tambahkan pesan baru ke tampilan obrolan
      var messageContainer = $(".chat");
      messageContainer.append(
        '<div class="chat-message-container">' +
          '<div class="row no-gutters">' +
          '<div class="col-auto text-center">' +
          '<img src="' +
          data.user_avatar_url +
          '" class="avatar" alt="">' +
          "</div>" +
          '<div class="col">' +
          "<p>" +
          data.username +
          "</p>" +
          '<div class="message-content">' +
          '<p class="mb-1">' +
          data.message +
          "</p>" +
          '<div class="text-right">' +
          "<small>" +
          data.created_at +
          "</small>" +
          "</div>" +
          "</div>" +
          "</div>" +
          "</div>" +
          "</div>"
      );
    },
  }
);
