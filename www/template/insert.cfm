 <!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h4 class="page-title">Template Manager</h4>
            <div class="page-title-right">
                <ol class="breadcrumb p-0 m-0">
                    <li class="breadcrumb-item"><a href="/index.cfm?area=dashboard&action=index">Dashboard</a></li>
                    <li class="breadcrumb-item active">Create New Template</li>
                </ol>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- end page title -->

<cfparam name="url.templateID" default="0" >
<cfparam name="form.templateID" default="#url.templateID#" >


<!--- get the tempalte --->
<cfquery datasource="#request.dsname#" name="qTemplateSelect">
	select *
		from Template
		where TemplateID = #form.templateID#
</cfquery>

<!--- get looup tables --->
<cfquery datasource="#request.dsname#" name="qScannedTypeSelect">
	SELECT *
	FROM tblScannedType
	Order By ScannedTypeID
</cfquery>

<cfquery datasource="#request.dsname#" name="qCategorySelect">
	SELECT *
	FROM dbo.tblCategory
	Order By CategoryID
</cfquery>

<cfoutput>

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title" ondblclick="qa();">Template Manager - Step 1</h3></div>
            <div class="card-body">
                <div class="form">
                    <form class="cmxform form-horizontal tasi-form" id="commentForm" method="post" action="/template/insertaction.cfm" novalidate="novalidate" enctype="multipart/form-data">
                        
                        <div class="row">
                        	<!---1st Col --->
                        	<div class="col-lg-6">
                        		
                        		<!--- Document Name --->
		                        <div class="form-group row">
		                            <label for="Document_Name" class="col-form-label col-lg-4">Document Name *</label>
		                            <div class="col-lg-8">
		                                <input class="form-control" id="Document_Name" name="Document_Name" type="text" Value="#qTemplateSelect.Document_Name#" required="" aria-required="true">
		                            </div>
		                        </div>
		                        
		                         <!--- Base Template --->
		                        <cfset qTemplateSelect.TemplateFileName = "Invoice2.docx">
		                        <div class="form-group row">
		                            <label for="template" class="col-form-label col-lg-4">Base Template *</label>
		                            <div class="col-lg-8">
		                                <div class="fileupload btn btn-purple waves-effect waves-light mt-1 mr-1">
		                                            <span><i class="mdi mdi-cloud-upload mr-2"></i>Upload</span>
		                                            <input id="templatefilename" name="templatefilename" type="file" class="upload" <cfif qTemplateSelect.TemplateFileName eq ""> required="" aria-required="true"</cfif>>
		                                        </div>
		                                        <input type="hidden" id="currenttemlatefilename" name="currenttemlatefilename" value="#qTemplateSelect.TemplateFileName#">
		                                        
		                                        <cfif qTemplateSelect.TemplateFileName gt "">
		                                        	<a  href="#cgi.sCRIPT_NAME#?area=template&action=open&filename=#qTemplateSelect.TemplateFileName#">
	                                    					Download Current Template (#qTemplateSelect.TemplateFileName#)</a>
		                                        </cfif>
		                            </div>
		                        </div>
		                        
		                        <!---Scanned Type --->
		                        <div class="form-group row">
		                            <label for="scannedtype" class="col-form-label col-lg-4" >Scanned Type *</label>
		                            <div class="col-lg-8">                                
		                                <select id="scannedtype" name="scannedtype" class="form-control" required="" aria-required="true">
		                                	<option  value="">Select one...</option>
		                                	<cfloop  query="qScannedTypeSelect">
		                                		<option value="#trim(qScannedTypeSelect.SCANNEDTYPEID)#" <cfif qTemplateSelect.Doctype eq qScannedTypeSelect.SCANNEDTYPEID>selected="selected"</cfif> >#qScannedTypeSelect.Description#</option>
		                                	</cfloop>
		                                </select>
		                            </div>
		                        </div>
		                        
		                        
		                        
		                        <!--- Sort Order --->                        
		                        <div class="form-group row">
		                            <label for="sortorder" class="col-form-label col-lg-4">Sort Order</label>
		                            <div class="col-lg-8">
		                                <input class="form-control" id="sortorder" name="sortorder" type="text" value="#qTemplateSelect.SortOrder#">
		                            </div>
		                        </div>
		                        
		                        <!--- Display Col --->                        
		                        <div class="form-group row">
		                            <label for="Display_Column" class="col-form-label col-lg-4">Display Column</label>
		                            <div class="col-lg-8">
		                            	<select class="form-control" id="Display_Column" name="Display_Column" >		                            		
		                            		<option value="1" <cfif qTemplateSelect.Display_Column eq 1>selected</cfif>>First Column</option>
		                            		<option value="2" <cfif qTemplateSelect.Display_Column eq 2>selected</cfif>>Second Column</option>		                            		
		                            	</select>		                                
		                            </div>
		                        </div>
		                        
		                        <!--- Document Output Companion Options --->  
		                        <div class="form-group row">
		                            <label for="agree" class="col-form-label col-lg-4 col-sm-3">Document Output Companion Options</label>
		                            <div class="col-lg-8 col-sm-8">
		                                <div class="p-2">                                    
		                                	<input type="checkbox" style="width: 16px" name="LedgerNeeded" id="LedgerNeeded" value="1" <cfif qTemplateSelect.LedgerNeeded eq 1>Checked</cfif>>Ledger Needed
											<br>
											<input type="checkbox" style="width: 16px" name="PartyListNeeded" id="PartyListNeeded" value="1" <cfif qTemplateSelect.PartyListNeeded eq 1>Checked</cfif>>Parties List Needed
											<br>
											<input type="checkbox" style="width: 16px" name="SelectedDefendantNeeded" id="SelectedDefendantNeeded"  value="1" <cfif qTemplateSelect.SelectedDefendantNeeded eq 1>Checked</cfif>>Selected Defendants List Needed
			                            </div>
		                            </div>
		                        </div>
                        		
                        	</div>
                        	
                        	<!---2nd Col --->
                        	<div class="col-lg-6">
                        		
                        		<!--- Document Number --->
		                        <div class="form-group row">
		                            <label for="documentnumber" class="col-form-label col-lg-4">Document Number *</label>
		                            <div class="col-lg-8">
		                                <input class="form-control" id="Document_Number" name="Document_Number" Value="#qTemplateSelect.Document_Number#" type="text" required="" aria-required="true">
		                            </div>
		                        </div>
		                        
		                        <!--- Document Type --->
		                        <div class="form-group row">
		                            <label for="DocArea" class="col-form-label col-lg-4">Document Type *</label>
		                            <div class="col-lg-8">
		                                <cfset documenttypelist = "Collections,Litigation,Bankruptcy,Envelope,Fax,Other">
		                                
		                                <select id="DocArea" name="DocArea" class="form-control" required="" aria-required="true">
		                                	<option value="">Select one...</option>
		                                	<cfloop list="#documenttypelist#" index="item" > 
		                                		<option value="#item#" <cfif 1 eq qTemplateSelect[item][1]> selected="selected"</cfif>>#item#</option>
		                                	</cfloop>
		                                </select>                                
		                            </div>
		                        </div>
		                        
		                        <!---Category --->
		                        <div class="form-group row">
		                            <label for="CategoryID" class="col-form-label col-lg-4">Category *</label>
		                            <div class="col-lg-8">
		                                
		                                <select id="CategoryID" name="CategoryID" class="form-control" required="" aria-required="true">
		                                	<option value="">Select one...</option>
		                                	<cfloop  query="qCategorySelect">
		                                		<option value="#trim(qCategorySelect.CategoryID)#,#qCategorySelect.Category#" <cfif qTemplateSelect.CategoryIDFK eq qCategorySelect.CategoryID>selected="selected"</cfif>>#qCategorySelect.Category#</option>
		                                	</cfloop>
		                                </select>
		                            </div>
		                        </div>
		                        
		                        
		                        
		                        <!--- Document Access --->
		                        <div class="form-group row">
		                            <label for="email" class="col-form-label col-lg-4">Document Access *</label>
		                            <div class="col-lg-8">
		                                <select name="Doc_Access" id="Doc_Access" class="form-control" required="" aria-required="true">
											<option valjue="Public" <cfif qTemplateSelect.Doc_Access eq "Public">selected</cfif>>Public</option>
											<option value="Private"  <cfif qTemplateSelect.Doc_Access eq "Private">selected</cfif>>Private</option>
										</select>
		                            </div>
		                        </div>
		                        
		                         <!--- Debtor Only --->                        
		                        <div class="form-group row">
		                            <label for="Display_Column" class="col-form-label col-lg-4">Debtor One Only *</label>
		                            <div class="col-lg-8">
		                            	<select name="Debtor_1_Only" id="Debtor_1_Only" class="form-control" required="" aria-required="true">
		                            		<option value="1" <cfif qTemplateSelect.Debtor_1_Only eq 1>selected="selected"</cfif>>Yes</option>
		                            		<option value="0" <cfif qTemplateSelect.Debtor_1_Only eq 1>selected="selected"</cfif>>No</option>
		                            	</select>                            	
		                            </div>
		                        </div>
		                        
		                        <!--- Auto Task ID --->                        
		                        <div class="form-group row">
		                            <label for="AutoTaskID" class="col-form-label col-lg-4">Auto Task ID</label>
		                            <div class="col-lg-8">
		                                <input class="form-control" id="AutoTaskID" name="AutoTaskID" type="text" Value="#qTemplateSelect.AutoTaskID#">
		                            </div>
		                        </div>
		                        
		                        <!---save buton --->
		                         <div class="form-group row text-right">
		                            <div class="col-lg-12 pull-right">
		                                <button class="btn btn-success waves-effect waves-light mr-1" type="submit">Save</button>
		                                <button class="btn btn-secondary waves-effect" type="button" onclick="window.history.back();">Cancel</button>
		                                <input type="hidden" name="templateID" id="templateID" value="#form.templateID#">
		                                
		                            </div>
		                        </div>
                        		
                        	</div>
                        	
                        </div>
                        
                        
                    </form>
                </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
                <!-- .form -->

            </div>
            <!-- card-body -->
        </div>
        <!-- card -->
    </div>
    <!-- col -->

</div>
<!-- End row -->


</cfoutput>



<script >
	function qa(){
		$("#Document_Name").val('New Document');
		$("#Document_Number").val('DN01');
		$("#DocArea").val("Other").change();
		$("#scannedtype").val("1").change();
		$("#CategoryID").val("7,Title").change();
		$("#sortorder").val("99");
		$("#PartyListNeeded").prop("checked", true);
	}
</script>