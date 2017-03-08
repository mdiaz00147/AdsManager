function ListCountries ()
{
    $.getJSON(BaseURL + "/countries", function(result){
    	result.forEach(function( index , i) {
    		$('#select2').append('<option value="'+ index.id +'">'+ index.nicename +'</option>')
    	});
    });	
}