

	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.AddressLine1) eq "">
		<cfset errorMessage = errorMessage & "Address Line 1  must be provided.<br>">	
	</cfif>
	<cfif trim(form.City) eq "">
		<cfset errorMessage = errorMessage & "City  must be provided.<br>">	
	</cfif>
	<cfif trim(form.StateID) eq "">
		<cfset errorMessage = errorMessage & "State  must be provided.<br>">	
	</cfif>
	<cfif trim(form.ZipCode) eq "">
		<cfset errorMessage = errorMessage & "Zip Code  must be provided.<br>">	
	</cfif>

    <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  
    
        
        
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >
		UPDATE [dbo].[Property]
		SET [AddressLine1] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.AddressLine1#">
			,[AddressLine2] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.AddressLine2#">
			,[City] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.City#">
			,[StateID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.StateID#">
			,[ZipCode] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.ZipCode#">
			,[DateLastUpdated] = getDate()
			,[UpdatedBy]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
		WHERE 
			PropertyID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.PropertyID#">	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Property  Name Updated Successfully')">
<cfset relocate (area = "Property", action = "PropertySelect")>