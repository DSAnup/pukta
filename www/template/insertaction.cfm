

<!--- upload the file --->
<cfif isdefined("form.templateFileName") and  form.templateFileName gt "">
	<cffile action="upload" 
			destination="#request.filePath.templatePath#" 
			fileField ="templateFileName" 
			nameconflict="makeunique"  >
	<cfset form.currenttemlatefilename = cffile.serverFile>
</cfif>


<!---update record --->
<cfif form.templateid gt 0>
	
	
	<cfquery datasource="#request.dsname#" name="qTemplateUpdate">
		Update
			Template
			Set 
			Document_Name = '#form.Document_Name#',
			TemplateName = '#form.Document_Name#',
			Document_Number = '#form.Document_Number#',
			SortOrder = '#val(form.SortOrder)#',
			Doctype = '#val(form.SCANNEDTYPE)#',
			
			
			CategoryIDFK = #val(listFirst(form.CategoryID))#,
			Doc_Access = '#form.Doc_Access#',
			Display_Column = '#form.Display_Column#',
			Debtor_1_Only = #form.Debtor_1_Only#,
			AutoTaskID = #form.AutoTaskID#,
			Category_Department = '#listLast(form.CategoryID)#',
			TemplateFileName = '#form.currenttemlatefilename#',
			
			<cfif form.DocArea eq "Collections">
			Collections = 1,
			<cfelse>
			Collections = 0,
			</cfif>
			<cfif form.DocArea eq "Litigation">
			Litigation = 1,
			<cfelse>
			Litigation = 0,
			</cfif>	
			<cfif form.DocArea eq "Bankruptcy">
			Bankruptcy = 1,
			<cfelse>
			Bankruptcy = 0,
			</cfif>	
			<cfif form.DocArea eq "Envelope">
			Envelope = 1,
			<cfelse>
			Envelope = 0,
			</cfif>	
			<cfif form.DocArea eq "Fax">
			Fax = 1,
			<cfelse>
			Fax = 0,
			</cfif>	
			<cfif form.DocArea eq "Other">
			Other = 1,
			<cfelse>
			Other = 0,
			</cfif>	
			<cfif isDefined("Form.LedgerNeeded")>
			LedgerNeeded = 1,
			<cfelse>
			LedgerNeeded = 0,
			</cfif>
			<cfif isDefined("Form.PartyListNeeded")>
			PartyListNeeded = 1,
			<cfelse>
			PartyListNeeded = 0,
			</cfif>
			<cfif isDefined("Form.SelectedDefendantNeeded")>
			SelectedDefendantNeeded = 1
			<cfelse>
			SelectedDefendantNeeded = 0
			</cfif>	
			Where TemplateID = #form.templateID#
	</cfquery>
	
	
	
</cfif>


<!--- insert record --->
<cfif val(form.templateid) lt 1>
	
	<!---save the uploaded file and get the name to be saved... --->
	
	
	<cfquery datasource="#request.dsname#" name="qTemplateInsert">
		Insert Into Template
		(
			TemplateName,
			Document_Name,
			Document_Number,
			Collections,
			Litigation,
			Bankruptcy,
			Envelope,
			Fax,
			Other,
			SortOrder,
			AutoTaskID,
			Debtor_1_Only,
			Deleted,
			LedgerNeeded,
			PartyListNeeded,
			SelectedDefendantNeeded,
			TemplateFileName,
			Doc_Access,
			Display_Column,
			DocType,
			CategoryIDFK,
			Category_Department
			
		)
		Values
		(
			'#form.Document_Name#',
			'#form.Document_Name#',
			'#form.Document_Number#',
			<cfif form.DocArea eq "Collections">
			1,
			<cfelse>
			0,
			</cfif>
			<cfif form.DocArea eq "Litigation">
			1,
			<cfelse>
			0,
			</cfif>
			<cfif form.DocArea eq "Bankruptcy">
			1,
			<cfelse>
			0,
			</cfif>
			<cfif form.DocArea eq "Envelope">
			1,
			<cfelse>
			0,
			</cfif>
			<cfif form.DocArea eq "Fax">
			1,
			<cfelse>
			0,
			</cfif>		
			<cfif form.DocArea eq "Other">
			1,
			<cfelse>
			0,
			</cfif>
			#val(form.SortOrder)#,
			#val(form.AutoTaskID)#,
			#form.Debtor_1_Only#,
			0,
			<cfif isDefined("Form.LedgerNeeded")>
			1,
			<cfelse>
			0,
			</cfif>
			<cfif isDefined("Form.PartyListNeeded")>
			1,
			<cfelse>
			0,
			</cfif>
			<cfif isDefined("Form.SelectedDefendantNeeded")>
			1
			<cfelse>
			0
			</cfif>
			
			,'#form.currenttemlatefilename#'
			,'#form.Doc_Access#'
			,'#form.Display_Column#'			
			,'#form.SCANNEDTYPE#'
			,'#val(listFirst(form.CategoryID))#'
			,'#listLast(form.CategoryID)#'
			
			
			)
			
			select @@identity 'templateid'
	</cfquery>
	
	<cfset form.templateid = qTemplateInsert.templateid>
	
	
	
</cfif>

<!--- if new file was uploaded, extract the meta from the file --->
<cfif form.TemplateFileName gt "">
	<cflocation url="/index.cfm?area=template&action=templatemergecodeinsert&templateid=#form.templateid#&newread=true" addtoken="false" >	
<cfelse>
	<cflocation url="/index.cfm?area=template&action=templateselect" addtoken="false" >	
</cfif>


