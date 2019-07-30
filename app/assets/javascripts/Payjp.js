$(document).on("turbolinks:load", function(){

  var form = $("#charge-form");
  Payjp.setPublicKey("pk_test_818708401642fae3662da73d");
  $(document).on("click","#submit-button" , function(e){

    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
      number: $("#card-number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp-date1").val(),
      exp_year: $("#exp-date2").val(),
    };
    Payjp.createToken(card, function(s, response){
      console.log(1);
      if (response.error) {
        alert("トークン作成エラー発生");
      }
      else {
        $(".text-form").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp-date1").removeAttr("name");
        $("#exp-date2").removeAttr("name");
        var token = response.id;

        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();

      }
    });
  });
});