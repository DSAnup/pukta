<cfquery datasource="#request.dsnameReader#" name="qDocumentTypeSelect"> 
    SELECT DocumentTypeName
    FROM DocumentType 
        WHERE DocumentTypeID = <cfqueryparam cfsqltype="cf_sql_integer" value="#DocumentTypeID#">       
</cfquery>

<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Update Document Type Name</h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                  <li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
                  <li class="breadcrumb-item active">Update Document Type Name</li>
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
              <h3 class="card-title">Update Document Type Name</h3>
          </div>
          <div class="card-body">

              <div class="row">
                  <div class="col-12">
                      <cfoutput>
                          <div class="container">

                                  
                            <form action="/partialIndex.cfm?area=DocumentType&action=DocumentTypeUpdateAction" method="post" target="formpost">
                                <div class="form-group">
                                    <label for="DocumentTypeName">Document Type Name</label>
                                    <input type="text" name="DocumentTypeName" id="DocumentTypeName" class="form-control required" value="#qDocumentTypeSelect.DocumentTypeName#">
                                </div>

                                <div class="float-right">
                                    <input type="hidden" name="DocumentTypeID" value="#url.DocumentTypeID#" />
                                    <a href="index.cfm?area=DocumentType&action=DocumentTypeSelect" class="btn btn-danger waves-effect waves-light">Cancel</a>
                                    <button type="reset" class="btn btn-pink waves-effect waves-light">Reset</button>
                                    <button type="submit" class="btn btn-purple waves-effect waves-light">Update Document Type</button>
                                </div>
                            </form>

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
                          
                          






