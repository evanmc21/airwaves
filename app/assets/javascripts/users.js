$(function(){
  $("a.my_flights").on("click", function(e){
    // $.get(this.href, function(response){
      // alert("Beyonce!")
      // debugger
      $.get(this.href).success(function(json){
        var $div = $("div.flights ol")
        $div.html("")
        json.forEach(function(flight){
          let newFlights = new Flights(flight)
          let flightsHTML = newFlights.formatFlight()
          $("div.flights").append(flightsHTML)
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
    <ol>
      <h3>Departure ${this.departure}</h3>
      <p>origin: ${this.originCity}</p>
      <p>destination: ${this.destinationCity}</p>
      <a href="/users/${userID}/flights/${this.id}">flight details</a>
    </ol>
  `
  return flightsHTML
}
