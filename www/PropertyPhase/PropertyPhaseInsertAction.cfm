
	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.PropertyPhaseName) eq "">
		<cfset errorMessage = errorMessage & "Property Phase must be provided.<br>">	
	</cfif>

      <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  

	
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >
		INSERT INTO [dbo].[PropertyPhase]
			([PropertyPhaseName]
			,[DateCreated]
			,[CreatedBy]
			,[DateLastUpdated]
			,[UpdatedBy])
		VALUES
			(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.PropertyPhaseName#">
			,getDate()
			,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
			,getDate()
			,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">)	
    </cfquery>    
        
<cfset session.OnLoadMessage = "success('Property Phase Added Successfully')">
<cfset relocate (area = "PropertyPhase", action = "PropertyPhaseSelect")>