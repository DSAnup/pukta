
                       

					
                       

                    </div>
                    <!--- end container-fluid --->

                </div>
                <!-- end content -->

                

                <!--- Footer Start --->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">                            	
                            	<cfoutput>
                                2020 &copy; <a href="http://#cgi.http_host#" target="_blank">#listRest(cgi.http_host, '.')#</a> by <a href="http://www.cudura.com" target="_blank" >Cudura Software</a>
                            	</cfoutput>
                            </div>
                        </div>
                    </div>
                </footer>
                <!--- end Footer --->

            </div>

            <!---End of page content  --->

        </div>
        <!--- End od page wrapper --->

        
        <!--- Right Sidebar --->
        <div class="right-bar">
            <div class="rightbar-title">
                <a href="javascript:void(0);" class="right-bar-toggle float-right">
                    <i class="mdi mdi-close"></i>
                </a>
                <h4 class="font-17 m-0 text-white">Settings Panel</h4>
            </div>
            <div class="slimscroll-menu">
        
                <div class="p-4">
                   
                    <a href="/index.cfm?area=template&action=insert" class="btn btn-primary btn-block mt-3" ><i class="mdi mdi-file"></i> New Templates</a>
                    
                    <a href="/index.cfm?area=template&action=mergeCodeSelect" class="btn btn-primary btn-block mt-3" ><i class="mdi mdi-clipboard-text"></i> Merge Codes</a>
                    
                  	<!---<a href="/index.cfm?area=document&action=kill" class="btn btn-danger btn-block mt-3" ><i class="mdi mdi-clipboard-text"></i> Kill Word Instances</a>
                    --->
                </div>
            </div> <!-- end slimscroll-menu-->
        </div>
        <!--- /Right-bar --->

        <!--- Right bar overlay--->
        <div class="rightbar-overlay"></div>

        <!---<a href="javascript:void(0);" class="right-bar-toggle demos-show-btn">
            <i class="mdi mdi-settings-outline mdi-spin"></i> &nbsp;Settings
        </a>--->

        
        <!--- Dropzone js --->
        <!-- Plugins js -->
        <script src="/assets/libs/dropzone/dropzone.min.js"></script>
       
        
        <!--- third party js --->
        <script src="/assets/libs/datatables/jquery.dataTables.min.js"></script>
        <script src="/assets/libs/datatables/dataTables.bootstrap4.min.js"></script>

        <script src="/assets/libs/datatables/dataTables.responsive.min.js"></script>
        <script src="/assets/libs/datatables/responsive.bootstrap4.min.js"></script>

        <script src="/assets/libs/datatables/dataTables.buttons.min.js"></script>
        <script src="/assets/libs/datatables/buttons.bootstrap4.min.js"></script>

        <script src="/assets/libs/jszip/jszip.min.js"></script>
        <script src="/assets/libs/pdfmake/pdfmake.min.js"></script>
        <script src="/assets/libs/pdfmake/vfs_fonts.js"></script>

        <script src="/assets/libs/datatables/buttons.html5.min.js"></script>
        <script src="/assets/libs/datatables/buttons.print.min.js"></script>

        <script src="/assets/libs/datatables/dataTables.fixedHeader.min.js"></script>
        <script src="/assets/libs/datatables/dataTables.keyTable.min.js"></script>
        <script src="/assets/libs/datatables/dataTables.scroller.min.js"></script>

        <!--- Datatables init --->
        <script src="/assets/js/pages/datatables.init.js"></script>

        <script src="/assets/libs/moment/moment.min.js"></script>
        <script src="/assets/libs/jquery-scrollto/jquery.scrollTo.min.js"></script>
        <script src="/assets/libs/sweetalert2/sweetalert2.min.js"></script>
        <!-- Sweet alert init js-->
        <script src="/assets/js/pages/sweet-alerts.init.js"></script>
        
        <!--- Chat app --->
        <script src="/assets/js/pages/jquery.chat.js"></script>

        <!--- Todo app --->
        <script src="/assets/js/pages/jquery.todo.js"></script>

        <!--- flot chart --->
        <script src="/assets/libs/flot-charts/jquery.flot.js"></script>
        <script src="/assets/libs/flot-charts/jquery.flot.time.js"></script>
        <script src="/assets/libs/flot-charts/jquery.flot.tooltip.min.js"></script>
        <script src="/assets/libs/flot-charts/jquery.flot.resize.js"></script>
        <script src="/assets/libs/flot-charts/jquery.flot.pie.js"></script>
        <script src="/assets/libs/flot-charts/jquery.flot.selection.js"></script>
        <script src="/assets/libs/flot-charts/jquery.flot.stack.js"></script>
        <script src="/assets/libs/flot-charts/jquery.flot.crosshair.js"></script>

        <!--- Dashboard init JS --->
        <script src="/assets/js/pages/dashboard.init.js"></script>
        
        <!---jquery validation --->
        <script src="/assets/libs/jquery-validation/jquery.validate.min.js"></script>

        <!--- Validation init js--->
        <script src="/assets/js/pages/form-validation.init.js"></script>
      
          <script src="/assets/libs/toastr/toastr.min.js"></script>

        <script src="/assets/js/pages/toastr.init.js"></script>
        
        <script src="/assets/js/custom.js"></script>
		
       <script src="assets/libs/multiselect/jquery.multi-select.js"></script>
		<script src="assets/libs/select2/select2.min.js"></script>
        <script src="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
        
        
        <!---picker --->
        <script src="assets/libs/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
        <script src="assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
        <script src="assets/libs/bootstrap-toggle/bootstrap-toggle.min.js"></script>

        <!-- Init js-->
        <script src="assets/js/pages/form-advanced.init.js"></script>
        
        <script src="/assets/libs/x-editable/bootstrap-editable.min.js"></script>
        <script src="/assets/js/pages/form-xeditable.init.js"></script>
        
        <!--- App js --->
        <script src="/assets/js/app.min.js"></script>
        
		
		
	<!--- notification message --->
	<cfif isDefined("session.OnLoadMessage") and session.OnLoadMessage gt "">
		<cfoutput>
		<script>
			window.onload = (event) => {
				toastr.#session.OnLoadMessage#;
			};
			
		
		</script>
		</cfoutput>
		
		<cfset session.OnLoadMessage = "">
		
	</cfif>

    <!--- form reset --->
	<script>
        function resetform() {
                $('form').get(0).reset() 
            }
    </script>
	
		

    </body>

</html>