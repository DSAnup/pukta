

<cffunction name="SHOWERRORMESSAGEUDF" >
 	
 	<cfargument name="Message" required="true" >
 	<cfargument name="errorDiv" required="false" default="" >
 	<cfargument name="errorMessage" required="false" default="" >
 	
 	
 	<cfoutput>
 	<script> 
 		parent.toastr.error('#arguments.Message#');	
 		parent.showErrorMessage ('#arguments.Message#', '#arguments.errorDiv#', '#arguments.errorMessage#');
 	</script>
 	</cfoutput>
 	
 </cffunction>
 
 <cfset cffile.SHOWERRORMESSAGE = SHOWERRORMESSAGEUDF>
 
  <cffunction name="RelocateUDF" >
 	
 	<cfargument name="area" required="false" default="" >
 	<cfargument name="action" required="false" default="" >
 	<cfargument name="urlParams" required="false" default="" >
 	
 	<cfoutput>
 	<cfif arguments.urlParams gt "">
 		<script>
	 		window.top.relocateMainPage ('#arguments.area#', '#arguments.action#', '#arguments.urlParams#');
	 	</script>
	 <cfelse>
	 	<script>
	 		window.top.relocateMainPage ('#arguments.area#', '#arguments.action#');
	 	</script>
 	</cfif>
 	</cfoutput>
 	
 </cffunction>
 
  <cfset cffile.Relocate = RelocateUDF>