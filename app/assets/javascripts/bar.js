$(document).on('turbolinks:load', function(){
  $(document).on('change', '#input_number', function(e){
    var input = this.value;
    var progerss = input + "%"
    $('#my_bar').css('width',progerss);
    $('#my_bar').text(progerss);

    //ajax
    $.ajax({
      url: '/bar/change',
      type: 'GET',
      data: ('percent='+ input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })

    //追記：ajax後の処理
    .done(function(data){
      alert("after ajax")

      //リストの書き換え
      $('#sum').text(data["sum"])
      $('#ave').text(data["ave"])
      $('#max').text(data["max"])
      $('#min').text(data["min"])

      //bootstrapのプログレスバーの色の変更
      $('#my_bar').removeClass();
      $('#my_bar').addClass(data["color_mode"]);
    })

  });
});
