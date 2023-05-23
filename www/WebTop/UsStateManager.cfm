  <cfquery datasource="#request.dsnameReader#" name="qStateSelect"> 
      select *
        from State      
          
  </cfquery>

<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Show All State</h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Show All State</li>
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
				<h3 class="card-title floatleft">Show All State</h3>
				<a href="index.cfm?area=WebTop&action=AddStateManager" style="width: auto;" class="btn btn-success custom-btn floatright">Add State Manager</a>
			</div>
			<div class="card-body">

				<div class="row">
					<div class="col-12">
						<cfoutput>
							<div class="container table-responsive">
								<table id="datatable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>ID</th>
											<th>State Code</th>
											<th>State Name</th>
											<th>Action</th>
										</tr>
									</thead>
						
									<tbody>

      ,
									<cfloop query="qStateSelect">
										<tr>
											<td>
											
											#qStateSelect.StateID#
											</td>

											<td>
											#qStateSelect.StateCode#
											</td>
											<td>
											#qStateSelect.StateName#
											</td>


											<td>
						
												<a href="#cgi.script_name#?area=#url.area#&action=UpdateStateManager&StateID=#StateID#">Edit</a>
								
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
