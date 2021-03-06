// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

var backToTopScrollAmount = 300;

$(function () {
    /*
    $('#chatwindow').on('click', function () {
        $('<chattext>Text <br\></chattext>').appendTo('#chatwindow');
        $('#chatwindow').scrollTop( $('#chatwindow')[0].scrollHeight );
    });
    */

    $('.closebutton').on( 'click', function( ) {
        $('.errorbox').empty( );
    });
});

$(window).scroll( function( ) {
   if( $(window).scrollTop( ) > backToTopScrollAmount ) {
       $(".back-to-top").fadeIn( 'slow' );
   } else {
       $(".back-to-top").fadeOut( 'slow' );
   }
});

$('.back-to-top').click( function( ) {
   $('html, body').animate( {
      scrollTop: 0
   }, 100);
    return false;
});
