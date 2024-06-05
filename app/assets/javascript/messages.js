$(document).ready(function () {
  console.log("Document is ready");

  // Fungsi untuk menangani klik tombol kirim pesan
  $(".chat-input[type='submit']").on("click", function (e) {
    // Pastikan form valid sebelum melakukan reload
    if ($(".new_room_message")[0].checkValidity()) {
      // Hentikan default action dari tombol kirim
      e.preventDefault();

      // Kirim pesan dan jika berhasil, reload halaman
      $.ajax({
        url: $(".new_room_message").attr("action"),
        type: $(".new_room_message").attr("method"),
        data: $(".new_room_message").serialize(),
        success: function (response) {
          // Reload halaman
          location.reload();
        },
        error: function (xhr, status, error) {
          console.error("Error sending message:", error);
        },
      });
    }
  });
});
