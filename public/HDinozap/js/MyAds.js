$(document).ready( function() {
	var CounryIsoCode	=	'';
	$.getJSON("http://freegeoip.net/json/", function(result){
    	CounryIsoCode = result.country_code;
    }).done(function(){
		$.getJSON(BaseURL + "/country/ads/" + CounryIsoCode, function(result){
	    	result.forEach(function( index , i) {
	    		MyIframe(index.source,i);
	    		HitAd(index.country_config_id,index.id);
	    	});	
	    });		
    });
	function MyIframe(src,index){
		$('#root').append('<iframe id="Ifid-' + index + '" width="100" height="100" src="' + src + '" frameborder="0" sandbox="allow-forms allow-same-origin allow-scripts" onloasd="check_if_open()"></iframe>');
	}
	function HitAd(country_config_id,ad_id){
		$.post(BaseURL + "/ads_hits",
	    {
	        country_config_id: country_config_id,
	        ad_id: ad_id
	    },
	    function(data, status){
	    });
	}
});