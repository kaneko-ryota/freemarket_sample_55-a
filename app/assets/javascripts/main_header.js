$(document).on("turbolinks:load", function(){
  $(".inner__nav-box--left--category").hover(
    function(){
      $(".category-navigation").css("display", "block");
    },
    function(){
      $(".category-navigation").css("display", "none");
    }
  );
  $(".category-navigation").hover(
    function(){
      $(".category-navigation").css("display", "block");
    },
    function(){
      $(".category-navigation").css("display", "none");
    }
  );

  $(".inner__nav-box--left--brand").hover(
    function(){
      $(".brand-navigation").css("display", "block");
    },
    function(){
      $(".brand-navigation").css("display", "none");
    }
  );
  $(".brand-navigation").hover(
    function(){
      $(".brand-navigation").css("display", "block");
    },
    function(){
      $(".brand-navigation").css("display", "none");
    }
  );
});