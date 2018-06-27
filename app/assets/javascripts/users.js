$(function(){
  $("a.my_flights").on("click", function(e){
    $.get(this.href, function(response){
      // alert("Beyonce!")
      $("div.flights").append(response)
    })
      e.preventDefault();
  })
  })
