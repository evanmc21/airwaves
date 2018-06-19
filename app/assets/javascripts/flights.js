$(function(){
  $(".js_next").on("click", function(){
    var nextID = parseInt($(".js-next").attr("data-id")) + 1;
    $.get(this.href + nextID + ".json", function(data){
      $.get(".number").text(data["number"])
      $.get(".origin_city").text(data["origin_city"])
      $.get(".destination_city").text(data["destination_city"])
      $.get(".departure").text(data["departure"])
      $.get(".return").text(data["return"])
      $.get(".direct").text(data["direct"])
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});
