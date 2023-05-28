<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Add Property Phase</h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                <li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
                  <li class="breadcrumb-item active">Add Property Phase</li>
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
              <h3 class="card-title">Add Property Phase</h3>
          </div>
          <div class="card-body">

              <div class="row">
                  <div class="col-12">
                      <cfoutput>
                          <div class="container">
                                  
                            <form action="/partialIndex.cfm?area=PropertyPhase&action=PropertyPhaseInsertAction" method="post" target="formpost">
                                <div class="form-group">
                                    <label for="PropertyPhaseName">Property Phase Name</label>
                                    <input type="text" name="PropertyPhaseName" id="PropertyPhaseName" class="form-control required" value="">
                                </div>
                                <div class="float-right">
                                    <a href="index.cfm?area=PropertyPhase&action=PropertyPhaseSelect" class="btn btn-danger waves-effect waves-light">Cancel</a>
                                    <button type="reset" class="btn btn-pink waves-effect waves-light">Reset</button>
                                    <button type="submit" class="btn btn-purple waves-effect waves-light">Add Property Phase</button>
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
                          
                          






