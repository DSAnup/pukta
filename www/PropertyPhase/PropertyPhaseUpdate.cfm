<cfquery datasource="#request.dsnameReader#" name="qPropertyPhaseSelect"> 
    SELECT PropertyPhaseName
    FROM PropertyPhase 
        WHERE PropertyPhaseID = <cfqueryparam cfsqltype="cf_sql_integer" value="#PropertyPhaseID#">        
</cfquery>

<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Update Property Phase Name</h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                  <li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
                  <li class="breadcrumb-item active">Update Property Phase Name</li>
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
              <h3 class="card-title">Update Property Phase Name</h3>
          </div>
          <div class="card-body">

              <div class="row">
                  <div class="col-12">
                      <cfoutput>
                          <div class="container">

                                  
                            <form action="/partialIndex.cfm?area=PropertyPhase&action=PropertyPhaseUpdateAction" method="post" target="formpost">
                                <div class="form-group">
                                    <label for="PropertyPhaseName">Property Phase Name</label>
                                    <input type="text" name="PropertyPhaseName" id="PropertyPhaseName" class="form-control required" value="#qPropertyPhaseSelect.PropertyPhaseName#">
                                </div>

                                <div class="float-right">
                                    <input type="hidden" name="PropertyPhaseID" value="#url.PropertyPhaseID#" />
                                    <a href="index.cfm?area=PropertyPhase&action=PropertyPhaseSelect" class="btn btn-danger waves-effect waves-light">Cancel</a>
                                    <button type="reset" class="btn btn-pink waves-effect waves-light">Reset</button>
                                    <button type="submit" class="btn btn-purple waves-effect waves-light">Update Property Phase</button>
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
                          
                          






