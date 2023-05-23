<cfset errorMessage = "">

<!--- make sure all required inputs are provided --->
<cfif trim(form.Email) eq "">
	<cfset errorMessage = errorMessage & "A valid email must be provided.<br>">	
</cfif>

<cfif errorMessage gt "">
	<cfset showErrorMessage (Message = errorMessage)>	
	<cfabort>
</cfif>

<!--- lets get the users that matches the email/password --->
<cfquery datasource="#request.dsnameReader#" name="qUserSelect">	
	select *
		from Appuser		
		where Email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.email#">	
</cfquery>

<!--- check to see if the user exists --->
<cfif qUserSelect.RecordCount eq 0>
	<cfset showErrorMessage (Message = "User does not exist with the details your provided.  Please try again.")>				
</cfif>
 

<!--- set the session level profile --->
<cfset session.Profile.IsLoggedIn = true>
 <cfloop list="#qUserSelect.columnList#" index="col">
 	<cfset session.Profile[col] = qUserSelect[col]>
 </cfloop>
 



<!---<cfset relocate (area = "appuser", action = "showAllUser")>--->