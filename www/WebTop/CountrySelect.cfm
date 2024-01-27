  <cfquery datasource="#request.dsnameReader#" name="qCountrySelect"> 
      select *
        from Country      
          
  </cfquery>

<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Show All Website</h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Show All Website</li>
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
				<h3 class="card-title floatleft">Show All Website</h3>
				<a href="index.cfm?area=WebTop&action=CountryInsert" style="width: auto;" class="btn btn-success custom-btn floatright">Add Country Manager</a>
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
											<th>ISO2</th>
											<th>Country Name</th>
											<th>Long Country Name</th>
											<th>ISO3</th>
											<th>Num Code</th>
											<th>UN Member State</th>
											<th>Calling Code</th>
											<th>CCTLD</th>
											<th>International Region</th>
											<th>Action</th>
										</tr>
									</thead>
						
									<tbody>

      ,
									<cfloop query="qCountrySelect">
										<tr>
											<td>#qCountrySelect.CountryID#</td>
											<td>
											#qCountrySelect.ISO2#
											</td>

											<td>
											#qCountrySelect.CountryName#
											</td>

											<td>
											#qCountrySelect.LongCountryName#
											</td>

											<td>
											#qCountrySelect.ISO3#
											</td>

											<td>
											#qCountrySelect.NumCode#
											</td>

											<td>
											#qCountrySelect.UNMemberState#
											</td>

											<td>
											#qCountrySelect.CallingCode#
											</td>

											<td>
											
											#qCountrySelect.CCTLD#
											</td>

											<td>
											
											#qCountrySelect.InternationalRegion#
											</td>

											<td>						
												<a href="#cgi.script_name#?area=#url.area#&action=CountryUpdate&CountryID=#CountryID#">Edit</a>								
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
