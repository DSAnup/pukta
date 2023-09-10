<cfquery datasource="#request.dsnameReader#" name="qPropertySelect"> 
	SELECT P.PropertyID, p.AddressLine1, p.City
	    FROM  Property  AS P		       
</cfquery>

<cfquery datasource="#request.dsnameReader#" name="qAppUserAccessLevelSelect"> 
    SELECT *
    FROM  AppUserAccessLevel    
</cfquery>

<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Add New User</h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
					<li class="breadcrumb-item active">Add New User</li>
				</ol>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<cfoutput>
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Add New User</h3>
				</div>
				<div class="card-body">

					<div class="row">
						<div class="col-md-6">
							<form method="post" action="partialIndex.cfm?area=appuser&action=UserInsertAction" target="formpost" >
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
										<input class="form-control required" id="FirstName" name="FirstName" type="text">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-2 control-label" for="LastName">Last Name*</label>
									<div class="col-lg-10">
										<input id="LastName" name="LastName" type="text" class="required form-control">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-2 control-label" for="Email">Email*</label>
									<div class="col-lg-10">
										<input id="Email" name="Email" type="text" class="required form-control">
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group row">
									<label class="col-lg-2 control-label" for="Password">Password*</label>
									<div class="col-lg-10">
										<input id="Password" name="PasswordHash" type="password" class="required form-control">
									</div>
								</div>
								<div class="form-group">
									<label for="AppUserAccessLevelID">Access Level *</label>
									<select class="form-control" name="AppUserAccessLevelID">
										<cfloop query="qAppUserAccessLevelSelect">
											<option value="#qAppUserAccessLevelSelect.AppUserAccessLevelID#">#qAppUserAccessLevelSelect.AccessLevelName#</option>
										</cfloop>
									</select>
								</div>
								<div class="form-group" style="margin-left:20px;">
									<input type="hidden" name="PropertyID">
									<cfloop query="qPropertySelect">
										<input class="form-check-input" type="checkbox" value="#qPropertySelect.PropertyID#" id="PropertyID" name="PropertyID">
										<label class="form-check-label" for="#qPropertySelect.PropertyID#" style="padding-right:25px;">
											#qPropertySelect.AddressLine1#, #qPropertySelect.City#
										</label>
									</cfloop>
								</div>
								<div class="form-group row custom-form-group">
									<label class="col-lg-12 control-label">(*) Mandatory</label>
								</div>
								<div class="form-group custom-form-group">
									<input type="submit" name="adduser" value="Submit" class="btn btn-success custom-btn">
								</div>
							</div>

							</form>
						</div>
						
						
						
						
					</div>


					<!-- End wizard-vertical -->
				</div>
				<!-- End card-body -->
			</div>
		</cfoutput>
		<!-- End card -->
	</div>
	<!-- end col -->
</div>