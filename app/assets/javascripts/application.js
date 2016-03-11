// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require webcomponentsjs/webcomponents-lite.min
//= require jquery-readyselector
//= require_tree .

window.addEventListener("WebComponentsReady", function() { 
// create epic
  var createEpic = document.querySelector('#create-epic');
  if (createEpic){
    createEpic.addEventListener("click", function(e) {
      var value = $('#product_epic').find('input').val();
      if (value) {
        $.ajax({
            type: "POST",
            url: "/meeting",
            data: {'epic': value}
        });
      }
    });     
  }

  var checkin = document.querySelector('#checkin-button');
  if (checkin){
    checkin.addEventListener("click", function(e) {
      $.ajax({
        type: "POST",
        url: "/checkin",
        data: {
          'epic':$('#meeting_id').find('input').val(),
          'meeting_type': $("#label").text()
        }
      });
    });
  }  

});
