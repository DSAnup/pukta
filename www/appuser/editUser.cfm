<cfquery datasource="#request.dsnameReader#" name="qSelecUser"> 
  select FirstName, LastName, Email, Password
	from Appuser where AppUserID = #url.AppUserID#      
	  
</cfquery>
	
 <!--- <cfquery datasource="#request.dsnameReader#" name="qCategorySelectByID"> 
      select BlogCategoryName
        from BlogCategory  where BlogCategoryID =  #url.BlogCategoryID#  
          
    </cfquery>--->
    
<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Add New User</h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Add New User</li>
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
				<h3 class="card-title">Add New Users</h3>
			</div>
			<div class="card-body">

				<div class="row">
					<div class="col-md-6">
					<cfoutput>
						<form method="post" action="partialIndex.cfm?area=appuser&action=editUserAction" target="formpost" >
								<!---success alert --->
								<div class="alert alert-success alertHidden"  id="successDiv">										
									<span id="successMessage"></span>
								</div>
								
								<!--- error alert --->
								<div class="alert alert-danger alertHidden"  id="errorDiv">										
									<span id="errorMessage"></span>
								</div>
	
							<div class="form-group row">
								<label class="col-lg-2 control-label" for="FirstName">First Name*</label>
								<div class="col-lg-10">
									<input class="form-control required" id="FirstName" name="FirstName" type="text" value="#qSelecUser.FirstName#">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-2 control-label" for="LastName">Last Name*</label>
								<div class="col-lg-10">
									<input id="LastName" name="LastName" type="text" class="required form-control" value="#qSelecUser.LastName#" >
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-2 control-label" for="Email">Email*</label>
								<div class="col-lg-10">
									<input id="Email" name="Email" type="text" class="required form-control" value="#qSelecUser.Email#" >
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-2 control-label" for="Password">Password*</label>
								<div class="col-lg-10">
									<input id="Password" name="Password" type="password" class="required form-control" value="#qSelecUser.Password#">
								</div>
							</div>
							<div class="form-group row custom-form-group">
								<label class="col-lg-12 control-label">(*) Mandatory</label>
							</div>
							<div class="form-group custom-form-group">
								<input type="hidden" name="AppUserID" value="#url.AppUserID#" />
								<input type="submit" name="updateuser" value="Update" class="btn btn-success custom-btn">
							</div>

						</form>
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