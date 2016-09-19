$(function(){

   var page = document.getElementById('layout-container')
  $('#adoptButton').on('click', function(e){
    //show adopt a pet page without refresh
    e.preventDefault();
    e.stopPropagation()
    $.get("/pets", function(data){
     
     //page.innerHTML = '<div class="container"> <h1>List of Available Pets</h1></div>';
     page.innerHTML = data;
     
    }, 'html')
  });


  $('#homeButton').on('click', function(e){
    //show adopt a pet page without refresh
    e.preventDefault();
    e.stopPropagation()
    $.get("/", function(data){
   // var page = document.getElementById('layout-container')
     //page.innerHTML = '<div class="container"> <h1>List of Available Pets</h1></div>';
     page.innerHTML = data;
     
    }, 'html')
  });

});