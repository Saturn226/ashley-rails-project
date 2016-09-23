$(function(){


  $(".pet-item").on('mouseenter', function(e){
        var element = $(this);
        var id = element.data("id")

        $.get('/pets/' +id+ '.json', function(data){
          var pet = new Pet(data);
      
        // creating the hovercard html
          var bioText = "<p class=\"bioText\" style=\"display:none\"><strong>Bio:</strong> "+pet.bio+"</p>"
          var title = "<h1>" + pet.name + "</h1>"
          var html = "<p><b>Owner:</b> " +pet.owner(); + "</p>" 
              html += bioText
              html += "<a href= \"#\" class=\"info-button\">More Info</a>"
          hoverCard = $('#hover-card').html(html)

      //popover stays open on hover
        $(element).popover({trigger: "manual", title: title, html: true, content: hoverCard.html(), animation: true, placement: "auto"})
          
          .on("mouseenter", function () {
                  var _this = this;
                  $(this).popover("show");
                  $(".popover").on("mouseleave", function () {
                      $(_this).popover('hide');
                  });


              }).on("mouseleave", function () {
                  var _this = this;
                  setTimeout(function () {
                      if (!$(".popover:hover").length) {
                          $(_this).popover("hide");
                      }
                  });
              });
         $(element).popover("show")

        //show hide the bio text on hover
          $('body').on('click','.info-button',function (e) {
            e.preventDefault();
            $('.bioText').show();
            $('.info-button').hide();

        });// end on click


      }) // end ajax


    }) // end mouseover

  function Pet(json){
  this.name = json.name
  this.price = json.price
  this.bio = json.bio;
  this.adoptable = json.adoptable;
  this.owner_first_name = json.user.first_name;
  this.owner_last_name = json.user.last_name;

  this.owner = function(){
    return json.user.first_name + " " + json.user.last_name;
  }
  
}

}) //document ready














