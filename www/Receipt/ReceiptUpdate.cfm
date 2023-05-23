<cfquery datasource="#request.dsnameReader#" name="qReceiptSelect"> 
    SELECT R.*, TD.Payee
      FROM Receipt AS R 
      LEFT JOIN TransactionDetails AS TD ON R.TransactionID = TD.TransactionID
      where ReceiptID = <cfqueryparam cfsqltype="cf_sql_integer" value="#ReceiptID#">
        
</cfquery>
<cfquery datasource="#request.dsnameReader#" name="qTransactionSelect"> 
    SELECT *
      FROM  TransactionDetails    
</cfquery>

<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Update Receipt</h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                  <li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
                  <li class="breadcrumb-item active">Update Receipt</li>
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
              <h3 class="card-title">Update Receipt</h3>
          </div>
          <div class="card-body">

              <div class="row">
                  <div class="col-12">
                      <cfoutput>
                          <div class="container">
                            <div class="row"> 
                                <div class="col-md-6">
                                    <form action="/partialIndex.cfm?area=Receipt&action=ReceiptUpdateAction" method="post" target="formpost" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="ReceiptTitle">Recipt Title</label>
                                            <input type="text" name="ReceiptTitle" id="ReceiptTitle" class="form-control required" value="#qReceiptSelect.ReceiptTitle#">
                                        </div>
                                        <div class="form-group">
                                            <label for="TransactionID">Payee</label>
                                            <select class="form-control" data-toggle="select2" name="TransactionID" data-placeholder="Choose a Payee...">
                                                <option value="">&nbsp;</option>
                                                <cfloop query="qTransactionSelect">
                                                    <option value="#qTransactionSelect.TransactionID#" <cfif qTransactionSelect.TransactionID eq qReceiptSelect.TransactionID>selected</cfif>>#qTransactionSelect.Payee#</option>
                                                </cfloop>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="ReceiptFileName">Receipt File </label>
                                            <img src="#request.publicSiteDomain#/assets/uploads/#qReceiptSelect.ReceiptFileName#" class="img-thumbnail" alt="#qReceiptSelect.ReceiptFileName#" width="100" height="100">
                                            <input type="file" name="ReceiptFileName" id="ReceiptFileName" class="form-control required">
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="Note">Note</label>
                                            <textarea class="form-control" rows="6" id="example-textarea-input" name="Note">#qReceiptSelect.Note#</textarea>
                                        </div>
                                        
                                        <input type="hidden" name="ReceiptID" value="#url.ReceiptID#" />
                                        <a href="index.cfm?area=Receipt&action=ReceiptSelect" class="btn btn-danger waves-effect waves-light">Cancel</a>
                                        <button type="submit" class="btn btn-purple waves-effect waves-light float-right">Update Receipt</button>
                                    
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
                          
                          






