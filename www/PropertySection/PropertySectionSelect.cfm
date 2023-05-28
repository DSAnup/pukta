  <cfquery datasource="#request.dsnameReader#" name="qPropertySectionSelect"> 
      	SELECT	PS.*, PP.PropertyPhaseName
        FROM	PropertySection AS PS
			LEFT JOIN	PropertyPhase AS PP ON PS.PropertyPhaseID = PP.PropertyPhaseID      
  </cfquery>

<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Show All Property Section</h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
					<li class="breadcrumb-item active">Show All Property Section</li>
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
				<h3 class="card-title floatleft">Show All Property Section</h3>
				<a href="index.cfm?area=PropertySection&action=PropertySectionInsert" style="width: auto;" class="btn btn-success custom-btn floatright">Add Property Section</a>
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
											<th> Property Section Name</th>
											<th> Property Phase Name</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									<cfloop query="qPropertySectionSelect">
										<tr>
											<td>
												#currentRow#
											</td>
											<td>
												#qPropertySectionSelect.PropertySectionName#
											</td>
											<td>
												#qPropertySectionSelect.PropertyPhaseName#
											</td>
											<td>
												<a href="#cgi.script_name#?area=#url.area#&action=PropertySectionUpdate&PropertySectionID=#PropertySectionID#">Edit</a>
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
