
	<cfset errorMessage = "">


  <!--- make sure all required inputs are provided --->
    <cfif trim(form.currentpassword) eq "">
        <cfset errorMessage = errorMessage & "Current password must be provided.<br>">
		  
    </cfif>
	
	<!-- old password -->
	<cfquery datasource="#request.dsnameReader#" name="qUserSelect"> 
	select PasswordHash
	from Appuser where AppuserID = #session.profile.AppuserID#      
	  
	</cfquery>
	
	<cfoutput>
		<cfset oldPass="#qUserSelect.PasswordHash#">
	</cfoutput> 
	
	  <!--- old password must match --->
	<cfif trim(form.currentpassword) neq oldPass>
		<cfset errorMessage = errorMessage & "Old password doesnt match.<br>">  
	</cfif>
	
	
    <cfif trim(form.PasswordHash) eq "">
        <cfset errorMessage = errorMessage & "New Password must be provided.<br>">  
    </cfif>
    
    <cfif trim(form.repassword) eq "">
        <cfset errorMessage = errorMessage & "New Password must be re-typed.<br>">  
    </cfif>
    
    <!--- password and re type password must match --->
    <cfif trim(form.repassword) neq trim(form.PasswordHash)>
        <cfset errorMessage = errorMessage & "Password and re-typed password must match.<br>">  
    </cfif>
    
	   

    <cfif errorMessage gt "">
		<cfset showErrorMessage (Message = errorMessage)>	
		<cfabort>
	</cfif>
    
    
        
        
    <!--- if a fail attempt, log the attempt, increment longin attempt and lock out if reached max try --->
    <cfquery datasource="#request.dsnameWriter#" >
        

		UPDATE [dbo].[AppUser]
		   SET
		   	[PasswordHash]  = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.PasswordHash#">
		 WHERE 
		 
		 	AppuserID = #session.profile.AppuserID#
        
    </cfquery>

      
<cfset session.OnLoadMessage = "success('Updated Successfully...')">    
<cfset relocate (area = "appuser", action = "updatePassword")>
     
     
     
    
    
