$(function(){
  $("a.my_airlines").on("click", function(e){

    e.preventDefault();
  })
})

$(function(){
  $("#new_airline").on("submit", function(e){
    // alert("wtf is up kyle?")
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        var $div = $("div.airlines ol")
        $div.append(response);
      }
    })
    e.preventDefault();
  })
})
