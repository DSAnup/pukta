<cfcomponent>
	
	<cfset this.name = "Pukta">
	<cfset this.sessionmanagement="Yes">
	<cfset this.sessiontimeout="#CreateTimeSpan(0, 0, 60, 0)#" >
	<cfset this.clientmanagement="no">
	<cfset this.setclientcookies="Yes" >
	
	
	<cffunction name="onSessionStart" returnType="void">
		<cfset session.Profile = structNew()>
		<cfset session.Profile.isLoggedIn = false>
		<cfset session.isDebugMode = true>
		
		<!--- default area / action --->
		<cfparam name="url.area" default="login" >
		<cfparam name="url.action" default="login" >
		
		<!--- send to login page --->
		<cfif session.profile.isLoggedIn eq false AND url.area neq "login">			
			<cflocation url="/?area=login&action=login" addtoken="false" >			
		</cfif>
		
	</cffunction>
	

	<cffunction name="onApplicationStart" returnType="boolean">

		<cfreturn true>
	</cffunction>
	

	<!---implement this method to handle any request start needs, 
	do not use OnRequest as it is used by the Fraworm to navigete trafic --->
	<cffunction name="OnRequestStart" returntype="boolean" >
		<cfargument type="String" name="targetPage" required=true/>
		
		
		<cfset request.dsnameReader = "PuktaReader">
		<cfset request.dsnameWriter = "PuktaWriter">
		<cfset request.imagesUploadPath = "C:\Site\admin.pukta.us\www\assets\uploads">
		<cfset request.publicSiteDomain = "http://localhost:8086">
		<!--- <cfset request.imagesUploadPath = "C:\Sites\admin.pukta.us\www\assets\uploads"> --->
		<!--- <cfset request.publicSiteDomain = "http://Admin.Pukta.us"> --->

		<!---<cfset request.dsnameWriter = "timetrackerWriter">--->
		<cfset application.SystemUserID = 1>
		<!--- default area / action --->
		<cfparam name="url.area" default="login" >
		<cfparam name="url.action" default="login" >
		
		<!--- week counter start date --->
		<cfset request.weekCounterStartDate = '2000-01-03'>
		
		<!--- During development, starting the app anyway, comment our for production  --->
		<cfset onApplicationStart()> 
		
		<!---include the user defined functions --->		
		<cfinclude template="fusebox/udf.cfm" >	
		<cfreturn true>
	</cffunction>
	
</cfcomponent>


