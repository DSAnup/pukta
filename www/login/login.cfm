
<cfif isdefined("cookie.appuserID") and val(cookie.AppUserID) gt 0>
	<cflocation url="partialIndex.cfm?area=login&action=loginFromCookie"  addtoken="false" >
</cfif>


<div class="account-pages my-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card mt-4">
                            <div class="card-header bg-img p-5 position-relative">
                                <div class="bg-overlay"></div>
                                <h4 class="text-white text-center mb-0">Sign In<br/> <br>Pukta</h4>
                            </div>
							

                            <div class="card-body p-4 mt-2">
                                <form method="post" action="partialIndex.cfm?area=login&action=loginaction" target="formpost" >
									<!---success alert --->
									<div class="alert alert-success alertHidden" id="successAlert"></div>
									
									<!--- error alert --->
									<div class="alert alert-danger alertHidden"  id="errorDiv">										
										<span id="errorMessage"></span>
									</div>

                                    <div class="form-group mb-3">
                                        <input class="form-control" type="email" name="email"  placeholder="Username" value="">
                                    </div>

                                    <div class="form-group mb-3">
                                        <input class="form-control" type="password" name="PasswordHash" placeholder="Password" value="">
                                    </div>

                                    <div class="form-group mb-3">
										<div class="row">
										   <div class="col-md-6">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input" id="checkbox-signin" name="rememberme">
													<label class="custom-control-label" for="checkbox-signin">Remember me</label>
												</div>
										   </div>
										   <div class="col-md-6">
										   		<div class="helpLogin">
													<a href="index.cfm?area=login&action=loginHelp">Help With Login</a>
												</div>
										   </div>
										</div>

          
                                    </div>

                                    <div class="form-group text-center mt-5 mb-4">
                                        <button class="btn btn-primary waves-effect width-md waves-light" type="submit"> Log In </button>
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


