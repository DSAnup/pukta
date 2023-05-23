<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">Update Password</h4>
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Update Password</li>
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
				<h3 class="card-title">Update Your Password</h3>
			</div>
			<div class="card-body">

				<div class="row">
					<div class="col-md-6">
						<form method="post" action="partialIndex.cfm?area=appuser&action=updatePasswordAction" target="formpost" >
									<!---success alert --->
									<div class="alert alert-success alertHidden"  id="successDiv">										
										<span id="successMessage"></span>
									</div>
									
									<!--- error alert --->
									<div class="alert alert-danger alertHidden"  id="errorDiv">										
										<span id="errorMessage"></span>
									</div>
						
							<div class="form-group row">
								<label class="col-lg-2 control-label" for="currentpassword">Current Password*</label>
								<div class="col-lg-10">
									<input class="form-control required" id="currentpassword" name="currentpassword" type="password">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-2 control-label" for="password1">New Password *</label>
								<div class="col-lg-10">
									<input id="password" name="PasswordHash" type="password" class="required form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-2 control-label" for="confirm1">Confirm Password *</label>
								<div class="col-lg-10">
									<input id="repassword" name="repassword" type="password" class="required form-control">
								</div>
							</div>
							<div class="form-group row custom-form-group">
								<label class="col-lg-12 control-label">(*) Mandatory</label>
							</div>
							<div class="form-group custom-form-group">
								<input type="submit" name="updatepassword" value="Update" class="btn btn-success custom-btn">
							</div>

						</form>
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