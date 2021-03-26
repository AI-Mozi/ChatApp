// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require materialize
//= require jquery

// Clear input
$(document).on("ajax:success", function() {
  $(".message-input").val('');
});

// Send message on enter



// Send message w/o refresh

$(document).on("turbolinks:load", function() {
    var $element = $('[data-channel-subscribe="room"]');
        room_id = $element.data('room-id')

    $('.chat').scrollTop($('.chat').prop("scrollHeight"));        

    App.cable.subscriptions.create(
      {
        channel: "RoomChannel",
        room: room_id
      },
      {
        connected(){
          console.log("Connected");
        },

        received(data) {

          $.get('/current_user', function(result){
            var content;
            if(data.user_id == result.name){
              console.log("ez");
              content = `<div class="your_each_message">
                          <div class="your_message valign-wrapper">
                            <p>${data.message}</p>
                          </div>
                          <img src="${data.user_avatar_url}" class="message-avatar circle">

                        </div>
                        <div style='clear:both'></div> `;
            } else {
              content = `<div class="each_message">
                          <img src="${data.user_avatar_url}" class="message-avatar circle">
                          <div class="message valign-wrapper">
                            <p>${data.message}</p>
                          </div>
                        </div>
                        <div style='clear:both'></div> `;
            }
            $element.append(content);
            $('.chat').animate({ scrollTop: $element.prop("scrollHeight")}, 1000);  
          });
  
        }
      }
    );
  });

