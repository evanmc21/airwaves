$(function(){
  $("a.my_flights").on("click", function(e){
    // alert("afjekaf;!")
    $.get(this.href).success(function(response){
      $("div.flights").html(response)
    })

    // $.get(this.href).success(function(json){
    //   var $ol = $("div.flights ol")
    //     $ol.html(" ")
        // json.forEach(function(flight){
        // $ol.append("<li>" + flight.destination_city + "</li>")
      // })
      e.preventDefault();
  })

  })
// })
