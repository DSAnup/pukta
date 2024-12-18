

	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.DocumentTypeName) eq "">
		<cfset errorMessage = errorMessage & "Document Type Name must be provided.<br>">	
	</cfif>

    <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>
        
    <cfquery datasource="#request.dsnameWriter#" >
		UPDATE [dbo].[DocumentType]
		SET [DocumentTypeName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.DocumentTypeName#">
			,[DateLastUpdated] = getDate()
			,[UpdatedBy]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
		WHERE 
			DocumentTypeID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.DocumentTypeID#">
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Document Type Name Updated Successfully')">
<cfset relocate (area = "DocumentType", action = "DocumentTypeSelect")>