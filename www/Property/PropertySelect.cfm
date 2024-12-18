<cfquery datasource="#request.dsnameReader#" name="qPropertySelect"> 
	SELECT P.*, S.stateName
    FROM  Property  AS P
		LEFT JOIN State AS S ON P.StateID = S.StateID
	WHERE 1=1
	<cfif session.Profile.AppUserAccessLevelID eq 3 or session.Profile.PropertyID neq "" and session.Profile.AppUserAccessLevelID neq 1>
		AND P.PropertyID IN (#session.Profile.PropertyID#)
	</cfif>       
</cfquery>

<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Show All Property </h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
					<li class="breadcrumb-item active">Show All Property </li>
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
				<h3 class="card-title floatleft">Show All Property </h3>
				<a href="index.cfm?area=Property&action=PropertyInsert" style="width: auto;" class="btn btn-success custom-btn floatright">Add Property</a>
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
											<th> Address Line 1</th>
											<th> Address Line 2</th>
											<th> City</th>
											<th> State</th>
											<th> Zip Code</th>
											<th> Action</th>
										</tr>
									</thead>
									<tbody>
										<cfloop query="qPropertySelect">
											<tr>
												<td>
													#currentRow#
												</td>
												<td>
													#qPropertySelect.AddressLine1#
												</td>
												<td>
													#qPropertySelect.AddressLine2#
												</td>
												<td>
													#qPropertySelect.City#
												</td>
												<td>
													#qPropertySelect.stateName#
												</td>
												<td>
												#qPropertySelect.ZipCode#
												</td>
												<td>
													<a href="#cgi.script_name#?area=#url.area#&action=PropertyUpdate&PropertyID=#PropertyID#">Edit</a>
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
