

	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.PropertyPhaseName) eq "">
		<cfset errorMessage = errorMessage & "Property Phase Name must be provided.<br>">	
	</cfif>

      <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  
    
        
        
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >
		UPDATE [dbo].[PropertyPhase]
		SET [PropertyPhaseName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.PropertyPhaseName#">
			,[DateLastUpdated] = getDate()
			,[UpdatedBy]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
		WHERE 
			PropertyPhaseID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.PropertyPhaseID#">	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Property Phase Name Updated Successfully')">
<cfset relocate (area = "PropertyPhase", action = "PropertyPhaseSelect")>