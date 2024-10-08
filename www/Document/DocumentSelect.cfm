  <cfquery datasource="#request.dsnameReader#" name="qDocumentSelect"> 
    SELECT D.*, DT.DocumentTypeName, CONCAT(AP.FirstName, ' ', AP.LastName) AS FullName,
		CONCAT(P.AddressLine1,' - ', P.City ,' - ', (SELECT stateName FROM State WHERE StateID = P.StateID) ,' - ', P.ZipCode) AS Property
    FROM  Document AS D
		LEFT JOIN DocumentType AS DT ON DT.DocumentTypeID = D.DocumentTypeID
		LEFT JOIN Property AS P ON P.PropertyID =  D.PropertyID  
		LEFT JOIN AppUser AS AP ON AP.AppUserID = D.CreatedBy
	ORDER BY D.PropertyID ASC
  </cfquery>
<style>
	.card {
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		border: none;
	}
	.card .three-dots {
		position: absolute;
		right: 10px;
		bottom: 10px;
		cursor: pointer;
	}
	.card-body {
		text-align: center; /* Center-aligns the title */
	}
</style>

<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<div class="page-title-right">
				<ol class="breadcrumb p-0 m-0" style="float:left">
					<li class="breadcrumb-item"><a href="index.cfm?area=dashboard&action=index">Home</a></li>
					<li class="breadcrumb-item active">Show All Document</li>
				</ol>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title floatleft">Show All Document</h3>
				<a href="index.cfm?area=Document&action=DocumentInsert" style="width: auto;" class="btn btn-success custom-btn floatright">Add Document</a>
			</div>
		</div>
	</div>
</div>
<div class="row row-cols-1 row-cols-md-4 g-4">
	<cfoutput>
		<cfloop query="qDocumentSelect" group="PropertyID">
			<div class="col">
				<div class="card position-relative">
					<div class="card-body">
						<h5 class="card-title">
							
							<a href="#request.publicSiteDomain#/assets/uploads/Documents/#qDocumentSelect.DocumentFileName#" target="_blank">
								<cfif listLast(qDocumentSelect.DocumentFileName, '.') eq 'jpg'  or listLast(qDocumentSelect.DocumentFileName, '.') eq 'png' or listLast(qDocumentSelect.DocumentFileName, '.') eq 'jpeg'>
									<i class="mdi mdi-file-image-outline mdi-48px"  data-toggle="tooltip" data-placement="right" title="#qDocumentSelect.DocumentTypeName#"></i>
								<cfelseif listLast(qDocumentSelect.DocumentFileName, '.') eq 'doc' or listLast(qDocumentSelect.DocumentFileName, '.') eq 'docx'>
									<i class="mdi mdi-file-document-box-outline mdi-48px"  data-toggle="tooltip" data-placement="right" title="#qDocumentSelect.DocumentTypeName#"></i>
								<cfelseif listLast(qDocumentSelect.DocumentFileName, '.') eq 'xls' or listLast(qDocumentSelect.DocumentFileName, '.') eq 'xlsx' or listLast(qDocumentSelect.DocumentFileName, '.') eq 'csv'>
									<i class="mdi mdi-file-excel-box-outline mdi-48px"  data-toggle="tooltip" data-placement="right" title="#qDocumentSelect.DocumentTypeName#"></i>
								<cfelse>
									<i class="mdi mdi-file-pdf-box-outline mdi-48px"  data-toggle="tooltip" data-placement="right" title="#qDocumentSelect.DocumentTypeName#"></i>
								</cfif>
							</a>
						</h5>
						<p class="card-text">#qDocumentSelect.DocumentFileName#</p>
						<cfset dateCreated = qDocumentSelect.DateCreated>
						<cfset dayFormat = DateFormat(dateCreated, "d")>
						<cfif dayFormat eq "1" or dayFormat eq "21" or dayFormat eq "31">
							<cfset suffix = "st">
						<cfelseif dayFormat eq "2" or dayFormat eq "22">
							<cfset suffix = "nd">
						<cfelseif dayFormat eq "3" or dayFormat eq "23">
							<cfset suffix = "rd">
						<cfelse>
							<cfset suffix = "th">
						</cfif>

						<p class="card-text">
							<small class="text-muted">Shared By #qDocumentSelect.FullName#</small> <br>
							<small class="text-muted">Sent #dateformat(qDocumentSelect.DateCreated, "mmm")#, #dayFormat##suffix#</small>
						</p>
					</div>
					<cfset GroupDocumentID = qDocumentSelect.DocumentID>
					<cfset archiveFound= 0>
					<div class="three-dots dropdown">
						<i class="bi bi-three-dots" id="dropdownMenu1" data-bs-toggle="dropdown" aria-expanded="false"></i>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							<li style="padding-left:10px;">
								Archived <br>
							</li>
							<cfloop>
								<li>
									<cfif GroupDocumentID neq qDocumentSelect.DocumentID>
										<a href="#request.publicSiteDomain#/assets/uploads/Documents/#qDocumentSelect.DocumentFileName#" target="_blank" class="dropdown-item">Sent #dateformat(qDocumentSelect.DateCreated, "mmm")#</a>
										<cfset archiveFound = archiveFound + 1>
									</cfif>	
								</li>
							</cfloop>
							<cfif archiveFound eq 0>
								<li style="padding-left:10px;">
									<small class="text-muted">No archived found</small>
								</li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</cfloop>
	</cfoutput>
</div>									
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">