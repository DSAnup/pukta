<cfquery datasource="#request.dsnameReader#" name="qStateSelect"> 
    select *
      from  State    
</cfquery>

<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Add Property </h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                  <li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
                  <li class="breadcrumb-item active">Add Property </li>
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
              <h3 class="card-title">Add Property </h3>
          </div>
          <div class="card-body">

              <div class="row">
                  <div class="col-12">
                      <cfoutput>
                          <div class="container">
                            <div class="row"> 
                                <div class="col-md-6">
                                    <form action="/partialIndex.cfm?area=Property&action=PropertyInsertAction" method="post" target="formpost">
                                        <div class="form-group">
                                            <label for="AddressLine1">Address Line 1</label>
                                            <input type="text" name="AddressLine1" id="AddressLine1" class="form-control required" value="">
                                        </div>
                                        <div class="form-group">
                                            <label for="AddressLine2">Address Line 2</label>
                                            <input type="text" name="AddressLine2" id="AddressLine2" class="form-control required" value="">
                                        </div>
                                        <div class="form-group">
                                            <label for="City">City</label>
                                            <input type="text" name="City" id="City" class="form-control required" value="">
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="StateID">State</label>
                                            <select class="form-control" data-toggle="select2" name="StateID" data-placeholder="Choose a State...">
                                                <option value="">&nbsp;</option>
                                                <cfloop query="qStateSelect">
                                                    <option value="#qStateSelect.StateID#">#qStateSelect.stateName#</option>
                                                </cfloop>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="ZipCode">Zip Code</label>
                                            <input type="number" name="ZipCode" id="ZipCode" class="form-control required" value="">
                                        </div>

                                        <a href="index.cfm?area=Property&action=PropertySelect" class="btn btn-danger waves-effect waves-light">Cancel</a>
                                        <a class="btn btn-pink waves-effect waves-light" onclick="resetform()" href="##">Reset</a>
                                        <button type="submit" class="btn btn-purple waves-effect waves-light float-right">Add Property</button>
                                    
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
                          
                          






