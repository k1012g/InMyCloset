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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(document).on('turbolinks:load', function() {
	// 投稿のマウスオーバー時のアニメーション
	let $image = $('.outer');
	$image
		.on('mouseover', function(){
			$(this).find('.cover').stop(true).animate({
				opacity: 1.0
			}, 300);
		})
		.on('mouseout', function(){
			$(this).find('.cover').stop(true).animate({
				opacity: 0
			}, 300);
		});

	// メニュー開閉
	$('#menu').on('click', function(){
		$('#nav').toggleClass('open');
	});

	// ヘッダーの固定
	$('.header').each(function(){
		let $window = $(window),
			$header = $(this),
			headerOffsetTop = $header.offset().top;

		$window.on('scroll', function(){
			if ($window.scrollTop() > headerOffsetTop){
				$header.addClass('sticky');
			}else{
				$header.removeClass('sticky');
			}
		});

		$window.trigger('scroll');
	});

	// ページ上部に戻るボタン
	let $topBtn = $('#top-btn');

	$opBtn.each(function(){
		let el = ('html');

		$(this).on('click', function(){
			$(el).stop(true).animate({scrollTop: 0}, 750);
		});
	});
});
