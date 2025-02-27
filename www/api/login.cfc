<cfcomponent output="false">
    
    <cfset this.name = "LoginAPI">
    
    <cffunction name="authenticate" access="remote" returnformat="json" returntype="any" httpmethod="POST">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">

        <cfset var response = { "status": "error", "message": "Invalid login" }>

        <cfquery datasource="#request.dsnameReader#" name="qUserSelect">    
            SELECT * FROM Appuser        
            WHERE Email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">  
              AND PasswordHash = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.password#">
        </cfquery>

        <cfif qUserSelect.recordCount GT 0>
            <cfset session.Profile.IsLoggedIn = true>

            <cfloop list="#qUserSelect.columnList#" index="col">
                <cfset session.Profile[col] = qUserSelect[col]>
            </cfloop>

            <cfset response.status = "success">
            <cfset response.message = "Login successful">
            <cfset response.userData = session.Profile>
        </cfif>

        <cfreturn response>
    </cffunction>

    <cffunction name="getPropertiesByUserID" access="remote" returnformat="json" returntype="any" httpmethod="GET">
        <cfargument name="AppUserID" type="numeric" required="true">

        <cfset var response = { "status": "error", "message": "No properties found", "data": [] }>

        <!--- Fetch user details to get PropertyID & Access Level --->
        <cfquery datasource="#request.dsnameReader#" name="qUserSelect">    
            SELECT AppUserAccessLevelID, PropertyID
            FROM Appuser        
            WHERE AppUserID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.AppUserID#">
        </cfquery>

        <cfif qUserSelect.recordCount GT 0>
            <cfset var propertyData = []>

            <!--- Fetch property data based on user's access level --->
            <cfquery datasource="#request.dsnameReader#" name="qPropertySelect"> 
                SELECT P.*, S.stateName
                FROM  Property  AS P
                    LEFT JOIN State AS S ON P.StateID = S.StateID
                WHERE 1=1
                <cfif qUserSelect.AppUserAccessLevelID eq 3 or qUserSelect.PropertyID neq "">
                    AND P.PropertyID IN (#qUserSelect.PropertyID#)
                </cfif>      
            </cfquery>

            <!--- Convert query results to array --->
            <cfloop query="qPropertySelect">
                <cfset property = { 
                                    "PropertyID" = qPropertySelect.PropertyID, 
                                    "AddressLine1" = qPropertySelect.AddressLine1, 
                                    "City" = qPropertySelect.City, 
                                    "stateName" = qPropertySelect.stateName, 
                                    "ZipCode" = qPropertySelect.ZipCode  
                                }>
                <cfset ArrayAppend(propertyData, property)>
            </cfloop>

            <cfset response.status = "success">
            <cfset response.message = "Properties retrieved successfully">
            <cfset response.data = propertyData>
        </cfif>

        <cfreturn response>
    </cffunction>


</cfcomponent>

<!--- 
    https://admin.pukta.us/api/login.cfc?method=authenticate&email=anup12.m@gmail.com&password=123456 
    https://admin.pukta.us/api/login.cfc?method=getPropertiesByUserID&AppUserID=7

--->
