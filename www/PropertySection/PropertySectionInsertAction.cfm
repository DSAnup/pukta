
	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.PropertySectionName) eq "">
		<cfset errorMessage = errorMessage & "Property Section must be provided.<br>">	
	</cfif>
	<cfif trim(form.PropertyPhaseID) eq "">
		<cfset errorMessage = errorMessage & "Property Phase  must be provided.<br>">	
	</cfif>

      <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  

	
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >
		INSERT INTO [dbo].[PropertySection]
			([PropertySectionName]
			,[PropertyPhaseID]
			,[DateCreated]
			,[CreatedBy]
			,[DateLastUpdated]
			,[UpdatedBy])
		VALUES
			(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.PropertySectionName#">
			,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.PropertyPhaseID#">
			,getDate()
			,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
			,getDate()
			,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">)
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Property Section Added Successfully')">
<cfset relocate (area = "PropertySection", action = "PropertySectionSelect")>