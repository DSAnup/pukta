  <cfquery datasource="#request.dsnameReader#" name="qTransactionSelect"> 

	SELECT T.*,  P.AddressLine1, PS.PropertySectionName, E.ExpenseTypeName
	FROM TransactionDetails AS T 
	LEFT JOIN Property AS P ON T.PropertyID = P.PropertyID
	LEFT JOIN PropertySection AS PS ON T.PropertySectionID = PS.PropertySectionID	 
	LEFT JOIN ExpenseType AS E ON T.ExpenseTypeID = E.ExpenseTypeID	 
          
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
			<div class="card-header">
				<h3 class="card-title floatleft">Show All Transaction </h3>
				<a href="index.cfm?area=Transaction&action=TransactionInsert" style="width: auto;" class="btn btn-success custom-btn floatright">Add Transaction</a>
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
											<th> Payee</th>
											<th> Property Address</th>
											<th> Property Section Name</th>
											<th> Expense Type</th>
											<th> Amount</th>
											<th> Transaction Date</th>
											<th> Note</th>
											<th>Action</th>
										</tr>
									</thead>
						
									<tbody>

      ,
									<cfloop query="qTransactionSelect">
										<tr>
											<td>
											#qTransactionSelect.TransactionID#
											</td>

											<td>
											#qTransactionSelect.Payee#
											</td>
											<td>
											#qTransactionSelect.AddressLine1#
											</td>
											<td>
											#qTransactionSelect.PropertySectionName#
											</td>
											<td>
											#qTransactionSelect.ExpenseTypeName#
											</td>
											<td>
											#qTransactionSelect.Amount#
											</td>
											<td>
												#DateFormat(qTransactionSelect.TransactionDate, "yyyy-mm-dd")#
											</td>
											<td>
											#qTransactionSelect.Note#
											</td>
											<td>
												<a href="#cgi.script_name#?area=#url.area#&action=TransactionUpdate&TransactionID=#TransactionID#">Edit</a>
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
