

	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.Payee) eq "">
		<cfset errorMessage = errorMessage & "Payee  must be provided.<br>">	
	</cfif>
	<cfif trim(form.PropertyID) eq "">
		<cfset errorMessage = errorMessage & "Property  must be provided.<br>">	
	</cfif>
	<cfif trim(form.PropertySectionID) eq "">
		<cfset errorMessage = errorMessage & "Property Section  must be provided.<br>">	
	</cfif>
	<cfif trim(form.ExpenseTypeID) eq "">
		<cfset errorMessage = errorMessage & "Expense Type  must be provided.<br>">	
	</cfif>
	<cfif trim(form.Amount) eq "">
		<cfset errorMessage = errorMessage & "Amount  must be provided.<br>">	
	</cfif>
	<cfif trim(form.TransactionDate) eq "">
		<cfset errorMessage = errorMessage & "TransactionDate must be provided.<br>">	
	</cfif>

      <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  
    
        
        
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >

		
	UPDATE [dbo].[TransactionDetails]
	SET [Payee] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.Payee#">
		,[PropertyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.PropertyID#">
		,[PropertySectionID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.PropertySectionID#">
		,[ExpenseTypeID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.ExpenseTypeID#">
		,[Amount] = <cfqueryparam cfsqltype="cf_sql_float" value="#form.Amount#">
		,[TransactionDate] = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#form.TransactionDate#">
		,[Note] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.Note#">
		,[DateLastUpdated] = getDate()
		,[UpdatedBy]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
 	WHERE 
	 	TransactionID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.TransactionID#">	
	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Transaction  Updated Successfully')">
<cfset relocate (area = "Transaction", action = "TransactionSelect")>