$(document).on("turbolinks:load", function(){

  var form = $("#charge-form");
  Payjp.setPublicKey("pk_test_818708401642fae3662da73d");
  $("#charge-form").on("click","#submit-button" , function(e){

    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
      number: parseInt($("#payment_card_no").val()),
      cvc: parseInt($("#cvc_code").val()),
      exp_month: parseInt($("#exp_month").val()),
      exp_year: parseInt($("#exp_year").val()),
    };

    Payjp.createToken(card, function(status, response) {
      if (status == 200) {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        
        var token = response.id;
        form.append($('<input type="hidden" name="payjp_Token" class="payjp_token" />').val(token));
        form.get(0).submit();
      }
      else{
        alert("error")
        form.find("button").prop("disabled", false);
      }
    });
  });
});