  <cfquery datasource="#request.dsnameReader#" name="qDocumentSelect"> 
    SELECT D.*, DT.DocumentTypeName, 
		CONCAT(P.AddressLine1,' - ', P.City ,' - ', (SELECT stateName FROM State WHERE StateID = P.StateID) ,' - ', P.ZipCode) AS Property
    FROM  Document AS D
		LEFT JOIN DocumentType AS DT ON DT.DocumentTypeID = D.DocumentTypeID
		LEFT JOIN Property AS P ON P.PropertyID =  D.PropertyID  
  </cfquery>

<!--- <cfdump var="#qDocumentSelect#"> --->
<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Show All Document</h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
					<li class="breadcrumb-item active">Show All Document</li>
				</ol>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title floatleft">Show All Document</h3>
				<a href="index.cfm?area=Document&action=DocumentInsert" style="width: auto;" class="btn btn-success custom-btn floatright">Add Document</a>
			</div>
			<div class="card-body">

				<div class="row">
					<div class="col-12">
						<cfoutput>
							<div class="container table-responsive">
								<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>ID</th>
											<th>Document  Name</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<cfloop query="qDocumentSelect">
											<tr>
												<td>
													#currentRow#
												</td>
												<td>
													#qDocumentSelect.DocumentTypeName#
												</td>
												<td>
													<a href="#cgi.script_name#?area=#url.area#&action=DocumentUpdate&DocumentID=#DocumentID#">Edit</a>
												</td>
											</tr>
										</cfloop>
									</tbody>
								</table>
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
