	
	<cfset errorMessage = "">
	
	<!--- make sure all required inputs are provided --->
	<cfif trim(form.FirstName) eq "">
		<cfset errorMessage = errorMessage & "Fastname must be provided.<br>">	
	</cfif>
	<cfif trim(form.LastName) eq "">
		<cfset errorMessage = errorMessage & "Lastname must be provided.<br>">	
	</cfif>
	<cfif trim(form.Email) eq "">
		<cfset errorMessage = errorMessage & "A valid email must be provided.<br>">	
	</cfif>
	
	<cfif trim(form.Password) eq "">
		<cfset errorMessage = errorMessage & "Password must be provided.<br>">	
	</cfif>


	   
    <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>
    
    
        

    <cfquery datasource="#request.dsnameWriter#" >
        
		   
		UPDATE [dbo].[AppUser]
		   SET [FirstName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.FirstName#">
			  ,[LastName] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.LastName#">
			  ,[Email] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.Email#">
			  ,[isAdministrator] = 0
			  ,[isActive] = 0
		 WHERE 
			AppUserID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.AppUserID#">	   
        
    </cfquery>

      
<cfset session.OnLoadMessage = "success('User Successfully Updated...')">    
<cfset relocate (area = "appuser", action = "showAllUser")>
     
     
     
    
    

		   
