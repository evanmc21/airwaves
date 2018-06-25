$(function(){
  $(".js_next").on("click", function(){
    var nextID = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/flights/" + nextID + ".json", function(data){
      var flight = data;
      $.get(".flightNumber").text(flight["number"]);
      $.get(".flightOrigin_city").text(flight["origin_city"]);
      $.get(".flightDestination_city").text(flight["destination_city"]);
      $.get(".flightDeparture").text(flight["departure"]);
      $.get(".flightReturn").text(flight["return"]);
      $.get(".flightDirect").text(flight["direct"]);
      $(".js-next").attr("data-id", flight["id"]);
    });
  });
});
