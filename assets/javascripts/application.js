//= require ./parallax

window.Wedding = {};

(function() {
  var waypointNav;

  Wedding.init = function() {
    new Waypoint({
      element: document.getElementById('stories'),
      handler: function(direction) {
        if (direction === 'down') {
          $('nav').addClass('visible').removeClass('hiding');
        }
      },
    });

    new Waypoint({
      element: document.getElementById('stories'),
      handler: function(direction) {
        if (direction === 'up') {
          $('nav').addClass('hiding').removeClass('visible');
        }
      },
    });
  }
})()

Wedding.init();
