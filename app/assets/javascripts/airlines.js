

function Airline(airline) {
  this.id = airline.id
  this.name = airline.name
  this.rewards_number = airline.rewards_number
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
      const airline = new Airline(data)
      const response = airline.formatAirline()
      $("div.airlines ol").html(response)
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
