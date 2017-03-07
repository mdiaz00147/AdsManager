// var BaseURL	=	'http://localhost:3000';
var BaseURL	=	'http://ads.ppbox.club';

$.getScript("js/sections/Stats.js");
$.getScript("js/sections/Ads.js");

$(document).ready( function() {
	IndexPage();
	var	Url1	=	$('#ads-listing');
	var	Url2	=	$('#stats');
	
	$('#ads-listing-link').on('click', function(){
		ContentReplace(Url1);
		
	});
	$('#stats-link').on('click', function(){
		ContentReplace(Url2);
		GetAdsCount();
	});

	function ContentReplace(url){
		$('.main').html(url.html());
	}
	function IndexPage(url){
		GetListAds();
	}
	
	
});