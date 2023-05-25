<cfquery datasource="#request.dsnameReader#" name="qTransactionSelect"> 

	SELECT T.*,  P.AddressLine1, PS.PropertySectionName, E.ExpenseTypeName, R.ReceiptFileName, R.TransactionID AS RT, R.ReceiptFileName, R.ReceiptTitle
	FROM TransactionDetails AS T 
	LEFT JOIN Property AS P ON T.PropertyID = P.PropertyID
	LEFT JOIN PropertySection AS PS ON T.PropertySectionID = PS.PropertySectionID	 
	LEFT JOIN ExpenseType AS E ON T.ExpenseTypeID = E.ExpenseTypeID	
	LEFT JOIN Receipt AS R ON T.TransactionID = R.TransactionID
          
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
											<th> Property</th>
											<th> Property Section</th>
											<th> Expense Type</th>
											<th> Amount</th>
											<th> Transaction Date</th>
											<th> Receipt List</th>
											<th> Note</th>
											<th>Action</th>
										</tr>
									</thead>
						
									<tbody>
									<cfset index = 0 >
									<cfloop query="qTransactionSelect" group="RT" >
										<cfset index = index + 1 >
										<tr>
											<td>
											#index#
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
												<cfif qTransactionSelect.ReceiptFileName neq ''>
													<cfloop>
														<a href="#request.publicSiteDomain#/assets/uploads/#qTransactionSelect.ReceiptFileName#" target="_blank">
															<cfif listLast(qTransactionSelect.ReceiptFileName, '.') eq 'jpg'>
																<i class="mdi mdi-file-image-outline md2x"  data-toggle="tooltip" data-placement="right" title="#qTransactionSelect.ReceiptTitle#"></i>
															<cfelse>
																<i class="mdi mdi-file-pdf-box-outline md2x"  data-toggle="tooltip" data-placement="right" title="#qTransactionSelect.ReceiptTitle#"></i>
															</cfif>
														</a>
													</cfloop>
												</cfif>
											<a data-toggle="modal" data-target="##con-close-modal_#qTransactionSelect.TransactionID#" href="##"> <i class="mdi mdi-file-plus md2x" data-toggle="tooltip" data-placement="right" title="Add Reciept"></i> </a>
											
											<!--- Modal  --->
											<div id="con-close-modal_#qTransactionSelect.TransactionID#" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
																<h5 class="modal-title">Add Reciept</h5>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="row">
																<div class="col-md-12">
																<form action="/partialIndex.cfm?area=Receipt&action=ReceiptInsertAction2" method="post" target="formpost" enctype="multipart/form-data">
																	<div class="form-group">
																		<label for="ReceiptTitle">Recipt Title</label>
																		<input type="text" name="ReceiptTitle" id="ReceiptTitle" class="form-control required" value="">
																	</div>
																	<div class="form-group">
																		<label for="ReceiptFileName">Receipt File </label>
																		<input type="file" name="ReceiptFileName" id="ReceiptFileName" class="form-control required">
																	</div>
																	
																	<div class="form-group">
																		<label for="Note">Note</label>
																		<textarea class="form-control" rows="6" id="example-textarea-input" name="Note"></textarea>
																	</div>
																	<input type="hidden" name="TransactionID" value="#qTransactionSelect.TransactionID#" />
																	<div class="float-right">
																		<button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Cancel</button>
																		<a class="btn btn-pink waves-effect waves-light" onclick="resetform()" href="##">Reset</a>
																		<button type="submit" class="btn btn-purple waves-effect waves-light ">Add Receipt</button>
																	</div>
																</form>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /.modal -->
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
