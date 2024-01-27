
	<cfset errorMessage = "">

	<!--- make sure all required inputs are provided --->
	<cfif trim(form.StateCode) eq "">
		<cfset errorMessage = errorMessage & "State Code must be provided.<br>">	
	</cfif>
	<cfif trim(form.StateName) eq "">
		<cfset errorMessage = errorMessage & "State Name must be provided.<br>">	
	</cfif>

      <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  

	
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >
	INSERT INTO [dbo].[State]
       ([StateCode]
	   ,[StateName]
	   ,[DateCreated]
	   ,[CreatedBy]
	   ,[DateLastUpdated]
	   ,[UpdatedBy])
 	VALUES
       (<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.StateCode#">
	   ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.StateName#">
	   ,getDate()
	   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
	   ,getDate()
	   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">)	
        
		
	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('State Name Added Successfully')">
<cfset relocate (area = "WebTop", action = "UsStateSelect")>