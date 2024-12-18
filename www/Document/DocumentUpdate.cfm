<cfquery datasource="#request.dsnameReader#" name="qDocumentSelect"> 
    SELECT *
    FROM Document 
    WHERE DocumentID = <cfqueryparam cfsqltype="cf_sql_integer" value="#DocumentID#">
</cfquery>

<cfquery datasource="#request.dsnameReader#" name="qPropertySelect"> 
    SELECT CONCAT(P.AddressLine1,' - ', P.City ,' - ', (SELECT stateName FROM State WHERE StateID = P.StateID) ,' - ', P.ZipCode) AS Property, P.PropertyID
    FROM  Property AS P
</cfquery>

<cfquery datasource="#request.dsnameReader#" name="qDocumentTypeSelect"> 
    SELECT *
    FROM  DocumentType     
</cfquery>

<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Update Document</h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                  <li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
                  <li class="breadcrumb-item active">Update Document</li>
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
              <h3 class="card-title">Update Document</h3>
          </div>
          <div class="card-body">
            <div class="row">
                <div class="col-12">
                    <cfoutput>
                        <div class="container">
                          <div class="row"> 
                              <div class="col-md-6">
                                  <form action="/partialIndex.cfm?area=Document&action=DocumentUpdateAction" method="post" target="formpost"  enctype="multipart/form-data">
                                      <div class="form-group">
                                          <label for="PropertyID">Property</label>
                                          <select class="form-control required" name="PropertyID">
                                              <option value="">Choose a Property</option>
                                              <cfloop query="qPropertySelect">
                                                  <option value="#qPropertySelect.PropertyID#" <cfif qDocumentSelect.PropertyID eq qPropertySelect.PropertyID>selected</cfif>>#qPropertySelect.Property#</option>
                                              </cfloop>
                                          </select>
                                      </div>
                                      <div class="form-group">
                                          <label for="DocumentTypeID">Document Type </label>
                                          <select class="form-control required" name="DocumentTypeID">
                                              <option value="">Choose a Document Type </option>
                                              <cfloop query="qDocumentTypeSelect">
                                                  <option value="#qDocumentTypeSelect.DocumentTypeID#" <cfif qDocumentSelect.DocumentTypeID eq qDocumentTypeSelect.DocumentTypeID>selected</cfif>>#qDocumentTypeSelect.DocumentTypeName#</option>
                                              </cfloop>
                                          </select>
                                      </div>
                                      <div class="form-group">
                                        <label for="DocumentDescription">Description</label>
                                        <textarea class="form-control" rows="5" id="example-textarea-input" name="DocumentDescription"></textarea>
                                    </div>
                                      
                                  </div>
                                  <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="DocumentFileName">File *</label>
                                        <cfif fileExists("#request.imagesUploadPath#\Documents\#qDocumentSelect.DocumentFileName#")>
                                            <br>
                                            <a href="#request.publicSiteDomain#/assets/uploads/Documents/#qDocumentSelect.DocumentFileName#" target="_blank">View File</a>
                                        </cfif>
                                        <input type="file" name="DocumentFileName" id="DocumentFileName" class="form-control required" accept=".pdf, .png, .jpg, .jpeg, .doc, .docx, .xls, .xlsx">
                                    </div>
                                      <div class="form-group">
                                          <label for="DocumentNote">Note</label>
                                          <textarea class="form-control" rows="5" id="example-textarea-input" name="DocumentNote">#qDocumentSelect.DocumentNote#</textarea>
                                      </div>

                                      <input type="hidden" name="DocumentID" value="#qDocumentSelect.DocumentID#">

                                      <div class="float-right">
                                          <a href="index.cfm?area=Document&action=DocumentSelect" class="btn btn-danger waves-effect waves-light">Cancel</a>
                                          <button type="reset" class="btn btn-pink waves-effect waves-light">Reset</button>
                                          <button type="submit" class="btn btn-purple waves-effect waves-light">Update Document</button>
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
                          
                          






