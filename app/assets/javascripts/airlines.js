// function Airline(airline) {
//   this.id = airline.id
//   this.name = airline.name
//   this.rewardsNumber = airline.rewards_number
// }
//
// Airline.prototype.formatAirline = function() {
//   let airlineHTML = `
//   <div class="new-air" style="float: left; margin: 5px;">
//     <ol>
//       <h3>${this.name}</h3>
//       <p>rewards member: #${this.rewardsNumber}</p>
//       <button><a href="/airlines/${this.id}/edit" style="text-decoration: none; color: white">edit airline</a></button></br>
//       <button><a href="/airlines/${this.id}" style="text-decoration: none; color: white">view airline</a></button>
//     </ol>
//   </div>
//   `
//   return airlineHTML
// }

// Event listeners
// $(function(){
//   $("#new_airline").on("submit", function(e){
//     e.preventDefault();
//     const values= $(this).serialize()
//     createNewAirline(values)
//   })
// })
// Ajax calls
// const createNewAirline = function(values) {
//   $.ajax({
//     url: '/airlines',
//     type: 'POST',
//     data: values,
//     dataType: 'JSON',
//     success: function(data) {
//       $("#airline_name").val("");
//       $("#airline_rewards_number").val("");
//       const airline = new Airline(data)
//       const response = airline.formatAirline()
//       $("#results").prepend(response)
//     }
//   })
// }
