
<cfquery datasource="#request.dsnameReader#" name="qPropertySelect"> 
    SELECT CONCAT(P.AddressLine1,' - ', P.City ,' - ', (SELECT stateName FROM State WHERE StateID = P.StateID) ,' - ', P.ZipCode) AS Property, P.PropertyID
    FROM  Property AS P
</cfquery>

<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Show All Transaction </h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
					<li class="breadcrumb-item active">Show All Transaction </li>
				</ol>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>



<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<div class="row">
                    <div class="col-12">

                        <cfoutput>
                            <div class="container">                                  
                                <form id="formTransactionSelect" action="/partialIndex.cfm?area=Transaction&action=TransactionSelectAction" method="post" target="formpost">
                                    <div class="row">

                                        <div class="col-md-3">
                                            <div class="form-group row">
                                                <label for="PropertyID" class="col-form-label col-lg-12 sholwlog-label datasent">Property</label>
                                                <div class="col-lg-12">												
                                                    <select class="form-control required" name="PropertyID" id="PropertyID">
                                                        <option value="">Show All</option>													
                                                        <cfloop query="qPropertySelect">
                                                            <option value="#qPropertySelect.PropertyID#">#qPropertySelect.Property#</option>
                                                        </cfloop>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>        

                                        <div class="col-md-3">
                                            <div class="form-group row">
                                                <label for="Payee" class="col-form-label col-lg-12 sholwlog-label datasent">Payee</label>
                                                <div class="col-lg-12">					
                                            	<input type="text" name="Payee" id="Payee" class="form-control required" value="">
                                                </div>
                                            </div>
                                        </div>

                                        <cfset lastmonth= #dateadd("M", -3, now())#>

                                        <!--- Date From --->
                                        <div class="col-md-3">
                                            <div class="form-group row">
                                                <label for="dateFrom" class="col-form-label col-lg-12">Date From</label>
                                                <div class="col-lg-12">
                                                    <input class="form-control" id="dateFrom" name="dateFrom" type="text" value="#dateformat(lastmonth, "mm/dd/yyyy")#" aria-required="true">
                                                </div>
                                            </div>
                                        </div>

                                        <!--- Date To --->
                                        <div class="col-md-3">
                                            <div class="form-group row">
                                                <label for="dateTo" class="col-form-label col-lg-12">Date To</label>
                                                <div class="col-lg-12">
                                                    <input class="form-control DateSent" id="dateTo" name="dateTo" type="text" value="#dateformat(Now(), "mm/dd/yyyy")#" aria-required="true">
                                                </div>
                                            </div>
                                        </div>


                                        <!--- Action Button --->
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <div class="col-lg-12 d-flex justify-content-end">
                                                    <button type="submit" class="btn btn-purple waves-effect waves-light" style="min-width: 150px;">Search</button>
                                                    <a href="index.cfm?area=Transaction&action=TransactionInsert" class="btn btn-success ml-2" style="width: auto;" >
                                                        <i class="fa fa-plus-circle"></i> Add Transaction
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                  </div>                               
                              </form>
                            </div>		
                        </cfoutput>
    
                   </div>
                </div>

				<!-- End #wizard-vertical -->
			</div>
			<!-- End card-body -->
		</div>
		<!-- End card -->
	</div>
	<!-- end col -->
</div>	

<!--- alert goes here --->
<div id="alert"></div>

  <!---start search result here --->
  <div id="searchResultContainer">					
  
</div>
<!-- End Row -->
<!--- end search result here --->

<script>
	function loadTable(){
		var table = $('#Resultdatatable').dataTable( { aaSorting : [[0, 'desc']] } );
	}
  
	window.addEventListener('load', (event) => {
		  $('#dateFrom')
			  .datepicker({
				  format: 'mm/dd/yyyy',
				  autoclose: true,
				  orientation: 'bottom',
				  immediateUpdates: true,
				  todayHighlight: true, 
				  todayBtn: true,
			  });
  
		  $('#dateTo')
			  .datepicker({
				  format: 'mm/dd/yyyy',
				  autoclose: true,
				  orientation: 'bottom',
				  immediateUpdates: true,
				  todayHighlight: true, 
				  todayBtn: true,
			  });
  
		formTransactionSelect.submit();
        
	});
  </script>