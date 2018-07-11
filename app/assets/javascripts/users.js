$(function(){
  $("a.my_flights").on("click", function(e){
      $.get(this.href).success(function(flights){
        var $div = $("div.flights ol")
        $div.html("")
        flights.sort(function(a, b){
          return a.origin_city.toLowerCase().localeCompare(b.origin_city.toLowerCase());
        });
        flights.forEach(function(flight){
          let newFlights = new Flights(flight)
          let flightsHTML = newFlights.formatFlight()
          $("div.flights").append(flightsHTML)
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
    <ol>
      <h3>Departure ${this.departure}</h3>
      <p>origin: ${this.originCity}</p>
      <p>destination: ${this.destinationCity}</p>
      <a href="/users/${userID}/flights/${this.id}">flight details</a>
    </ol>
  `
  return flightsHTML
}

// function renderAlphabeticalFormat(flightsHTML){
//   flightsHTML.sort(function(a, b) {
//     return a.origin_city.toLowerCase().localeCompare(b.origin_city.toLowerCase());
// });
// }

// function renderFlightsIndex(route) {
//   $.get(route, flights => {
//       flights.sort((a, b) => {
//         return a.originCity > b.originCity
//       })
//       console.log(sortedFlights)
//       flights.forEach(flight => {
//         let newFlights = new Flights(flight)
//
//         let flightsHTML = newFlights.formatFlight()
//         $("div.flights").append(flightsHTML)
//       })
//   })
// }
