<cfquery datasource="#request.dsnameReader#" name="qStateSelect"> 
    select StateCode, StateName
      from State where StateID = <cfqueryparam cfsqltype="cf_sql_integer" value="#StateID#">
        
</cfquery>

<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Update State Name</h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item active">Update State Name</li>
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
              <h3 class="card-title">Update State Name</h3>
          </div>
          <div class="card-body">

              <div class="row">
                  <div class="col-12">
                      <cfoutput>
                          <div class="container">

                                  
                            <form action="/gate.cfm?area=WebTop&action=UsStateUpdateAction" method="post" target="formpost">
                                <div class="form-group">
                                    <label for="StateCode">State Code</label>
                                    <input type="text" name="StateCode" id="StateCode" maxlength="2" class="form-control required" value="#qStateSelect.StateCode#">
                                </div>
                                <div class="form-group">
                                    <label for="StateName">State Name</label>
                                    <input type="text" name="StateName" id="StateName" class="form-control required" value="#qStateSelect.StateName#">
                                </div>

                                <input type="hidden" name="StateID" value="#url.StateID#" />
                                <button type="submit" class="btn btn-purple waves-effect waves-light">Update</button>
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
                          
                          






