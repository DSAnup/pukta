

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

		
	UPDATE [dbo].[Country]
	SET [ISO2] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.ISO2#">
		,[CountryName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.CountryName#">
		,[LongCountryName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.LongCountryName#">
		,[ISO3] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.ISO3#">
		,[NumCode] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.NumCode#">
		,[UNMemberState] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.UNMemberState#">
		,[CallingCode] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.CallingCode#">
		,[CCTLD] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.CCTLD#">
		,[InternationalRegion] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.InternationalRegion#">
		,[DateCreated] = getDate()
		,[CreatedBy] = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
		,[DateLastUpdated] = getDate()
		,[UpdatedBy]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#application.SystemUserID#">
 WHERE 
 		CountryID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.CountryID#">	
	
    </cfquery>
    
        
<cfset session.OnLoadMessage = "success('Country Details Updated Successfully')">
<cfset relocate (area = "WebTop", action = "CountryManager")>