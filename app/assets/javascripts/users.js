$(function(){
  $("a.my_flights").on("click", function(e){
    // alert("afjekaf;!")
    $.get(this.href, function(response){
      alert("Beyonce!")
      $("div.flights").append(response)
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
