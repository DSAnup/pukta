

	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.PropertySectionName) eq "">
		<cfset errorMessage = errorMessage & "Expense Type Name must be provided.<br>">	
	</cfif>

      <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  
    
        
        
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >

		
	UPDATE [dbo].[PropertySection]
	SET [PropertySectionName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.PropertySectionName#">
		,[DateLastUpdated] = getDate()
		,[UpdatedBy]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
 	WHERE 
 		PropertySectionID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.PropertySectionID#">	
	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Property Section Name Updated Successfully')">
<cfset relocate (area = "PropertySection", action = "PropertySectionSelect")>