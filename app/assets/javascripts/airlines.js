// create a flight without refresh
// $(function(){
//   $("#new_flight").on("submit", function(e){
//     alert("have you ever seen a crowd go ape sh**?!")
//
//     e.preventDefault();
//   })
// })


// $(function(){
//   $("a.my_airlines").on("click", function(e){
//     alert("have you ever seen a crowd go ape sh**?!")
//
//     e.preventDefault();
//   })
// })
$(function(){
  $("a.my_airlines").on("click", function(e){

    e.preventDefault();
  })
})

$(function(){
  $("#new_airline").on("submit", function(e){
    // alert("wtf is up kyle?")
    url = this.action
    console.log(url)

    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'airline': {
        'name': $("#airline_name").val(),
        'rewards_number': $("#airline_rewards_number").val()
      }
    }

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response){
        var $ol = $("div.airlines ol")
        $ol.append(response);
      }
    })
    e.preventDefault();
  })
})
