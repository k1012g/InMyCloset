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

	// メニュー開閉(pcの時は使わない)
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
	let $toTop = $('#to-top');

	$toTop.each(function(){
		let el = ('html');

		$(this).on('click', function(){
			$(el).stop(true).animate({scrollTop: 0}, 750);
		});
	});

	// リンク選択時にエフェクト
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

	// フォロー一覧のタブ
	$('.follow').each(function(){

		let $followTab = $(this).find('.follow-tag'),
			$followTabA = $followTab.find('a'),
			$followContents = $(this).find('.follow-contents');

		$followTab.on('click', 'a', function(event){

			event.preventDefault();

			let $this = $(this);

			if ($this.hasClass('active')) {
				return;
			}

			$followTabA.removeClass('active');
			$followTabA.parent().removeClass('active');

			$this.addClass('active');
			$this.parent().addClass('active');

			$followContents.hide();
			$($this.attr('href')).show();
		});

		$followTabA.eq(0).trigger('click');
	});


	// マイページのタブ
	$('.lower').each(function(){

		let $Tab = $(this).find('.tab'),
			$TabA = $Tab.find('a'),
			$Contents = $(this).find('.tab-contents-inner');

		$Tab.on('click', 'a', function(event){

			event.preventDefault();

			let $this = $(this);

			$TabA.removeClass('active');
			$TabA.parent().removeClass('active');

			$this.addClass('active');
			$this.parent().addClass('active');

			$Contents.hide();
			$($this.attr('href')).show();
		});

		$TabA.eq(0).trigger('click');


		// ブランドタブとカテゴリータブ
		$('.tab-contents-inner').each(function(){

			// ブランドタブ
			let $brandTab = $(this).find('.brand-tab'),
				$brandTabA = $brandTab.find('a'),
				$brandContents = $(this).find('.brand-contents-inner');

			$brandTab.on('click', 'a', function(event){

				event.preventDefault();

				let $this = $(this);

				$brandTabA.removeClass('active');
				$brandTabA.parent().removeClass('active');

				$this.addClass('active');
				$this.parent().addClass('active');

				$brandContents.hide();
				$($this.attr('href')).show();
			});

			$brandTabA.eq(0).trigger('click');

			// カテゴリータブ
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
