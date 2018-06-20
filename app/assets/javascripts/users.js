$(function(){
  $("a.my_flights").on("click", function(e){
    alert("afjekaf;!")
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

$(function(){
  $("a.my_airlines").on("click", function(e){

    e.preventDefault();
  })
})

$(function(){
  $("#new_airline").on("submit", function(e){
    url = this.action
    console.log(this)

    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'airline': {
        'name': $("#airline_name").val(),
        'rewards_number': $("#flight_rewards_number").val()
      }
    }

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response){
        var $ol = $("div.airlines ol")
        $ol.append(response);
      }
    })
    e.preventDefault();
  })
})
