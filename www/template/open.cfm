
<cfheader name="Content-Disposition" value="inline; filename=#url.fileName#">
<cfcontent type="application/msword" file="#request.filePath.templatePath##url.filename#">