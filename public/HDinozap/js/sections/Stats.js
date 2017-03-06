var BaseURL	=	'http://ads.ppbox.club';

function GetAdsCount (){
	$('#table-data').hide();
	$('#table-data-2').hide();
	$.getJSON(BaseURL + "/ads/action/count", function(result){
	
	$("#someSpinnerImage-1").show();
	result.forEach(function( index , i) {
		$('#CountryImp').append('<tr><td>'+ (i+1) +'</td><td>'+	index[0][1] +'</td><td>'+	index[1] +'</td></tr>')
	});
	}).done(function(){
		$("#someSpinnerImage-1").hide(); 	
		$('#table-data').show();
	});	

	$.getJSON(BaseURL + "/countries/count", function(result){

	$("#someSpinnerImage-2").show();
	
	result.forEach(function( index , i) {
		$('#CountryImp2').append('<tr><td>'+ (i+1) +'</td><td>'+	index[0][1] +'</td><td>'+	index[0][2] +'</td><td>'+	index[1] +'</td></tr>')
	});
	}).done(function(){
    	$("#someSpinnerImage-2").hide(); 	
    	$('#table-data-2').show();
    });
}

