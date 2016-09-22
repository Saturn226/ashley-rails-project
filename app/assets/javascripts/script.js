$(function(){


  $(".pet-item").on('mouseenter', function(e){
        var element = $(this);
        var id = element.data("id")
        //debugger
        $.get('/pets/' +id+ '.json', function(data){
          var pet = data;
          var name = pet["name"]
          var bio = pet["bio"]
          var bioText = "<p class=\"bioText\" style=\"display:none\"><strong>Bio:</strong> "+bio+"</p>"
          var adoptable = pet["adoptable"]
          var price = pet["price"]
          var owner = pet["user"]["first_name"] + " " + pet["user"]["last_name"];
          
          
          var title = "<h1>" + name + "</h1>"
          var  html = "<p><strong>Owner:</strong> " +owner + "</p>"
            
              html += bioText
              html += "<a href= \"#\" class=\"info-button\">More Info</a>"
              

          hoverCard = $('#hover-card').html(html)


        $(element).popover({trigger: "manual", title: title, html: true, content: hoverCard.html(), animation: true})
          
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


          $('body').on('click','.info-button',function (e) {
            e.preventDefault();
            $('.bioText').show();
            $('.info-button').hide();

        });// end on click


      }) // end ajax


    }) // end mouseover






}) //document ready











// $(function(){

//    var page = document.getElementById('layout-container')
   
//   $('#adoptButton').on('click', function(e){
//     //show adopt a pet page without refresh
//     e.preventDefault();
//     e.stopPropagation()
//     $.get("/pets", function(data){
     
//      //page.innerHTML = '<div class="container"> <h1>List of Available Pets</h1></div>';
//      page.innerHTML = data;
     
//     }, 'html')
//   });


//   $('#homeButton').on('click', function(e){
//     //show adopt a pet page without refresh
//     e.preventDefault();
//     e.stopPropagation()
//     $.get("/", function(data){
//    // var page = document.getElementById('layout-container')
//      //page.innerHTML = '<div class="container"> <h1>List of Available Pets</h1></div>';
//      page.innerHTML = data;
     
//     }, 'html')
//   });

// });

  


