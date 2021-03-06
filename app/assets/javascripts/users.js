$(function(){
  $("a.my_flights").on("click", function(e){
      $.get(this.href).success(function(flights){
        var $div = $("div.flights ol")
        $div.html("")
        flights.sort(function(b, a){
          return a.origin_city.toLowerCase().localeCompare(b.origin_city.toLowerCase());
        });
        flights.forEach(function(flight){
          let newFlights = new Flights(flight)
          let flightsHTML = newFlights.formatFlight()
          $("div.flights").prepend(flightsHTML)
          // debugger
        })
      })
      e.preventDefault();
  })
})

function Flights(flight) {
    this.id = flight.id
    this.originCity = flight.origin_city
    this.destinationCity = flight.destination_city
    this.departure = flight.departure
}

Flights.prototype.formatFlight = function(){
  let userID = parseInt(window.location.href.split("/")[4])
  let flightsHTML = `
  <div class="flights-float" style="float:left; margin: 5px">
    <ol>
      <h3>Departure ${this.departure}</h3>
      <p>origin: ${this.originCity}</p>
      <p>destination: ${this.destinationCity}</p>
      <a href="/users/${userID}/flights/${this.id}">flight details</a>
    </ol>
  </div>
  `
  return flightsHTML
}
