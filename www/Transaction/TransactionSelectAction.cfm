
<cfset session.PropertyID = form.PropertyID>


<cfquery datasource="#request.dsnameReader#" name="qTransactionSelect"> 
    SELECT 
        T.*, PS.PropertySectionName, E.ExpenseTypeName, R.ReceiptFileName, R.TransactionID AS RT, R.ReceiptFileName, R.ReceiptTitle, 
    CONCAT(P.AddressLine1,' - ', P.City ,' - ', (SELECT stateName FROM State WHERE StateID = P.StateID) ,' - ', P.ZipCode) AS Property
    
    FROM TransactionDetails AS T 
        LEFT JOIN Property AS P ON T.PropertyID = P.PropertyID
        LEFT JOIN PropertySection AS PS ON T.PropertySectionID = PS.PropertySectionID	 
        LEFT JOIN ExpenseType AS E ON T.ExpenseTypeID = E.ExpenseTypeID	
        LEFT JOIN Receipt AS R ON T.TransactionID = R.TransactionID   
    WHERE 1=1
        <cfif session.Profile.AppUserAccessLevelID eq 3 or session.Profile.PropertyID neq "">
            AND T.PropertyID IN (#session.Profile.PropertyID#)
        </cfif>
        <cfif trim(form.PropertyID) neq "">
            AND T.PropertyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.PropertyID#">
        </cfif>

        <cfif trim(form.Payee) neq "">
            AND T.Payee LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#form.Payee#%">
        </cfif>

        <cfif trim(form.dateFrom) neq "" and trim(form.dateTo) neq "">
            AND T.TransactionDate BETWEEN 
                    <cfqueryparam cfsqltype="cf_sql_timestamp" value="#form.dateFrom# 00:00:00">
                AND <cfqueryparam cfsqltype="cf_sql_timestamp" value="#form.dateTo# 23:59:59">
        </cfif>

    ORDER BY TransactionDate 
</cfquery>



<cfoutput>
	<div id="searchResult">
        <div class="row">
            <div class="col-12">
                <cfoutput>
                    <div class="container table-responsive">
                        <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th> Property</th>
                                    <th> Property Section</th>
                                    <th> Expense Type</th>
                                    <th> Amount</th>
                                    <th> Transaction Date</th>                                    
                                    <th> Note</th>
                                    <cfif session.Profile.AppUserAccessLevelID neq 3>
                                        <th> Payee</th>
                                        <cfif session.Profile.ShowInvoice eq 1>
                                            <th> Receipt</th>
                                        </cfif>
                                        <th>Action</th>
                                    </cfif>
                                </tr>
                            </thead>
                
                            <tbody>
                            <cfset index = 0>
                            <cfset grandTotal = 0>
                            <cfloop query="qTransactionSelect" group="TransactionID" >
                                <cfset index = index + 1>
                                <tr>
                                    <td>
                                        #index#
                                    </td>
                                    
                                    <td>
                                        #qTransactionSelect.Property#
                                    </td>
                                    <td>
                                        #qTransactionSelect.PropertySectionName#
                                    </td>
                                    <td>
                                        #qTransactionSelect.ExpenseTypeName#
                                    </td>
                                    <td>
                                        #dollarFormat(qTransactionSelect.Amount)#
                                        <cfset grandTotal = grandTotal + qTransactionSelect.Amount>
                                    </td>
                                    <td>
                                        #DateFormat(qTransactionSelect.TransactionDate, "yyyy-mm-dd")#
                                    </td>
                                    
                                    <td>
                                        #qTransactionSelect.Note#
                                    </td>
                                    <cfif session.Profile.AppUserAccessLevelID neq 3>
                                        <td>
                                            #qTransactionSelect.Payee#
                                        </td>
                                        <cfif session.Profile.ShowInvoice eq 1>
                                            <td>
                                                <cfif qTransactionSelect.ReceiptFileName neq ''>
                                                    <cfloop>
                                                        <a href="#request.publicSiteDomain#/assets/uploads/Receipt/#qTransactionSelect.ReceiptFileName#" target="_blank">
                                                            <cfif listLast(qTransactionSelect.ReceiptFileName, '.') eq 'jpg'  or listLast(qTransactionSelect.ReceiptFileName, '.') eq 'png' or listLast(qTransactionSelect.ReceiptFileName, '.') eq 'jpeg'>
                                                                <i class="mdi mdi-file-image-outline md2x"  data-toggle="tooltip" data-placement="right" title="#qTransactionSelect.ReceiptTitle#"></i>
                                                            <cfelseif listLast(qTransactionSelect.ReceiptFileName, '.') eq 'doc' or listLast(qTransactionSelect.ReceiptFileName, '.') eq 'docx'>
                                                                <i class="mdi mdi-file-document-box-outline md2x"  data-toggle="tooltip" data-placement="right" title="#qTransactionSelect.ReceiptTitle#"></i>
                                                            <cfelseif listLast(qTransactionSelect.ReceiptFileName, '.') eq 'xls' or listLast(qTransactionSelect.ReceiptFileName, '.') eq 'xlsx' or listLast(qTransactionSelect.ReceiptFileName, '.') eq 'csv'>
                                                                <i class="mdi mdi-file-excel-box-outline md2x"  data-toggle="tooltip" data-placement="right" title="#qTransactionSelect.ReceiptTitle#"></i>
                                                            <cfelse>
                                                                <i class="mdi mdi-file-pdf-box-outline md2x"  data-toggle="tooltip" data-placement="right" title="#qTransactionSelect.ReceiptTitle#"></i>
                                                            </cfif>
                                                        </a>
                                                    </cfloop>
                                                </cfif>
                                                <cfif session.Profile.AppUserAccessLevelID neq 3>
                                                    <a data-toggle="modal" data-target="##con-close-modal_#qTransactionSelect.TransactionID#" href="##"> <i class="mdi mdi-file-plus-outline md2x" data-toggle="tooltip" data-placement="right" title="Add Reciept"></i> </a>
                                                
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
                                                                        <form action="/partialIndex.cfm?area=Transaction&action=TransactionRecieptInsertAction" method="post" enctype="multipart/form-data">
                                                                            <div class="form-group">
                                                                                <label for="ReceiptTitle">Recipt Title *</label>
                                                                                <input type="text" name="ReceiptTitle" id="ReceiptTitle" class="form-control" value="">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="ReceiptFileName">Receipt File *</label>
                                                                                <input type="file" name="ReceiptFileName" id="ReceiptFileName" class="form-control required" accept=".pdf, .png, .jpg, .jpeg, .doc, .docx, .xls, .xlsx, .csv">
                                                                            </div>
                                                                            <span id="error-filename" style="display:none; color:red">Please choose a Recipt File *</span>
                                                                            <div class="form-group">
                                                                                <label for="Note">Note</label>
                                                                                <textarea class="form-control" rows="6" id="example-textarea-input" name="Note"></textarea>
                                                                            </div>
                                                                            <input type="hidden" name="TransactionID" value="#qTransactionSelect.TransactionID#" />
                                                                            <div class="float-right">
                                                                                <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Cancel</button>
                                                                                <button type="reset" class="btn btn-pink waves-effect waves-light">Reset</button>
                                                                                <button type="submit" class="btn btn-purple waves-effect waves-light">Add Receipt</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /.modal -->
                                                </cfif>
        
                                            </td>

                                        </cfif>
                                        <td>
                                            <a href="index.cfm?area=#url.area#&action=TransactionUpdate&TransactionID=#TransactionID#">Edit</a>
                                        </td>
                                    </cfif>
                                </tr>
                            </cfloop>

                            
                            
                            </tbody>
                            <th>
                                
                                <td></td>
                                <td>Balance</td>
                                <td></td>
                                <td>#dollarFormat(grandTotal)#</td>
                                <td></td>
                                
                                <td></td>

                            </th>
                        </table>
                    </div>		
                </cfoutput>

           </div>
        </div>
    </div>
</cfoutput>

<script lang="javascript">  
    window.parent.document.getElementById('alert').innerHTML  = '' ;
    window.parent.document.getElementById('searchResultContainer').innerHTML  = document.getElementById('searchResult').innerHTML ;  	
    window.parent.loadTable();  
    document.getElementById('searchResult').innerHTML  = ''; 
    
    var grandTotalPrice = '<cfoutput>#grandTotal#</cfoutput>';
    
    if(grandTotalPrice >= 0){
        window.parent.document.getElementById('balance').innerHTML = '<h4>Pukta Balance: <cfoutput>#dollarFormat(grandTotal)#</cfoutput></h4>';
    }else{
        window.parent.document.getElementById('balance').innerHTML = '<h4 style="color:red">Pukta Balance: <cfoutput>#dollarFormat(grandTotal)#</cfoutput></h4>';
    }

    if(grandTotalPrice <= 0){
        window.parent.document.getElementById('clientbalance').innerHTML = '<h4 style="; float:right;">Client Balance: <cfoutput>#dollarFormat(-grandTotal)#</cfoutput></h4>';
    }else{
        window.parent.document.getElementById('clientbalance').innerHTML = '<h4 style="color:red; float:right;">Client Balance: <cfoutput>#dollarFormat(-grandTotal)#</cfoutput></h4>';
    }

    
    
</script>


