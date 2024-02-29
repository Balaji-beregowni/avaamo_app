
var csrfToken = $('meta[name="csrf-token"]').attr('content');
$(document).ajaxSend(function(e, xhr, options) {
  xhr.setRequestHeader('X-CSRF-Token', csrfToken);
});

$(document).ready(function() {
  $('.download-csv-btn').click(function(e) {
    var userId = $(this).data('user-id');
    var statusElement = $('#status_' + userId);

    $.ajax({
      url: '/users/' + userId + '/download_orders_csv',
      type: 'POST',
      success: function(response) {
        statusElement.text(response.message);
        var attachmentId = response.attachment_id.toString()
        checkStatus(attachmentId);
      }
    });
  });

  function checkStatus(attachmentId) {
    var statusElement = $('#status_' + attachmentId);

    function getStatus() {
      $.ajax({
        url: '/attachments/' + attachmentId + '/csv_status/',
        type: 'GET',
        success: function(response) {
          // download attachment if ready or send request again
          if (response.status === 'completed') {
              window.location.href = "/" + response.path;
          } else {
            setTimeout(getStatus, 5000);
          }
        },
        error: function(response, error) {
          // Handle errors here
          console.error(error);
        }
      });
    }

    getStatus();
  }
});