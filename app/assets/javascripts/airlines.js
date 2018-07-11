function Airline(airline) {
  this.id = airline.id
  this.name = airline.name
  this.rewardsNumber = airline.rewards_number
}

Airline.prototype.formatAirline = function() {
  let airlineHTML = `
  <ol>
    <h3>${this.name}</h3>
    <p>rewards member: #${this.rewardsNumber}</p>
    </ol>
  `
  return airlineHTML
}

// Event listeners
$(function(){
  $("#new_airline").on("submit", function(e){
    e.preventDefault();
    const values= $(this).serialize()
    createNewAirline(values)
  })
})
// Ajax calls
const createNewAirline = function(values) {
  $.ajax({
    url: '/airlines',
    type: 'POST',
    data: values,
    dataType: 'JSON',
    success: function(data) {
      $("#airline_name").val("");
      $("#airline_rewards_number").val("");
      const airline = new Airline(data)
      const response = airline.formatAirline()
      $("#results").html(response)
    }
  })
}
