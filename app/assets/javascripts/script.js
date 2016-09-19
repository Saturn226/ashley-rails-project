$(function(){
  $('#adoptButton').on('click', function(e){
    //show adopt a pet page without refresh
   // e.preventDefault();
    $.get("/pets", function(data){
     
    })
  });
});