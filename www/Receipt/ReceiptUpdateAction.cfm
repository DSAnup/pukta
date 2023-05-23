

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
		<cfif trim(form.RECEIPTFILENAME) neq "">
			<cffile action="upload"
				destination="#request.imagesUploadPath#"
				nameconflict="overwrite"
				>
		</cfif>
	</cfif>

      <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  
        
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >

		
	UPDATE [dbo].[Receipt]
	SET [ReceiptTitle] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.ReceiptTitle#">
		,[TransactionID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.TransactionID#">
		<cfif trim(form.RECEIPTFILENAME) neq "">
			,[ReceiptFileName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#cffile.serverFile#">
		</cfif>
		,[Note] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.Note#">
 	WHERE 
 		ReceiptID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.ReceiptID#">	
	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Receipt Updated Successfully')">
<cfset relocate (area = "Receipt", action = "ReceiptSelect")>