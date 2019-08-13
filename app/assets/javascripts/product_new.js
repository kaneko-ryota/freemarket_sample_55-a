$( document ).on('turbolinks:load', function() {
  if(window.location.href.match(/\/products\/new/)){

  var dropzone = $('.sell-form__image__container__input');
  var dropzone2 = $('.sell-form__image__container__input2');
  var appendzone = $('.sell-form__image__container2');
  var input_area = $('.input-area');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  // 新規追加画像を格納する配列（ビュー用）
  var images = [];
  // 新規追加画像を格納する配列（DB用）
  var new_image_files = [];

  $('#new_item').on("change", 'input[type= "file"].upload-image', function() {


    var file = $(this).prop("files")[0];

    new_image_files.push(file)
    var reader = new FileReader();

    var img = $(
      `<div class= "add_img">
        <div class="img_area">
          <img class="image">
          </div>
        <div class="btn_wrapper">
          <a class="btn_edit">編集</a>
          <a class="btn_delete">削除</a>
        </div>
      </div>`
      );


    reader.onload = function(e) {
      img.find("img").attr({
        src: e.target.result
      });
    };

    reader.readAsDataURL(file);
    images.push(img);

    // 画像が４枚以下のとき
    if (images.length <= 4) {
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.data('image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (20% * ${images.length}))`
      })

      // 画像が5枚以上のとき
    } else if (images.length == 5) {
      $("#preview").empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        preview.append(image);
      });
      appendzone.css({
        display: "block"
      });
      dropzone.css({
        display: "none"
      });
      preview2.empty();

      // 画像が６枚以上のとき
    } else if (images.length >= 6) {
      var pickup_images = images.slice(5);

      $.each(pickup_images, function(index, image) {
        image.data("image", index + 5);
        preview2.append(image);
        dropzone2.css({
          width: `calc(100% - (10% * ${images.length - 5}))`
        });
      });

      // 画像が１０枚になった時
      if (images.length == 10) {
        dropzone2.css({
          display: "none"
        });
      }
    }

    var new_image = $(
      `<input multiple= "multiple" name="product_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`
    );
    input_area.append(new_image);
  });


  // 削除ボタンを押した時
  $(document).on('click', '.btn_delete', function() {
    var target_image = $(this).parent().parent();
    var target_image_num = target_image.data('image');
    target_image.remove();

    // 対象の画像を削除した新たな配列を生成
    images.splice(target_image_num, 1);
    new_image_files.splice(target_image_num, 1);

    if(images.length == 0) {
      $('input[type= "file"].upload-image').attr({
        'data-image': 0
      })
    }

    // 画像が４枚以下のとき
    if (images.length <= 4) {
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.data('image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (20% * ${images.length}))`,
        'display': 'block'
      })
      appendzone.css({
        'display': 'none'
      })

      // 画像が５枚のとき１段目の枠を消し、２段目の枠を出す
    } else if (images.length == 5) {
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.data('image', index);
        preview.append(image);
      })
      appendzone.css({
        'display': 'block',
      })
      dropzone2.css({
        'width': '100%'
      })
      dropzone.css({
        'display': 'none'
      })
      preview2.empty();

      // 画像が６枚以上のとき

    } else {
      var pickup_images1 = images.slice(0, 5);

      $('#preview').empty();
      $.each(pickup_images1, function(index, image) {
        image.data('image', index);
        preview.append(image);
      })

      var pickup_images2 = images.slice(5);

      $.each(pickup_images2, function(index, image) {
          image.data('image', index + 5);
          preview2.append(image);
          dropzone2.css({
            'display': 'block',
            'width': `calc(100% - (20% * ${images.length - 5}))`
          })
        })
    }
  })

  $(".btn__red").on("click", function(){
    if($("#product_name").val() == "") {
      $(".product-new__error-message1").css("display", "block");
    } else {
      $(".product-new__error-message1").css("display", "none");
    }
    if($("#product_explain").val() == "") {
      $(".product-new__error-message2").css("display", "block");
    } else {
      $(".product-new__error-message2").css("display", "none");
    }
    if($("#product_category_id").val() == "") {
      $(".product-new__error-message3").css("display", "block");
    } else {
      $(".product-new__error-message3").css("display", "none");
    }
    if($("#product_size").val() == "") {
      $(".product-new__error-message4").css("display", "block");
    } else {
      $(".product-new__error-message4").css("display", "none");
    }
    if($("#product_brand_id").val() == "") {
      $(".product-new__error-message5").css("display", "block");
    } else {
      $(".product-new__error-message5").css("display", "none");
    }
    if($("#product_item_status").val() == "") {
      $(".product-new__error-message6").css("display", "block");
    } else {
      $(".product-new__error-message6").css("display", "none");
    }
    if($("#product_burden").val() == "") {
      $(".product-new__error-message7").css("display", "block");
    } else {
      $(".product-new__error-message7").css("display", "none");
    }
    if($("#product_delivery_method").val() == "") {
      $(".product-new__error-message8").css("display", "block");
    } else {
      $(".product-new__error-message8").css("display", "none");
    }
    if($("#product_region").val() == "") {
      $(".product-new__error-message9").css("display", "block");
    } else {
      $(".product-new__error-message9").css("display", "none");
    }
    if($("#product_delivery_date").val() == "") {
      $(".product-new__error-message10").css("display", "block");
    } else {
      $(".product-new__error-message10").css("display", "none");
    }
    if($("#product_price").val() == "") {
      $(".product-new__error-message11").css("display", "block");
    } else if($("#product_price").val() < 300 || $("#product_price").val() > 9999999) {
      $(".product-new__error-message11").css("display", "block");
    } else {
      $(".product-new__error-message11").css("display", "none");
    }
    if($("#upload-image").val() == "") {
      $(".product-new__error-message12").css("display", "block");
    } else {
      $(".product-new__error-message12").css("display", "none");
    }
  });


  $('#new_item').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    if (new_image_files.length == 0) {
      return false
      formData.append("new_images[images][]", " ")
    } else {
      new_image_files.forEach(function(file){
        formData.append("new_images[images][]", file)
      });
    }

    $.ajax({
      url:         '/products',
      type:        "POST",
      data:        formData,
      contentType: false,
      processData: false,
    })
    .done(function(data){
      $(".btn__red").attr("disabled", false);
    })
    .fail(function(){
      $(".btn__red").attr("disabled", false);
    })
  });
  }
});

