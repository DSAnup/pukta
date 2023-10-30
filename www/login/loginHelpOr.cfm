<div class="account-pages my-5">
            <div class="container">
				<div class="row">
					<div class="col-md-6">
						<!---success alert --->
						<div class="alert alert-success alertHidden" id="successAlert"></div>
						
						<!--- error alert --->
						<div class="alert alert-danger alertHidden"  id="errorDiv">										
							<span id="errorMessage"></span>
						</div>
					</div>
				</div>	

                <div class="row justify-content-center">
				
                    <div class="col-md-6">
                        <div class="card mt-4 reset-usename-pass">
<!---                            <div class="card-header bg-img p-5 position-relative">
                                <div class="bg-overlay"></div>
                                <h4 class="text-white text-center mb-0">Sign In<br/> <br>Time Tracking System</h4>
                            </div>--->
							<h4 class="mb-0">Forget Password?</h4>

                            <div class="card-body p-4 mt-2">
                                <form method="post" action="partialIndex.cfm?area=login&action=ResetPasswordAction" target="formpost" >
		
                                    <div class="form-group mb-3">
                                        <input class="form-control" type="email" name="email"  placeholder="Email" value="">
                                    </div>

                                    <div class="form-group">
                                        <button class="btn btn-primary waves-effect width-md waves-light" type="submit"> Reset Password</button>
                                    </div>


                                </form>

                            </div>
							
                            <!-- end card-body -->
                        </div>
                        <!-- end card -->

                        <!-- end row -->

                    </div>
                    <div class="col-md-6">
                        <div class="card mt-4 reset-usename-pass">
							<h4 class="mb-0">Forget Username?</h4>
                            <div class="card-body p-4 mt-2">
                                <form method="post" action="partialIndex.cfm?area=login&action=ResetUsernameAction" target="formpost" >
									<!---success alert --->
			

                                    <div class="form-group mb-3">
                                        <input class="form-control" type="email" name="email"  placeholder="Username" value="">
                                    </div>

                                    <div class="form-group">
                                        <button class="btn btn-primary waves-effect width-md waves-light" type="submit"> Reset Username</button>
                                    </div>


                                </form>

                            </div>
							
                            <!-- end card-body -->
                        </div>
                        <!-- end card -->

                        <!-- end row -->

                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->

            </div>
        </div>


