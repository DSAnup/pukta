<!-- Topbar Start -->
                    <div class="navbar-custom">
                        <div class="container-fluid">
                            <ul class="list-unstyled topnav-menu float-right mb-0">
    
                                <li class="dropdown notification-list">
                                    <!-- Mobile menu toggle-->
                                    <a class="navbar-toggle nav-link">
                                        <div class="lines">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </div>
                                    </a>
                                    <!-- End mobile menu toggle-->
                                </li>
                                
                                <!---<tr>
                                        <td>A basic message</td>
                                        <td>
                                            
                                        </td>
                                    </tr>--->
    
                               

    
                   			<cfif session.Profile.isLoggedIn eq true>

                                <li class="dropdown notification-list">
                                    <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                        <img src="assets/images/users/user.gif" alt="user-image" class="rounded-circle">
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                        <!-- item-->
                                        <div class="dropdown-header noti-title">
                                            <h6 class="text-overflow m-0">Welcome <cfoutput>#session.Profile.FirstName#!</cfoutput></h6>
                                        </div>
            
                                        
            
                                        <!-- item-->
                                        <a  href="index.cfm?area=appuser&action=updatePassword" class="dropdown-item notify-item">
                                            <i class="mdi mdi-face-profile"></i>
                                            <span>Change Password</span>
                                        </a>
            
            
                                        <div class="dropdown-divider"></div>
            
                                        <!-- item-->
                                        <a  href="/index.cfm?area=login&action=logout" class="dropdown-item notify-item">
                                            <i class="mdi mdi-power-settings"></i>
                                            <span>Logout</span>
                                        </a>
            
                                    </div>
                                </li>
                                
                              </cfif>
    
                                
                            </ul>
                
                             <!-- LOGO -->
                             <div class="logo-box">
                                <a href="index.html" class="logo text-center logo-dark">
                                    <span class="logo-lg">
                                        <img src="assets/images/logo.png" alt="" width="45">
                                        <!-- <span class="logo-lg-text-dark">Moltran</span> -->
                                    </span>
                                    <span class="logo-sm">
                                        <!-- <span class="logo-lg-text-dark">M</span> -->
                                        <img src="assets/images/logo.png" alt="" width="45">
                                    </span>
                                </a>

                                <a href="/" class="logo text-center logo-light">
                                    <span class="logo-lg">
                                        <!---<img src="assets/images/logo-light.png" alt="" height="16">--->
                                        <img src="/assets/images/logo.png" alt="" width="45">
                                        	
                                        	
                                        <!-- <span class="logo-lg-text-dark">Moltran</span> -->
                                    </span>
                                    <span class="logo-sm">
                                        <!-- <span class="logo-lg-text-dark">M</span> -->
                                        <img src="assets/images/logo.png" alt="" width="45">
                                    </span>
                                </a>
                            </div>
                            <!-- LOGO -->
    
                            <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
    
                                <li class="d-none d-sm-block">
                                    
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <!-- end Topbar -->