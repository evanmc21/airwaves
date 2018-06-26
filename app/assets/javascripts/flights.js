$(function(){
  $(".js-next").on("click", function(e){
    e.preventDefault()
    var nextID = parseInt($(".js-next").attr("data-id")) + 1;
    var userID = parseInt(window.location.href.split("/")[4])
    $.get(`/users/${userID}/flights/${nextID}.json`, function(data){
      var flight = data;
      $(".flightNumber").text(flight["number"]);
      $(".flightOrigin_city").text(flight["origin_city"]);
      $(".flightDestination_city").text(flight["destination_city"]);
      $(".flightDeparture").text(flight["departure"]);
      $(".flightReturn").text(flight["return"]);
      $(".flightDirect").text(flight["direct"]);
      $(".flightCost").text(flight["cost"]);
      $(".js-next").attr("data-id", flight["id"]);
      let newFlight = new Flight(flight)
      let flightHtml = newFlight.formatShow()
      $(".flightNumber").append(flightHtml)

    });
  });
});

function Flight(flight){
  this.id = flight.id
  this.number = flight.number
  this.origin_city = flight.origin_city
  this.destination_city = flight.destination_city
  this.departure = flight.departure
  this.return = flight.return
  this.cost = flight.cost
  this.direct = flight.direct
}

Flight.prototype.formatShow = function() {
  let flightHtml = `
    <p> flight number: ${this.number} </p>
    <p> origin city: ${this.origin_city} </p>
    <p> desination city: ${this.destination_city} </p>
    <p> departure: ${this.departure} </p>
    <p> return: ${this.return} </p>
    <p> direct: ${this.direct} </p>
    <p> cost: ${this.cost} </p>
  `
  return flightHtml
}
