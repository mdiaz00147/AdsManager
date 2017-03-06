function GetListAds (){

    var BaseURL	=	'http://ads.ppbox.club';
	$('#table-data-3').hide();

	$.getJSON(BaseURL + "/ads", function(result){
		
		$("#someSpinnerImage-3").show();
    	result.forEach(function( index , i) {
    		$('#AdsList').append('<tr><td>'+ (i+1) +'</td><td>'+	index.name +'</td><td>'+	index.source +'</td><td><a class="btn btn-primary btn-xs"><svg class="glyph stroked pencil " style="height:20px;width:20px"><use xlink:href="#stroked-pencil"/></svg></a><a class="btn btn-xs btn-danger"><svg class="glyph stroked cancel" style="height:20px;width:20px"><use xlink:href="#stroked-cancel"/></svg></a></td></tr>')
    	});
    	$("#someSpinnerImage-3").hide(); 	
    	$('#table-data-3').show();
    });	
}