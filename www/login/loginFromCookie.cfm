
<!--- lets get the users that matches the email/password --->
<cfquery datasource="#request.dsnameReader#" name="qUserSelect">	
	select *
		from Appuser		
		where AppUserID = <cfqueryparam cfsqltype="cf_sql_integer" value="#cookie.appUserID#">	
</cfquery>


<!--- set the session level profile --->
<cfset session.Profile.IsLoggedIn = true>
 <cfloop list="#qUserSelect.columnList#" index="col">
 	<cfset session.Profile[col] = qUserSelect[col]>
 </cfloop>
 
<cflocation url="index.cfm?area=dashboard&action=index" addtoken="false" >




