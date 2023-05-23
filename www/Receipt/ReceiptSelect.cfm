  <cfquery datasource="#request.dsnameReader#" name="qReceiptSelect"> 
      SELECT R.*, TD.Payee
        FROM  Receipt  as R
		LEFT JOIN TransactionDetails AS TD ON R.TransactionID = TD.TransactionID
          
  </cfquery>

<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Show All Receipt </h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
					<li class="breadcrumb-item active">Show All Receipt </li>
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
				<h3 class="card-title floatleft">Show All Receipt </h3>
				<a href="index.cfm?area=Receipt&action=ReceiptInsert" style="width: auto;" class="btn btn-success custom-btn floatright">Add Receipt</a>
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
											<th> Receipt Title</th>
											<th> Receipt File</th>
											<th> Payee </th>
											<th>Action</th>
										</tr>
									</thead>
						
									<tbody>

      ,
									<cfloop query="qReceiptSelect">
										<tr>
											<td>
											#qReceiptSelect.ReceiptID#
											</td>

											<td>
											#qReceiptSelect.ReceiptTitle#
											</td>
											<td>
												<img src="#request.publicSiteDomain#/assets/uploads/#qReceiptSelect.ReceiptFileName#" class="img-thumbnail" alt="#qReceiptSelect.ReceiptFileName#" width="100" height="100">
											</td>
											<td>
											#qReceiptSelect.Payee#
											</td>
											<td>
												<a href="#cgi.script_name#?area=#url.area#&action=ReceiptUpdate&ReceiptID=#ReceiptID#">Edit</a>
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
