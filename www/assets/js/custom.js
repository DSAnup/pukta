function showErrorMessage (message, errorDiv, errorMessage) {
	
	if (errorDiv === undefined ||  errorDiv == '')
		errorDiv = 'errorDiv';
		
	if (errorMessage === undefined || errorMessage == '')
		errorMessage = 'errorMessage';
	
		
	document.getElementById(errorMessage).innerHTML = message;
	document.getElementById(errorDiv).style.display = 'block';
 		
}



function relocateMainPage (area, action, urlParam){
	
	var url = 'index.cfm?';
	
	if (area === undefined ||  area == '') {
		
	}
	else{
		url = url + '&area=' + area;
	}
	
	if (action === undefined ||  action == '') {
		
	}
	else{
		url = url + '&action=' + action;
	}
	
	if (urlParam === undefined ||  urlParam == '') {
		
	}
	else{
		url = url + urlParam;
	}
	
	
	location.href = url;
}

function showError(errorMessage){
		document.getElementById("errorMessage").innerHTML = errorMessage;
		document.getElementById("errorDiv").style.display = 'block';
	}
	
function showSuccess(successMessage){
	
		noty({
					text: successMessage,
					type: 'success',
					timeout: 2000
				});
	
	}
	
	
function hideError(){
	document.getElementById("errorMessage").innerHTML = '';
	document.getElementById("errorDiv").style.display = 'none';
}



//loads the modal window (primariliy for forms)
function loadModal(url, target) {
		
	target.load(url);
	
}

function closeModalForm(){
	$('#formModal').modal('toggle');
}


function showResult(data){
		document.getElementById("result").innerHTML = data;
		
	}


// Search form related ajax call for loading just the result	
function loadSearchResult (objForm, objTarget){
	
	$(".loader").fadeIn(0);
	
	$.ajax({
				data: objForm.serialize(),
				type: objForm.attr('method'),
				url: objForm.attr('action'),				
				success: function(response) {
					
					objTarget.html(response);
					$('#example').addClass( "table-tabletools" );
					$('#example').addClass( "table-columnfilter" );
					$('#example').addClass( "table-checkable" );
					$('#example').addClass( "table-colvis" );
					//$('#example').DataTable();
					
					App.init(); // Init layout and core plugins
					Plugins.init(); // Init all plugins
					FormComponents.init(); // Init all form-specific plugins
				},
				error: function (request, status, error) {			        
			        objTarget.html(request.responseText);
			    }
			}); 
			
	 $(".loader").fadeOut(1000);
		
}
//end of ajax call for form load...


// Load search result - but based on URL only

function loadSearchResultByURL(url){
	
	$('#searchResult').load(url, function( response, status, xhr ) {
			  if ( status == "error" ) {			    
			    $('#searchResult').html( response );
			  }
			  else {
			  	
			  	 $('#example').addClass( "table-tabletools" );
					$('#example').addClass( "table-columnfilter" );
					$('#example').addClass( "table-checkable" );
					$('#example').addClass( "table-colvis" );
					
					
					App.init(); // Init layout and core plugins
					Plugins.init(); // Init all plugins
					FormComponents.init(); // Init all form-specific plugins  
			  	
			  	
			  }
			}
        );		
}


//end of loading by id



// Reload the search result

function reloadSearchResult(){
	
	$('#searchForm').submit();
}


//end of reload the search result


//load content to the main section of the page

function loadMain(url){
	
    	$(".loader").fadeIn(0);
    
        $("#mainContent").load(url, function( response, status, xhr ) {
			  if ( status == "error" ) {			    
			    $( "#mainContent" ).html( response );
			  }
			}			     
        );
        $(".loader").fadeOut(1000);
		
		return false;
	
}

//end of load content for the main section of the page



//this is to refresh the data table - add and edit
function refreshTableRow( dataObject, rowID, action  ){
	
	var oTable = $('#example').dataTable();
	
	if (action == 'Update'){
		
		oTable.fnUpdate( dataObject, document.getElementById(rowID).parentNode.parentNode, undefined , false, false );
		
	}
	
	if (action == 'Create'){
		
		oTable.fnAddData( dataObject, true );
		oTable.fnPageChange( 0 );
		
	}
	
	if (action == 'Delete'){
		
		//make the row as struck off
		document.getElementById(rowID).parentNode.parentNode.style.textDecoration = 'line-through';
		
		//remove the tools and say deleted		
		document.getElementById(rowID).innerHTML = dataObject;
		
		
		
	}
	
	
	
	
}




	