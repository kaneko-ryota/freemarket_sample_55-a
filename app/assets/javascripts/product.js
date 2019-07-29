$(document).on("turbolinks:load", function(){

  // 商品詳細画面　コメントするボタン
  $(".comment-textarea").on("keyup", function(){
    var input = $(".comment-textarea").val();
    if(input !== "") {
      $(".comment-submit-button").css("background", "#ea352d");
      $(".comment-submit-button").addClass("comment-submit-button__cursor");
    } else {
      $(".comment-submit-button").css("background", "#aaa");
      $(".comment-submit-button").removeClass("comment-submit-button__cursor");
    }
  });

  // 商品出品画面　販売価格表示
  $(".price__contents__right__in--put__box").on("keyup", function(){
    var input = $(this).val();
    var commission = Math.floor(input * 0.1);
    var commissionStr = String(commission).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

    if(input >= 300 && input <= 9999999){
      $(".price__contents__right__fee__right__val").text(commissionStr);

      var benefit = String(input - commission).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
      $(".price__contents__right__benefit__right__val").text(benefit);
    } else {
      $(".price__contents__right__fee__right__val").text("-");
      $(".price__contents__right__benefit__right__val").text("-");
    }
  })

  // 商品出品画面　カテゴリー選択後のサイズ欄、ブランド欄の出現
  $(".category-select-default").change(function(){
    var categoryNum = $(this).val();
    var size = $(".size-select-box")
    var brand = $(".brand-select-box")
    var hide = "category-first-hide"
    if(categoryNum == 1 || categoryNum == 2 || categoryNum == 3){
      $("#product_size").val("");
      $("#product_brand_id").val("");
      size.removeClass(hide);
      brand.removeClass(hide);
    } else if(categoryNum == 4 || categoryNum == 5 || categoryNum == 6 || categoryNum == 7 || categoryNum == 8 || categoryNum == 9 || categoryNum == 10 || categoryNum == 11 || categoryNum == 12 || categoryNum == 13){
      $("#product_size").val("");
      $("#product_brand_id").val("");
      size.addClass(hide);
      brand.removeClass(hide);
    } else {
      $("#product_size").val("");
      $("#product_brand_id").val("");
      size.addClass(hide);
      brand.addClass(hide);
    }
  });

  // 商品詳細画面　不適切な商品の報告
  $(".button-report").on("click", function(){
    if(!confirm("不適切な商品を報告しますか？")){
      return false;
    } else {
      location.href;
    }
  });

});