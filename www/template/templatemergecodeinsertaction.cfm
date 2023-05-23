

<cfloop list="#form.strictcode#" index="code">
	
	<cfquery datasource="#request.dsname#" name="q">
		update TemplateMergeCode
			set StrictCode = '#listLast(code, '|')#'
				where TemplateMergeCodeID = #val( listFirst(code, "|") )#
	</cfquery>
	
</cfloop>

<cflocation url="/index.cfm?area=template&action=templateselect" >