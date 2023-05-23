

<!---<cfhttp url="http://prod.tmstlg.com/api/document/GetBarCode?filePath=D:\Document\Inbox\2020_04_27_10_07_27.pdf" method="get" timeout="15" throwonerror="true" >
</cfhttp>--->

<!---<cfdump var="#cfhttp#" >--->

<cfabort>



<cfdump var="#session.mergedata#" >



<cfoutput>
	

	
<cfsavecontent variable="data" >{

"baRCode":"#session.mergedata.barCode#",

"baseTemplateFileName"    :     "#replaceNoCase(session.mergeData.baseTemplateFileName, "\", "\\", "ALL")#",

"mergedFileName"    :     "#replaceNoCase(session.mergeData.mergedFileName, "\", "\\", "ALL")#",

"clientDataList" : [
<cfset counter = 1>
<cfloop  array="#session.mergeData.ClientDataList#"  item="item" >

{  "value":"#item.value#", "key":"#item.key#" }  <cfif counter lt arrayLen(session.mergeData.ClientDataList)>,</cfif>
<cfset counter = counter + 1>
</cfloop>
],


"tableDataList" : [

{ "key":"<<ownerName>>", "value":"pete 5r", "rowCount":4, "columnCount":7 },

{ "key":"<<ownerName>>", "value":"jones 5r", "rowCount":9, "columnCount":4 }



]


}</cfsavecontent>




		
	<textarea cols="80" rows="10">#data#</textarea>
	
</cfoutput>


<cfhttp url="http://dev.tmstlg/api/document/Merge" method="post" timeout="60" throwonerror="true" >
				<cfhttpparam type="header" name="Content-Type" value="application/json" />
			    <cfhttpparam type="body" value="#serializeJSON(session.mergeData)#">
			</cfhttp>
			
			<cfdump var="#cfhttp#" >

