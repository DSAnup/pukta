

<div class="topbar-menu">
    <div class="container-fluid">
        <div id="navigation">
            <!-- Navigation Menu-->
            <ul class="navigation-menu">
            	
            	
            	<cfif session.Profile.isLoggedIn eq true>
	
		                <li class="has-submenu">
	                        <a href="index.cfm?area=dashboard&action=index">
	                            <i class="mdi mdi-book"></i> Dashboard </a>
	                    </li>
	
						<li class="has-submenu">
							<a href="##">
							<i class="mdi mdi-webhook"></i> WebTop </a>
							<ul class="submenu">
								<li><a href="index.cfm?area=WebTop&action=CountryManager"> <i class="mdi mdi-globe-model"></i> Country Manager</a></li>
								<li><a href="index.cfm?area=WebTop&action=UsStateManager"> <i class="mdi mdi-map-marker-check"></i> US State Manager</a></li>
								<hr class="solid">
								<li><a href="index.cfm?area=ExpenseType&action=ExpenseTypeSelect"> <i class="mdi mdi-equalizer"></i> Expense Type Manager</a></li>
								<hr class="solid">
								<li><a href="index.cfm?area=PropertySection&action=PropertySectionSelect"> <i class="mdi mdi-bee"></i> Property Section Manager</a></li>
							</ul>
						</li>
						<li class="has-submenu">
							<a href="##">
							<i class="mdi mdi-protocol"></i> Property </a>
							<ul class="submenu">
								<li><a href="index.cfm?area=Property&action=PropertySelect"> <i class="mdi mdi-protocol"></i> Property Manager</a></li>
							</ul>
						</li>
						<li class="has-submenu">
							<a href="##">
							<i class="mdi mdi-equalizer"></i> Expense </a>
							<ul class="submenu">
								<li><a href="index.cfm?area=Transaction&action=TransactionSelect"> <i class="mdi mdi-bottle-tonic-outline"></i> Transaction Manager</a></li>
							</ul>
						</li>

                <cfelse>

	                <li class="has-submenu">
	                    <a href="index.cfm?area=login&action=login"> <i class="mdi mdi-lock"></i> Log In </a>	                    
	                </li>                
                </cfif>                

            </ul>
            <!-- End navigation menu -->

            <div class="clearfix"></div>
        </div>
        <!-- end #navigation -->
    </div>
    <!-- end container -->
</div>
<!-- end navbar-custom -->