// $(function(){
//   $(".js_next").on("click", function(){
//     var nextID = parseInt($(".js-next").attr("data-id")) + 1;
//     $.get("/flights/" + nextID + ".json", function(data){
//       var flight = data;
//       $.get(".number").text(flight["number"])
//       $.get(".origin_city").text(flight["origin_city"])
//       $.get(".destination_city").text(flight["destination_city"])
//       $.get(".departure").text(flight["departure"])
//       $.get(".return").text(flight["return"])
//       $.get(".direct").text(flight["direct"])
//       $(".js-next").attr("data-id", flight["id"]);
//     });
//   });
// });
