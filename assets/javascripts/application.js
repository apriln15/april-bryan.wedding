//= require ./parallax
//= require ./jquery.slides.min

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

  $("#slides").slidesjs({
    width: 940,
    height: 680,
    navigation: {
      active: false
    },
    pagination: {
    active: false,
      effect: 'fade'
    },
    play: {
      auto: true,
      effect: 'fade',
      interval: 10000
    }
  });
})()

Wedding.init();
