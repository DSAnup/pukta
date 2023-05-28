<cfquery datasource="#request.dsnameReader#" name="qPropertyPhaseSelect"> 
    SELECT *
    FROM  PropertyPhase    
</cfquery>
<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Add Property Section</h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                <li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
                  <li class="breadcrumb-item active">Add Property Section</li>
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
              <h3 class="card-title">Add Property Section</h3>
          </div>
          <div class="card-body">

              <div class="row">
                  <div class="col-12">
                      <cfoutput>
                          <div class="container">
                                  
                            <form action="/partialIndex.cfm?area=PropertySection&action=PropertySectionInsertAction" method="post" target="formpost">
                                <div class="form-group">
                                    <label for="PropertySectionName">Property Section Name</label>
                                    <input type="text" name="PropertySectionName" id="PropertySectionName" class="form-control required" value="">
                                </div>
                                <div class="form-group">
                                    <label for="PropertyPhase">Property Phase *</label>
                                    <select class="form-control" name="PropertyPhaseID">
                                        <option value="">Choose a Property Phase</option>
                                        <cfloop query="qPropertyPhaseSelect">
                                            <option value="#qPropertyPhaseSelect.PropertyPhaseID#">#qPropertyPhaseSelect.PropertyPhaseName#</option>
                                        </cfloop>
                                    </select>
                                </div>
                                <div class="float-right">
                                    <a href="index.cfm?area=PropertySection&action=PropertySectionSelect" class="btn btn-danger waves-effect waves-light">Cancel</a>
                                    <button type="reset" class="btn btn-pink waves-effect waves-light">Reset</button>
                                    <button type="submit" class="btn btn-purple waves-effect waves-light">Add Property Section</button>
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
                          
                          






