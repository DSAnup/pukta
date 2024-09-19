
<cfset errorMessage = "">

<!--- make sure all required inputs are provided --->
<cfif trim(form.PropertyID) eq "">
    <cfset errorMessage = errorMessage & "Property  must be provided.<br>">	
</cfif>
<cfif trim(form.DocumentTypeID) eq "">
    <cfset errorMessage = errorMessage & "Document Type  must be provided.<br>">	
</cfif>
<cfif trim(form.DocumentFileName) eq "">
    <cfset errorMessage = errorMessage & "Choose an file  must be provided.<br>">
<cfelse>
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
INSERT INTO [dbo].[Document]
	([PropertyID]
	,[DocumentTypeID]
	,[DocumentFileName]
	,[DocumentDescription]
	,[DocumentNote]
	,[DateCreated]
	,[CreatedBy]
	,[DateLastUpdated]
	,[UpdatedBy])
 VALUES
	(<cfqueryparam cfsqltype="cf_sql_integer" value="#form.PropertyID#">
	,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.DocumentTypeID#">
	,<cfqueryparam cfsqltype="cf_sql_varchar" value="#cffile.serverFile#">
   	<cfif trim(form.DocumentDescription) neq "">
   		,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.DocumentDescription#">
   	<cfelse>
		, null
	</cfif>
	,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.DocumentNote#">
	,getDate()
	,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
	,getDate()
	,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">)	     
</cfquery>

    
<cfset session.OnLoadMessage = "success('Document Added Successfully')">
<cfset relocate (area = "Document", action = "DocumentSelect")>