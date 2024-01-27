<cfquery datasource="#request.dsnameReader#" name="qCountrySelect"> 
    select *
      from Country where CountryID = <cfqueryparam cfsqltype="cf_sql_integer" value="#CountryID#">
        
</cfquery>

<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Update Country Manager</h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item active">Update Country Manager</li>
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
              <h3 class="card-title">Update Country Manager</h3>
          </div>
          <div class="card-body">

              <div class="row">
                  <div class="col-12">
                      <cfoutput>
                          <div class="container">


                  
                            <form action="/gate.cfm?area=WebTop&action=CountryUpdateAction" method="post" target="formpost">
                                <div class="form-group">
                                    <label for="ISO2">ISO2</label>
                                    <input type="text" name="ISO2" id="ISO2" class="form-control required" value="#qCountrySelect.ISO2#">
                                </div>
                                <div class="form-group">
                                    <label for="CountryName">Country Name</label>
                                    <input type="text" name="CountryName" id="CountryName" class="form-control required" value="#qCountrySelect.CountryName#">
                                </div>
                                <div class="form-group">
                                    <label for="LongCountryName">Long Country Name</label>
                                    <input type="text" name="LongCountryName" id="LongCountryName" class="form-control required" value="#qCountrySelect.LongCountryName#">
                                </div>
  
                                <div class="form-group">
                                    <label for="ISO3">ISO2</label>
                                    <input type="text" name="ISO3" id="ISO3" class="form-control required" value="#qCountrySelect.ISO3#">
                                </div>
                                <div class="form-group">
                                    <label for="NumCode">Num Code</label>
                                    <input type="text" name="NumCode" id="NumCode" class="form-control required" value="#qCountrySelect.NumCode#">
                                </div>
                                <div class="form-group">
                                    <label for="UNMemberState">UN Member State</label>
                                    <input type="text" name="UNMemberState" id="UNMemberState" class="form-control required" value="#qCountrySelect.UNMemberState#">
                                </div>
								
								
  
                                <div class="form-group">
                                    <label for="CallingCode">Calling Code</label>
                                    <input type="text" name="CallingCode" id="CallingCode" class="form-control required" value="#qCountrySelect.CallingCode#">
                                </div>
                                <div class="form-group">
                                    <label for="NumCode">CCTLD</label>
                                    <input type="text" name="CCTLD" id="CCTLD" class="form-control required" value="#qCountrySelect.CCTLD#">
                                </div>
                                <div class="form-group">
                                    <label for="InternationalRegion">International Region</label>
                                    <input type="text" name="InternationalRegion" id="InternationalRegion" class="form-control required" value="#qCountrySelect.InternationalRegion#">
                                </div>

                                <input type="hidden" name="CountryID" value="#url.CountryID#" />
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
                          
                          






