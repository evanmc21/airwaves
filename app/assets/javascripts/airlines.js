

function Airline(airline) {
  this.id = airline.id
  this.name = airline.name
  this.rewards_number = airline.rewards_number
}

Airline.prototype.formatAirline = function() {
  let airlineHTML = `
  <ol>
    <h3>${this.name}</h3>
    <p>rewards member: #${this.rewards_number}</p>
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



//
// <% @airlines.each do |airline| %>
//   <h3><%= airline.name %></h3>
//   <p>rewards member: #<%= airline.rewards_number %></p>
//   <%= form_tag(edit_airline_path(airline), method: :get) do %>
//   <%= submit_tag 'edit airline' %>
// <% end %>
//
// <%= form_tag(airline_path(airline), method: :get) do %>
// <%= submit_tag 'view airline' %>
// <% end %>
// <% end %>
