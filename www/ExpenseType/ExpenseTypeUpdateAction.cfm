

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

		
	UPDATE [dbo].[ExpenseType]
	SET [ExpenseTypeName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.ExpenseTypeName#">
		,[DateLastUpdated] = getDate()
		,[UpdatedBy]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
 	WHERE 
 		ExpenseTypeID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.ExpenseTypeID#">	
	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Expense Type Name Updated Successfully')">
<cfset relocate (area = "ExpenseType", action = "ExpenseTypeSelect")>