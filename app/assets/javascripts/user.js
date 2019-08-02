$(document).on("turbolinks:load", function(){

  var left_tab = $(".switch-tab__left");
  var right_tab = $(".switch-tab__right");

  left_tab.on("click", function(){
    $(this).css("background-color", "white");
    $(this).css("border-top", "2px solid #ea352d");
    $(this).next(right_tab).css("background-color", "#eee");
    $(this).next(right_tab).css("border-top", "2px solid #eee");
    $(this).parent(".switch-tab").siblings().children(".during-deal").removeClass("tab--things-to-do-list");
    $(this).parent(".switch-tab").siblings().children(".during-deal").addClass("tab--things-to-do-list__active");
    $(this).parent(".switch-tab").siblings().children(".during-deal-item").removeClass("tab--item__hide");
    $(this).parent(".switch-tab").siblings().children(".during-deal-item").addClass("tab--item");
    $(this).parent(".switch-tab").siblings().children(".past").removeClass("tab--things-to-do-list__active");
    $(this).parent(".switch-tab").siblings().children(".past").addClass("tab--things-to-do-list");
    $(this).parent(".switch-tab").siblings().children(".past-item").removeClass("tab--item");
    $(this).parent(".switch-tab").siblings().children(".past-item").addClass("tab--item__hide");
    $(this).parent(".switch-tab").siblings().children(".during-deal-item-btn").removeClass("tab__list__hide");
    $(this).parent(".switch-tab").siblings().children(".during-deal-item-btn").addClass("tab__list");
    $(this).parent(".switch-tab").siblings().children(".past-finished-deals").addClass("tab__list__hide");
    $(this).parent(".switch-tab").siblings().children(".past-finished-deals").removeClass("tab__list");
  });
  right_tab.on("click", function(){
    $(this).css("background-color", "#fff");
    $(this).css("border-top", "2px solid #ea352d");
    $(this).prev(left_tab).css("background-color", "#eee");
    $(this).prev(left_tab).css("border-top", "2px solid #eee");
    $(this).parent(".switch-tab").siblings().children(".during-deal").removeClass("tab--things-to-do-list__active");
    $(this).parent(".switch-tab").siblings().children(".during-deal").addClass("tab--things-to-do-list");
    $(this).parent(".switch-tab").siblings().children(".during-deal-item").removeClass("tab--item");
    $(this).parent(".switch-tab").siblings().children(".during-deal-item").addClass("tab--item__hide");
    $(this).parent(".switch-tab").siblings().children(".past").removeClass("tab--things-to-do-list");
    $(this).parent(".switch-tab").siblings().children(".past").addClass("tab--things-to-do-list__active");
    $(this).parent(".switch-tab").siblings().children(".past-item").removeClass("tab--item__hide");
    $(this).parent(".switch-tab").siblings().children(".past-item").addClass("tab--item");
    $(this).parent(".switch-tab").siblings().children(".during-deal-item-btn").removeClass("tab__list");
    $(this).parent(".switch-tab").siblings().children(".during-deal-item-btn").addClass("tab__list__hide");
    $(this).parent(".switch-tab").siblings().children(".past-finished-deals").removeClass("tab__list__hide");
    $(this).parent(".switch-tab").siblings().children(".past-finished-deals").addClass("tab__list");
  });

});