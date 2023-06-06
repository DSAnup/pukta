
<cfset errorMessage = "">

<!--- make sure all required inputs are provided --->
<cfif trim(form.ReceiptTitle) eq "">
    <cfset errorMessage = errorMessage & "Receipt Title  must be provided.<br>">	
</cfif>
<cfif trim(form.TransactionID) eq "">
    <cfset errorMessage = errorMessage & "Transaction  must be provided.<br>">	
</cfif>
<cfif trim(form.RECEIPTFILENAME) eq "">
    <cfset errorMessage = errorMessage & "Choose an file  must be provided.<br>">
<cfelse>
    <cfset ReceiptPath = "#request.imagesUploadPath#\Receipt">

    <cfif not directoryExists(ReceiptPath)>
        <cfdirectory action="create" directory="#ReceiptPath#">
    </cfif>

    <cfif isDefined("form.RECEIPTFILENAME")>
        <cffile action="upload"
            destination="#ReceiptPath#"
            nameconflict="makeunique"
            >
    </cfif>
</cfif>

<cfif errorMessage gt "">	
    <cfset showErrorMessage (Message = errorMessage)>
    <cfset session.OnLoadMessage = "error('#errorMessage#')">
    <cflocation	url="index.cfm?area=Transaction&action=TransactionSelect" addToken="no">
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
<cflocation	url="index.cfm?area=Transaction&action=TransactionSelect" addToken="no">