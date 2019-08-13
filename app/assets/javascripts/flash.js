$( document ).on('turbolinks:load', function(){
  setTimeout(function(){
    $(".profile-flash-message").fadeOut();
  }, 2500);
});