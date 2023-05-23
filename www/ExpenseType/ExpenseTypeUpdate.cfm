<cfquery datasource="#request.dsnameReader#" name="qExpenseTypeSelect"> 
    select ExpenseTypeName
      from ExpenseType where ExpenseTypeID = <cfqueryparam cfsqltype="cf_sql_integer" value="#ExpenseTypeID#">
        
</cfquery>

<div class="row">
  <div class="col-12">
      <div class="page-title-box">
          <h4 class="page-title">Update Expense Type Name</h4>
          <div class="page-title-right">
              <ol class="breadcrumb p-0 m-0">
                  <li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
                  <li class="breadcrumb-item active">Update Expense Type Name</li>
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
              <h3 class="card-title">Update Expense Type Name</h3>
          </div>
          <div class="card-body">

              <div class="row">
                  <div class="col-12">
                      <cfoutput>
                          <div class="container">

                                  
                            <form action="/partialIndex.cfm?area=ExpenseType&action=ExpenseTypeUpdateAction" method="post" target="formpost">
                                <div class="form-group">
                                    <label for="ExpenseTypeName">Expense Type Name</label>
                                    <input type="text" name="ExpenseTypeName" id="ExpenseTypeName" class="form-control required" value="#qExpenseTypeSelect.ExpenseTypeName#">
                                </div>

                                <input type="hidden" name="ExpenseTypeID" value="#url.ExpenseTypeID#" />
                                <a href="index.cfm?area=ExpenseType&action=ExpenseTypeSelect" class="btn btn-danger waves-effect waves-light">Cancel</a>
                                <button type="submit" class="btn btn-purple waves-effect waves-light float-right">Update Expense Type</button>
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
                          
                          






