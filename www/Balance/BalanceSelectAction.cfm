
<cfset session.PropertyID = form.PropertyID>


<cfquery datasource="#request.dsnameReader#" name="qBalanceReport"> 
    SELECT 
        T.PropertyID,
        CONCAT(P.AddressLine1,' - ', P.City ,' - ', P.ZipCode) AS Property,
        ROUND(SUM(CASE WHEN T.Amount >= 0 THEN T.Amount ELSE 0 END), 2) AS TotalSpend,
        ROUND(SUM(CASE WHEN T.Amount < 0 THEN T.Amount ELSE 0 END), 2) AS TotalDeposit,
        ROUND(SUM(T.Amount), 2) AS Balance
    FROM TransactionDetails AS T 
        LEFT JOIN Property AS P ON T.PropertyID = P.PropertyID
    WHERE 1=1
        <cfif session.Profile.AppUserAccessLevelID eq 3 or session.Profile.PropertyID neq "">
            AND T.PropertyID IN (#session.Profile.PropertyID#)
        </cfif>
        <cfif trim(form.PropertyID) neq "">
            AND T.PropertyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.PropertyID#">
        </cfif>

        <cfif trim(form.dateFrom) neq "" and trim(form.dateTo) neq "">
            AND T.TransactionDate BETWEEN 
                    <cfqueryparam cfsqltype="cf_sql_timestamp" value="#form.dateFrom# 00:00:00">
                AND <cfqueryparam cfsqltype="cf_sql_timestamp" value="#form.dateTo# 23:59:59">
        </cfif>
    GROUP BY T.PropertyID, P.AddressLine1, P.City, P.ZipCode
    ORDER BY T.PropertyID
</cfquery>



<cfoutput>
	<div id="searchResult">
        <div class="row">
            <div class="col-12">
                <cfoutput>
                    <div class="container table-responsive">
                        <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th> Property</th>
                                    <th> Total Deposit</th>                                  
                                    <th> Total Spend </th>
                                    <th> Pukta Balance </th>
                                </tr>
                            </thead>
                
                            <tbody>
                            <cfset index = 0>
                            <cfset grandTotalBalance = 0>
                            <cfset grandTotalDeposit = 0>
                            <cfset grandTotalSpend = 0>
                            <cfloop query="qBalanceReport">
                                <cfset index = index + 1>
                                <tr>
                                    <td>
                                        #index#
                                    </td>
                                    
                                    <td>
                                        #qBalanceReport.Property#
                                    </td>
                                    <td>
                                        #dollarFormat(qBalanceReport.TotalDeposit)#
                                        <cfset grandTotalDeposit = grandTotalDeposit + qBalanceReport.TotalDeposit>
                                    </td>
                                    <td>
                                        #dollarFormat(qBalanceReport.TotalSpend)#
                                        <cfset grandTotalSpend = grandTotalSpend + qBalanceReport.TotalSpend>
                                    </td>
                                    <td>
                                        #dollarFormat(qBalanceReport.Balance)#
                                        <cfset grandTotalBalance = grandTotalBalance + qBalanceReport.Balance>
                                    </td>
                                </tr>
                            </cfloop>

                            
                            
                            </tbody>
                            <th>
                                
                                <td>Total</td>
                                <td>#dollarFormat(grandTotalDeposit)#</td>
                                <td>#dollarFormat(grandTotalSpend)#</td>
                                <td>#dollarFormat(grandTotalBalance)#</td>
                                <td></td>
                                
                                <td></td>

                            </th>
                        </table>
                    </div>		
                </cfoutput>

           </div>
        </div>
    </div>
</cfoutput>

<script lang="javascript">  
    window.parent.document.getElementById('alert').innerHTML  = '' ;
    window.parent.document.getElementById('searchResultContainer').innerHTML  = document.getElementById('searchResult').innerHTML ;  	
    window.parent.loadTable();  
    document.getElementById('searchResult').innerHTML  = ''; 
    
    var grandTotalPrice = '<cfoutput>#grandTotalBalance#</cfoutput>';
 

    
    
</script>


