$(function(){
  $(".js-next").on("click", function(){
    var nextID = parseInt($(".js-next").attr("data-id")) + 1;
    var userID = parseInt(window.location.href.split("/")[4])
    $.get(`/users/${userID}/flights/${nextID}`, function(data){
      var flight = data;
      $(".flightNumber").text(flight["number"]);
      $(".flightOrigin_city").text(flight["origin_city"]);
      $(".flightDestination_city").text(flight["destination_city"]);
      $(".flightDeparture").text(flight["departure"]);
      $(".flightReturn").text(flight["return"]);
      $(".flightDirect").text(flight["direct"]);
      $(".js-next").attr("data-id", flight["id"]);

    });
  });
});
