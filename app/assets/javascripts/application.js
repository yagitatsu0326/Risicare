// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require turbolinks
//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require_tree .

$(function(){
 	//画像プレビュー(編集時)
	$(function(){
	  $('#post_image').on('change', function (e) {
	  var reader = new FileReader();
	  reader.onload = function (e) {
	      $(".image-squar").attr('src', e.target.result);
	  }
	  reader.readAsDataURL(e.target.files[0]);
	});
	});
	//画像プレビュ-(新規登録時)
	$(function(){
		$('#post_image').on('change', function (e) {
		var reader = new FileReader();
		reader.onload = function (e) {
		  $(".image").attr('src', e.target.result);
		}
		reader.readAsDataURL(e.target.files[0]);
	});
	});
	//画像プレビュ-(ユーザ新規登録)
	$(function(){
	  $('#member_image').on('change', function (e) {
	  var reader = new FileReader();
	  reader.onload = function (e) {
	      $(".image").attr('src', e.target.result);
	  }
	  reader.readAsDataURL(e.target.files[0]);
	});
	});

    //Skipper(初回ページ読み込み時)
	showSlides();
　　//Skipper(ページ遷移時)
	$(document).on('turbolinks:load', function(){
		showSlides();
	});
	function showSlides() {
		$(".theTarget").skippr({
		  transition : 'fade',
		  speed : 1000,
		  easing : 'easeOutQuart',
		  navType : 'block',
		  childrenElementType : 'div',
		  arrows : true,
		  autoPlay : true,
		  autoPlayDuration : 8000,
		  keyboardOnAlways : true,
		  hidePrevious : false
		});
	};
});