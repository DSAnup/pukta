
	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.ReceiptTitle) eq "">
		<cfset errorMessage = errorMessage & "Receipt Title  must be provided.<br>">	
	</cfif>
	<cfif trim(form.TransactionID) eq "">
		<cfset errorMessage = errorMessage & "Transaction  must be provided.<br>">	
	</cfif>
	<cfset local.fileNames = [] >
	<cfif isDefined("form.RECEIPTFILENAME")>
		<cffile action="upload"
			destination="#request.imagesUploadPath#"
			nameconflict="makeunique"
			>
	</cfif>

      <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  

	
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >
	INSERT INTO [dbo].[Receipt]
       ([ReceiptTitle]
	   ,[TransactionID]
	   ,[ReceiptFileName]
	   ,[Note]
	   ,[DateCreated]
	   ,[CreatedBy])
 	VALUES
       (<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.ReceiptTitle#">
	   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.TransactionID#">
	   ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#cffile.serverFile#">
	   ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.Note#">
	   ,getDate()
	   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">)	
        
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Receipt  Added Successfully')">
<cfset relocate (area = "Transaction", action = "TransactionSelect")>