<cfquery datasource="#request.dsnameReader#" name="qTransactionSelect"> 
    SELECT *
    FROM TransactionDetails where TransactionID = <cfqueryparam cfsqltype="cf_sql_integer" value="#TransactionID#">
        
</cfquery>

<cfquery datasource="#request.dsnameReader#" name="qPropertySelect"> 
    SELECT CONCAT(P.AddressLine1,' - ', P.City ,' - ', (SELECT stateName FROM State WHERE StateID = P.StateID) ,' - ', P.ZipCode) AS Property, P.PropertyID
    FROM  Property AS P
</cfquery>

<cfquery datasource="#request.dsnameReader#" name="qPropertySectionSelect"> 
    SELECT *
    FROM  PropertySection    
</cfquery>

<cfquery datasource="#request.dsnameReader#" name="qExpenseTypeSelect"> 
    SELECT *
    FROM  ExpenseType    
</cfquery>

<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Update Transaction </h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                  <li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
                  <li class="breadcrumb-item active">Update Transaction </li>
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
              <h3 class="card-title">Update Transaction</h3>
          </div>
          <div class="card-body">

              <div class="row">
                  <div class="col-12">
                      <cfoutput>
                          <div class="container">
                            <div class="row"> 
                                <div class="col-md-6">
                                    <form action="/partialIndex.cfm?area=Transaction&action=TransactionUpdateAction" method="post" target="formpost">
                                        <div class="form-group">
                                            <label for="Payee">Payee</label>
                                            <input type="text" name="Payee" id="Payee" class="form-control required" value="#qTransactionSelect.Payee#">
                                        </div>
                                        <div class="form-group">
                                            <label for="PropertyID">Property Address</label>
                                            <select class="form-control" name="PropertyID">
                                                <option value="">Choose a Property Address</option>
                                                <cfloop query="qPropertySelect">
                                                    <option value="#qPropertySelect.PropertyID#" <cfif qTransactionSelect.PropertyID eq qPropertySelect.PropertyID>selected</cfif>>#qPropertySelect.Property#</option>
                                                </cfloop>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="PropertySectionID">Property Section Name</label>
                                            <select class="form-control" name="PropertySectionID">
                                                <option value="">Choose a Property Section</option>
                                                <cfloop query="qPropertySectionSelect">
                                                    <option value="#qPropertySectionSelect.PropertySectionID#" <cfif qTransactionSelect.PropertySectionID eq qPropertySectionSelect.PropertySectionID>selected</cfif>>#qPropertySectionSelect.PropertySectionName#</option>
                                                </cfloop>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="TransactionDate">Transaction Date</label>
                                            <input type="date" name="TransactionDate" id="TransactionDate" class="form-control required" value="#DateFormat(qTransactionSelect.TransactionDate, "yyyy-mm-dd")#">
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ExpenseTypeID">Expense Type</label>
                                            <select class="form-control" name="ExpenseTypeID">
                                                <option value="">Choose a Expense Type</option>
                                                <cfloop query="qExpenseTypeSelect">
                                                    <option value="#qExpenseTypeSelect.ExpenseTypeID#" <cfif qTransactionSelect.ExpenseTypeID eq qExpenseTypeSelect.ExpenseTypeID>selected</cfif>>#qExpenseTypeSelect.ExpenseTypeName#</option>
                                                </cfloop>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="Amount">Amount</label>
                                            <input type="number" name="Amount" id="Amount" class="form-control required" value="#qTransactionSelect.Amount#">
                                        </div>
                                        <div class="form-group">
                                            <label for="Note">Note</label>
                                            <textarea class="form-control" rows="5" id="example-textarea-input" name="Note">#qTransactionSelect.Note#</textarea>
                                        </div>
                                        
                                        <div class="float-right">
                                            <input type="hidden" name="TransactionID" value="#url.TransactionID#" />
                                            <a href="index.cfm?area=Transaction&action=TransactionSelect" class="btn btn-danger waves-effect waves-light">Cancel</a>
                                            <button type="reset" class="btn btn-pink waves-effect waves-light">Reset</button>
                                            <button type="submit" class="btn btn-purple waves-effect waves-light">Update Transaction</button>
                                        </div>
                                    
                                    </form>
                                </div>
                            </div>
                                  


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
                          
                          






