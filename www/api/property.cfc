<cfcomponent output="false">
    
    <cfset this.name = "PropertyAPI">

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

    <cffunction name="getPropertyTransactions" access="remote" returnformat="json" returntype="any" httpmethod="GET">
        <cfargument name="PropertyID" type="numeric" required="true">

        <cfset var response = { "status": "error", "message": "No Transactions found", "data": [] }>

        <cfset var transactionData = []>

        <!--- Fetch property data based on user's access level --->
        <cfquery datasource="#request.dsnameReader#" name="qPropertySelect"> 
            SELECT 
                T.TransactionID, 
                T.PropertyID, 
                CASE 
                    WHEN T.Amount < 0 
                    THEN '-$' + FORMAT(ABS(T.Amount), 'N2')  -- Handle negative amounts properly
                    ELSE '$' + FORMAT(T.Amount, 'N2') 
                END AS Amount,
                FORMAT(T.TransactionDate, 'MMMM, dd yyyy') AS TransactionDate, 
                T.Note, 
                T.Payee, 
                PS.PropertySectionName, 
                E.ExpenseTypeName
            
            FROM TransactionDetails AS T 
                LEFT JOIN Property AS P ON T.PropertyID = P.PropertyID
                LEFT JOIN PropertySection AS PS ON T.PropertySectionID = PS.PropertySectionID	 
                LEFT JOIN ExpenseType AS E ON T.ExpenseTypeID = E.ExpenseTypeID 
            WHERE 1=1
                AND T.PropertyID = #arguments.PropertyID# 
            ORDER BY T.TransactionDate DESC
        </cfquery>

        <!--- Convert query results to array --->
        <cfloop query="qPropertySelect">
            <cfset transactions = { 
                                "TransactionID" = qPropertySelect.TransactionID, 
                                "PropertyID" = qPropertySelect.PropertyID, 
                                "PropertyID" = qPropertySelect.PropertyID, 
                                "PropertySection" = qPropertySelect.PropertySectionName, 
                                "ExpenseType" = qPropertySelect.ExpenseTypeName, 
                                "Amount" = qPropertySelect.Amount, 
                                "TransactionDate" = qPropertySelect.TransactionDate,  
                                "Note" = qPropertySelect.Note,  
                                "Payee" = qPropertySelect.Payee
                            }>
            <cfset ArrayAppend(transactionData, transactions)>
        </cfloop>

        <cfset response.status = "success">
        <cfset response.message = "Transactions retrieved successfully">
        <cfset response.data = transactionData>

        <cfreturn response>
    </cffunction>

    <cffunction name="getTransactionReceipt" access="remote" returnformat="json" returntype="any" httpmethod="GET">
        <cfargument name="ReceiptID" type="numeric" required="true">

        <cfset var response = { "status": "error", "message": "No Receipt found", "data": [] }>

        <cfset var receiptData = []>

        <!--- Fetch property data based on user's access level --->
        <cfquery datasource="#request.dsnameReader#" name="qReceiptSelect"> 
            SELECT 
                R.ReceiptID,
                R.TransactionID,
                R.ReceiptFileName,
                R.ReceiptTitle,
                R.Note
            FROM Receipt AS R 
            WHERE 1=1
                AND R.ReceiptID = #arguments.ReceiptID# 
            ORDER BY R.ReceiptID DESC
        </cfquery>

        <!--- Convert query results to array --->
        <cfloop query="qReceiptSelect">
            <cfset receipts = { 
                                "TransactionID" = qReceiptSelect.TransactionID, 
                                "ReceiptID" = qReceiptSelect.ReceiptID, 
                                "ReceiptFileName" = qReceiptSelect.ReceiptFileName, 
                                "ReceiptTitle" = qReceiptSelect.ReceiptTitle,  
                                "Note" = qReceiptSelect.Note
                            }>
            <cfset ArrayAppend(receiptData, receipts)>
        </cfloop>

        <cfset response.status = "success">
        <cfset response.message = "Receipt retrieved successfully">
        <cfset response.data = receiptData>

        <cfreturn response>
    </cffunction>

    <cffunction name="getPropertyDocuments" access="remote" returnformat="json" returntype="any" httpmethod="GET">
        <cfargument name="PropertyID" type="numeric" required="true">

        <cfset var response = { "status": "error", "message": "No Documents found", "data": [] }>

        <cfset var receiptData = []>

        <!--- Fetch property data based on user's access level --->
        <cfquery datasource="#request.dsnameReader#" name="qDocumentsSelect"> 
            SELECT D.*, DT.DocumentTypeName
            FROM  Document AS D
                LEFT JOIN DocumentType AS DT ON DT.DocumentTypeID = D.DocumentTypeID
            WHERE 1=1
                AND D.PropertyID = #arguments.PropertyID# 
            ORDER BY D.DocumentID ASC
        </cfquery>

        <!--- Convert query results to array --->
        <cfloop query="qDocumentsSelect">
            <cfset receipts = { 
                                "DocumentID" = qDocumentsSelect.DocumentID, 
                                "PropertyID" = qDocumentsSelect.PropertyID, 
                                "DocumentTypeName" = qDocumentsSelect.DocumentTypeName, 
                                "DocumentFileName" = qDocumentsSelect.DocumentFileName,  
                                "DocumentDescription" = qDocumentsSelect.DocumentDescription,  
                                "DocumentNote" = qDocumentsSelect.DocumentNote
                            }>
            <cfset ArrayAppend(receiptData, receipts)>
        </cfloop>

        <cfset response.status = "success">
        <cfset response.message = "Documents retrieved successfully">
        <cfset response.data = receiptData>

        <cfreturn response>
    </cffunction>


</cfcomponent>

<!--- 
    https://admin.pukta.us/api/login.cfc?method=authenticate&email=anup12.m@gmail.com&password=123456 
    https://admin.pukta.us/api/login.cfc?method=getPropertiesByUserID&AppUserID=7

--->
