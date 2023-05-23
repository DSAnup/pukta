

	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.StateCode) eq "">
		<cfset errorMessage = errorMessage & "State Code must be provided.<br>">	
	</cfif>
	<cfif trim(form.StateName) eq "">
		<cfset errorMessage = errorMessage & "State Name must be provided.<br>">	
	</cfif>

      <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  
    
        
        
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >

		
	UPDATE [dbo].[State]
	SET [StateCode] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.StateCode#">
		,[StateName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.StateName#">
		,[DateCreated] = getDate()
		,[CreatedBy] = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
		,[DateLastUpdated] = getDate()
		,[UpdatedBy]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
 	WHERE 
 		StateID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.StateID#">	
	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('State Name Updated Successfully')">
<cfset relocate (area = "WebTop", action = "UsStateManager")>