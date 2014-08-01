// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require date
//= require foundation_calendar
//= require helpers/date-helpers
//= require helpers/string-helpers
//= require imagesloaded
//= require skrollr
//= require skrollr.ie
//= require skrollr.menu
//= require underscore
//= require gmaps/google
//= require turbolinks
//= require_tree .

// Initialise Foundation 5
$(function(){
	$(document).foundation();
});

// Close cookies policy alert (using Foundation 5)
;(function ($, window, document, undefined) {
  'use strict';

  Foundation.libs.alert = {
    name : 'alert',

    version : '5.3.0',

    settings : {
      callback: function (){}
    },

    init : function (scope, method, options) {
      this.bindings(method, options);
    },

    events : function () {
      var self = this,
          S = this.S;

      $(this.scope).off('.alert').on('click.fndtn.alert', '[' + this.attr_name() + '] a.close-cookies-policy', function (e) {
          var alertBox = S(this).closest('[' + self.attr_name() + ']'),
              settings = alertBox.data(self.attr_name(true) + '-init') || self.settings;

        e.preventDefault();
        if (Modernizr.csstransitions) {
          alertBox.addClass("alert-close");
          alertBox.on('transitionend webkitTransitionEnd oTransitionEnd', function(e) {
            S(this).trigger('close-cookies-policy').trigger('close.fndtn.alert').remove();
            settings.callback();
          });
        } else {
          alertBox.fadeOut(300, function () {
            S(this).trigger('close-cookies-policy').trigger('close.fndtn.alert').remove();
            settings.callback();
          });
        }
      });
    },

    reflow : function () {}
  };
}(jQuery, window, window.document));

// Initialise Skrollr and ImagesLoaded
( function( $ ) {

	// Setup variables
	$window = $(window);
	$slide = $('.homeSlide');
	$body = $('body');

	//FadeIn all sections   
	$body.imagesLoaded( function() {
		setTimeout(function() {

			// Resize sections
			adjustWindow();

			// Fade in sections
			$body.removeClass('loading').addClass('loaded');
		}, 800);
	});

	function adjustWindow(){

		// Init Skrollr
		var s = skrollr.init({
			forceHeight: false,
			render: function(data) {
				//Debugging - Log the current scroll position.
				//console.log(data.curTop);
			}
		});

		// Get window size
		winH = $window.height();

		// Keep minimum height 550
		if(winH <= 550) {
			winH = 550;
		} 

		// Resize our slides
		$slide.height(winH);

		// Refresh Skrollr after resizing our sections
		s.refresh($('.homeSlide'));

		skrollr.menu.init(s, {
	    //skrollr will smoothly animate to the new position using `animateTo`.
	    animate: true,

	    //The easing function to use.
	    easing: 'sqrt',

	    //Multiply your data-[offset] values so they match those set in skrollr.init
	    scale: 2,

	    //How long the animation should take in ms.
	    duration: function(currentTop, targetTop) {
	        //By default, the duration is hardcoded at 500ms.
	        return 500;

	        //But you could calculate a value based on the current scroll position (`currentTop`) and the target scroll position (`targetTop`).
	        //return Math.abs(currentTop - targetTop) * 10;
	    },

	    //If you pass a handleLink function you'll disable `data-menu-top` and `data-menu-offset`.
	    //You are in control where skrollr will scroll to. You get the clicked link as a parameter and are expected to return a number.
	    // handleLink: function(link) {
	    //     return 400;//Hardcoding 400 doesn't make much sense.
	    // }
		});
	}

} )( jQuery );