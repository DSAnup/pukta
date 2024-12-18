
<cfset errorMessage = "">

<!--- make sure all required inputs are provided --->
<cfif trim(form.PropertyID) eq "">
    <cfset errorMessage = errorMessage & "Property  must be provided.<br>">	
</cfif>
<cfif trim(form.DocumentTypeID) eq "">
    <cfset errorMessage = errorMessage & "Document Type  must be provided.<br>">	
</cfif>
<cfif trim(form.DocumentFileName) neq "">
    <cfset DocumentPath = "#request.imagesUploadPath#\Documents">

    <cfif not directoryExists(DocumentPath)>
        <cfdirectory action="create" directory="#DocumentPath#">
    </cfif>

    <cfif isDefined("form.DocumentFileName")>
        <cffile action="upload"
            destination="#DocumentPath#"
            nameconflict="makeunique"
            >
    </cfif>
</cfif>

<cfif errorMessage gt "">	
    <cfset showErrorMessage (Message = errorMessage)>
    <cfset session.OnLoadMessage = "error('#errorMessage#')">
    <cfset relocate (area = "Document", action = "DocumentSelect")>
    <cfabort>
</cfif>  


<!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
<cfquery datasource="#request.dsnameWriter#" >
	UPDATE [dbo].[Document]
	SET [PropertyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.PropertyID#">
		,[DocumentTypeID]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.DocumentTypeID#">
		<cfif trim(form.DocumentFileName) neq "">
			,[DocumentFileName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#cffile.serverFile#">
		</cfif>
		<cfif trim(form.DocumentDescription) neq "">
			,[DocumentDescription] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.DocumentDescription#">
		</cfif>
		,[DocumentNote] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.DocumentNote#">
		,[DateLastUpdated] = getDate()
		,[UpdatedBy] = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">    
	WHERE 
		DocumentID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.DocumentID#"> 
</cfquery>

    
<cfset session.OnLoadMessage = "success('Document Update Successfully')">
<cfset relocate (area = "Document", action = "DocumentSelect")>