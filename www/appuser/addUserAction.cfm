	<cfdump var="#form#" />
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
	
	<cfif trim(form.PasswordHash) eq "">
		<cfset errorMessage = errorMessage & "Password must be provided.<br>">	
	</cfif>

	
	
	
   <!--- email must be unique --->
    <cfquery datasource="#request.dsnameReader#" name="qUserSelect">	
        select AppUserID
            from Appuser		
            where Email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.Email#">	
    </cfquery>
    
    <cfif qUserSelect.RecordCount gt 0>
        <cfset errorMessage = errorMessage & "Another user with this email already exists.  Please try to login.<br>">	
    </cfif>	
	   
    <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>
    
    
        
        
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameReader#" >
        

	INSERT INTO [dbo].[AppUser]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[PasswordHash]     
		   ,[DateCreated]
		   ,[CreatedBy]
		   ,[DateLastUpdated]
		   ,[UpdatedBy])
     VALUES
           (<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.FirstName#">
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.LastName#">
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.Email#">
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.PasswordHash#">
		   ,getDate()
		   ,#application.SystemUserID#
		   ,getDate()
		   ,#application.SystemUserID#)
        
    </cfquery>

      
<cfset session.OnLoadMessage = "success('User Successfully Added...')">    
<cfset relocate (area = "appuser", action = "showAllUser")>
     
     
     
    
    

		   
