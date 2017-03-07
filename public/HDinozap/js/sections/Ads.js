function GetListAds (){
    
	$('#table-data-3').hide();

	$.getJSON(BaseURL + "/ads", function(result){
		
		$("#someSpinnerImage-3").show();

    	result.forEach(function( index , i) {
            console.log(index.countries);
    		$('#AdsList').append('<tr><td>'+ (i+1) +'</td><td>'+	index.name +'</td><td>'+	index.source +'</td><td></td>'+ index.countries +'<td><a class="btn btn-primary btn-xs"><svg class="glyph stroked pencil " style="height:20px;width:20px"><use xlink:href="#stroked-pencil"/></svg></a><a class="btn btn-xs btn-danger" onclick="DeleteAd('+index.id+');"><svg class="glyph stroked cancel" style="height:20px;width:20px"><use xlink:href="#stroked-cancel"/></svg></a></td></tr>')
    	});
    	$("#someSpinnerImage-3").hide(); 	
    	$('#table-data-3').show();
    });	
}
function RefreshListAds(){
    var current_table = $('#AdsList');
    current_table.empty();
    $.getJSON(BaseURL + "/ads", function(result){
        
        $("#someSpinnerImage-3").show();

        result.forEach(function( index , i) {
            $('#AdsList').append('<tr><td>'+ (i+1) +'</td><td>'+    index.name +'</td><td>'+    index.source +'</td><td><a class="btn btn-primary btn-xs"><svg class="glyph stroked pencil " style="height:20px;width:20px"><use xlink:href="#stroked-pencil"/></svg></a><a class="btn btn-xs btn-danger" onclick="DeleteAd('+index.id+');"><svg class="glyph stroked cancel" style="height:20px;width:20px"><use xlink:href="#stroked-cancel"/></svg></a></td></tr>')
        });
        $("#someSpinnerImage-3").hide();    
        $('#table-data-3').show();
    });
}
function DeleteAd (AdId){
    $.ajax({
        type: 'DELETE',
        url:    BaseURL + "/ads/" + AdId, 
        data: { 
            AdId: AdId
        },
        success: function(data, status){
            toastr.warning('Anuncio Eliminado');
        }
    }).done(function(){
        RefreshListAds()
    });
}
function CreateAd (){
    // $("#SaveAdChanges").click(function(){
        $.post(BaseURL + "/ads", $('#AdModification').serialize(),
        function(data, status){
            console.log(data);
            toastr.success('Anuncio agregado exitosamente');
        }).done(function(){
            RefreshListAds()
        }); 
    // });
}