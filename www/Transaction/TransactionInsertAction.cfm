
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
	INSERT INTO [dbo].[TransactionDetails]
       ([Payee]
	   ,[PropertyID]
	   ,[PropertySectionID]
	   ,[ExpenseTypeID]
	   ,[Amount]
	   ,[TransactionDate]
	   ,[Note]
	   ,[DateCreated]
	   ,[CreatedBy]
	   ,[DateLastUpdated]
	   ,[UpdatedBy])
 	VALUES
       (<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.Payee#">
	   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.PropertyID#">
	   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.PropertySectionID#">
	   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.ExpenseTypeID#">
	   ,<cfqueryparam cfsqltype="cf_sql_float" value="#form.Amount#">
	   ,<cfqueryparam cfsqltype="cf_sql_timestamp" value="#form.TransactionDate#">
	   ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.Note#">
	   ,getDate()
	   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
	   ,getDate()
	   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">)	
        
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Transaction  Added Successfully')">
<cfset relocate (area = "Transaction", action = "TransactionSelect")>