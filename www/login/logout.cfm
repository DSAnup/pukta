

<cfset session.Profile = structNew()>
<cfset session.Profile.isLoggedIn = false>

 <cfcookie name = "appUserID" value = "" expires = "01/01/2020">

<cflocation url="/?area=login&action=login" addtoken="false" >