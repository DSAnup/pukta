<cfquery datasource="#request.dsnameReader#" name="qSelecUser"> 
  select FirstName, LastName, Email, PasswordHash, AppUserAccessLevelID, PropertyID
	from Appuser where AppUserID = <cfqueryparam cfsqltype="cf_sql_integer" value=" #url.AppUserID#">        
</cfquery>

<cfquery datasource="#request.dsnameReader#" name="qPropertySelect"> 
	SELECT P.PropertyID, S.stateName, CONCAT(P.AddressLine1, '-', S.stateName) as PropertyState
    FROM  Property  AS P
		LEFT JOIN State AS S ON P.StateID = S.StateID        
</cfquery>

<cfquery datasource="#request.dsnameReader#" name="qAppUserAccessLevelSelect"> 
    SELECT *
    FROM  AppUserAccessLevel    
</cfquery>
    
<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Edit User</h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
					<li class="breadcrumb-item active">Edit User</li>
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
				<h3 class="card-title">Edit Users</h3>
			</div>
			<div class="card-body">

				<div class="row">
					<div class="col-md-6">
					<cfoutput>
						<form method="post" action="partialIndex.cfm?area=appuser&action=UserUpdateAction" target="formpost" >
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
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-lg-2 control-label" for="Password">Password*</label>
								<div class="col-lg-10">
									<input id="Password" name="passwordHash" type="password" class="required form-control" value="#qSelecUser.passwordHash#">
								</div>
							</div>
							<div class="form-group">
								<label for="AppUserAccessLevelID">Access Level *</label>
								<select class="form-control" name="AppUserAccessLevelID">
									<cfloop query="qAppUserAccessLevelSelect">
										<option value="#qAppUserAccessLevelSelect.AppUserAccessLevelID#" <cfif qAppUserAccessLevelSelect.AppUserAccessLevelID eq qSelecUser.AppUserAccessLevelID>selected</cfif>>#qAppUserAccessLevelSelect.AccessLevelName#</option>
									</cfloop>
								</select>
							</div>
							<div class="form-group" style="margin-left:20px;">
								<cfloop query="qPropertySelect">
									<input class="form-check-input"  <cfif listFind(qSelecUser.PropertyID, qPropertySelect.PropertyID)>checked</cfif> type="checkbox" value="#qPropertySelect.PropertyID#" id="#qPropertySelect.PropertyID#" name="PropertyID">
									<label class="form-check-label" for="#qPropertySelect.PropertyID#" style="padding-right:25px;" >
										#qPropertySelect.PropertyState#
									</label>
								</cfloop>
							</div>
							<div class="form-group row custom-form-group">
								<label class="col-lg-12 control-label">(*) Mandatory</label>
							</div>
							<div class="form-group custom-form-group">
								<input type="hidden" name="AppUserID" value="#url.AppUserID#" />
								<input type="submit" name="updateuser" value="Update" class="btn btn-success custom-btn">
							</div>
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