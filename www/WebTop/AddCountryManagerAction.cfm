

	<cfset errorMessage = "">
	
	<!--- make sure all required inputs are provided --->
	<cfif trim(form.ISO2) eq "">
		<cfset errorMessage = errorMessage & "ISO2 must be provided.<br>">	
	</cfif>
	<cfif trim(form.CountryName) eq "">
		<cfset errorMessage = errorMessage & "Country name must be provided.<br>">	
	</cfif>
	<cfif trim(form.LongCountryName) eq "">
		<cfset errorMessage = errorMessage & "Long country name must be provided.<br>">	
	</cfif>
	<cfif trim(form.ISO3) eq "">
		<cfset errorMessage = errorMessage & "ISO3 must be provided.<br>">	
	</cfif>
	<cfif trim(form.NumCode) eq "">
		<cfset errorMessage = errorMessage & "NumCode must be provided.<br>">	
	</cfif>
	<cfif trim(form.UNMemberState) eq "">
		<cfset errorMessage = errorMessage & "UN member state name must be provided.<br>">	
	</cfif>
	<cfif trim(form.CallingCode) eq "">
		<cfset errorMessage = errorMessage & "Calling code must be provided.<br>">	
	</cfif>
	<cfif trim(form.CCTLD) eq "">
		<cfset errorMessage = errorMessage & "CCTLD must be provided.<br>">	
	</cfif>
	<cfif trim(form.InternationalRegion) eq "">
		<cfset errorMessage = errorMessage & "International region must be provided.<br>">	
	</cfif>

      <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>  


        
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >
	
		INSERT INTO [dbo].[Country]
           ([ISO2]
           ,[CountryName]
           ,[LongCountryName]
           ,[ISO3]
           ,[NumCode]
           ,[UNMemberState]
           ,[CallingCode]
           ,[CCTLD]
           ,[InternationalRegion]
           ,[DateCreated]
           ,[CreatedBy]
           ,[DateLastUpdated]
           ,[UpdatedBy])
		VALUES
		   (<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.ISO2#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.CountryName#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.LongCountryName#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.ISO3#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.NumCode#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.UNMemberState#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.CallingCode#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.CCTLD#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.InternationalRegion#">
		   ,getDate()
		   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
		   ,getDate()
		   ,<cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">)	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Country Details Updated Successfully')">
<cfset relocate (area = "WebTop", action = "CountryManager")>