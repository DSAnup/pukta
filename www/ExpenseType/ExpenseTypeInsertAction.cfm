
	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.ExpenseTypeName) eq "">
		<cfset errorMessage = errorMessage & "Expense Type Name must be provided.<br>">	
	</cfif>

    <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  
	
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >
		INSERT INTO [dbo].[ExpenseType]
			([ExpenseTypeName]
			,[DateCreated]
			,[CreatedBy]
			,[DateLastUpdated]
			,[UpdatedBy])
		VALUES
			(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.ExpenseTypeName#">
			,getDate()
			,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
			,getDate()
			,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">)	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Expense Type Name Added Successfully')">
<cfset relocate (area = "ExpenseType", action = "ExpenseTypeSelect")>