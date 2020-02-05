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

	$topBtn.each(function(){
		let el = ('html');

		$(this).on('click', function(){
			$(el).stop(true).animate({scrollTop: 0}, 750);
		});
	});

	$('.link')
		.on('mouseover', function(){
			$(this).parent().parent().stop(true).animate({
				opacity: 0.8
			}, 300);
		})
		.on('mouseout', function(){
			$(this).parent().parent().stop(true).animate({
				opacity: 1.0
			}, 300);
		})


	$('.follow').each(function(){

		let $btn = $(this).find('.fBtn'),
			$btnA = $btn.find('a'),
			$btnC = $(this).find('.follow-contents');

		$btn.on('click', 'a', function(event){

			event.preventDefault();

			let $this = $(this);

			if ($this.hasClass('active')) {
				return;
			}

			$btnA.removeClass('active');
			$btnA.parent().removeClass('active');

			$this.addClass('active');
			$this.parent().addClass('active');

			$btnC.hide();
			$($this.attr('href')).show();
		});

		$btnA.eq(0).trigger('click');
	});

	$('.lower').each(function(){

		let $bigTab = $(this).find('.big-tab'),
			$bigTabA = $bigTab.find('a'),
			$bigContents = $(this).find('.big-contents-inner');

		$bigTab.on('click', 'a', function(event){

			event.preventDefault();

			let $this = $(this);

			$bigTabA.removeClass('active');
			$bigTabA.parent().removeClass('active');

			$this.addClass('active');
			$this.parent().addClass('active');

			$bigContents.hide();
			$($this.attr('href')).show();
		});

		$bigTabA.eq(0).trigger('click');

		$('.big-contents-inner').each(function(){

			let $smallTab = $(this).find('.small-tab'),
				$smallTabA = $smallTab.find('a'),
				$smallContents = $(this).find('.small-contents-inner');

			$smallTab.on('click', 'a', function(event){

				event.preventDefault();

				let $this = $(this);

				$smallTabA.removeClass('active');
				$smallTabA.parent().removeClass('active');

				$this.addClass('active');
				$this.parent().addClass('active');

				$smallContents.hide();
				$($this.attr('href')).show();
			});

			$smallTabA.eq(0).trigger('click');


			let $categoryTab = $(this).find('.category-tab'),
				$categoryTabA = $categoryTab.find('a'),
				$categoryContents = $(this).find('.category-contents-inner');

			$categoryTab.on('click', 'a', function(event){

				event.preventDefault();

				let $this = $(this);

				$categoryTabA.removeClass('active');
				$categoryTabA.parent().removeClass('active');

				$this.addClass('active');
				$this.parent().addClass('active');

				$categoryContents.hide();
				$($this.attr('href')).show();
			});

			$categoryTabA.eq(0).trigger('click');
		});
	});

});
