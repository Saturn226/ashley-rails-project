$(function(){

  $(".pet-item").on('mouseenter', function(e){

        var element = $(this);
        var id = element.data("id")
        //debugger
        $.get('/pets/' +id+ '.json', function(data){
          var pet = data;
          var name = pet["name"]
          var bio = pet["bio"]
          var adoptable = pet["adoptable"]
          var price = pet["price"]
          var owner = pet["user"]["first_name"] + " " + pet["user"]["last_name"];
          
          
          var title = "<h1>" + name + "</h1>"
          var html = "<p>Owner: " +owner + "</p>"
              html += "<a href=\"/pets/id\">More Info</a>"

          var hoverCard = $('#hover-card').html(html)


         $(element).popover({trigger: "hover", title: title, html: true, content: hoverCard.html(), animation: true})


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

  


