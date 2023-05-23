<cfsetting showdebugoutput="false" >

<cfinclude template="fusebox/header.cfm" >

<cfinclude template="#url.area#/#url.action#.cfm" > 


<cfif session.isDebugMode eq true>
	<iframe id="formpost" name="formpost" style="width:100%; height:800; display: block; margin-top:20px;"></iframe> 
<cfelse>
	<iframe id="formpost" name="formpost" style="width:1px; height:1px; display: none; margin-top:0px;"></iframe> 	
</cfif>

                  
                        
 <cfinclude template="fusebox/footer.cfm" >
 

