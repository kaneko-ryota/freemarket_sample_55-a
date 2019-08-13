$( document ).on('turbolinks:load', function(){
  setTimeout(function(){
    $(".flash-message").fadeOut();
  }, 2000);
});