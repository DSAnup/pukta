 <!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h4 class="page-title">Template Manager</h4>
            <div class="page-title-right">
                <ol class="breadcrumb p-0 m-0">
                    <li class="breadcrumb-item"><a href="/index.cfm?area=dashboard&action=index">Dashboard</a></li>
                    <li class="breadcrumb-item active">Manage Merge Codes</li>
                </ol>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- end page title -->



<!---
<cfdump var="#url#" >--->
<cfparam name="url.newRead" default="false" >
<cfif url.newRead eq "true">
	
	
	<cfset documentDAO = createObject('component', 'model.DocumentDAO')>
	
	<cfset response = documentDAO.GetTemplateMetaData(url.templateid)>
	
	<cfif response.success eq "true">		
		<cfset data.keyword = response.data>		
	<cfelse >
		<cfset data.keyword = ArrayNew(1)>	
		<div id="alert">
			<div class="alert alert-danger">
			    <cfoutput>#response.data#</cfoutput> 
			</div>
		</div>
	</cfif>
	
	<cfset list = "0">
	
	<cfloop array="#data.keyword#" item="key" >
		
		<cfset key = replace(key, "<<", "")>
		<cfset key = replace(key, ">>", "")>
			
		<cfquery datasource="#request.dsname#" name="q">
			declare @MergeCodeID int
			select @MergeCodeID = FieldID
				from tblMergeCodes
				where MergeCode = '#key#'
			
			if @MergeCodeID is null
			begin
				select 0 as MergeCodeID
				return 
			end
			
			declare @TemplateMergeCodeID int
			select @TemplateMergeCodeID = TemplateMergeCodeID
				from TemplateMergeCode
				where TemplateID = #url.templateid#
					and MergeCodeID = @MergeCodeID
				
			if @TemplateMergeCodeID is null
				insert into TemplateMergeCode
					(TemplateID, MergeCodeID, StrictCode)
				values
					(#url.templateID#, @MergeCodeID, 'Must Have')
					
			select @MergeCodeID as MergeCodeID
		</cfquery>
		
		<cfset list = listAppend(list, q.MergeCodeID)>
		
	</cfloop>
	
	<cfquery datasource="#request.dsname#">
		delete from TemplateMergeCode
			where MergeCodeID not in (#list#)
				and TemplateID = #url.templateid#
	</cfquery> 
	

</cfif>



<cfquery datasource="#request.dsname#" name="q">
	
	select TemplateMergeCode.*,
			tblMergeCodes.MergeCode
		 from 
		TemplateMergeCode
			join tblMergeCodes on tblMergeCodes.FielDID = TemplateMergeCode.MergeCodeID
		where TemplateID = #url.templateid#
		
		order by tblMergeCodes.MergeCode
		
</cfquery> 


<cfset maxOnEachRow = q.RecordCount / 2 + 1>



<cfoutput>
	
<!---desplay error message if any found reading the file... --->
<cfif q.RecordCount lt 1>
	<div id="alert">
	<div class="alert alert-danger">
	    <cfoutput>No mergecode was found in the template.</cfoutput> 
	</div>
	</div>
</cfif>



<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title" ondblclick="qa();">Template Manager - Step 2, Configure Fields</h3></div>
            <div class="card-body">
                <div class="form">
                    <form class="cmxform form-horizontal tasi-form" id="commentForm" method="post" action="/template/templatemergecodeinsertaction.cfm" novalidate="novalidate">
                        
                        <div class="row">
                        	<!---1st Col --->
                        	<div class="col-lg-5">
                        		
                        		<cfloop query="q" startrow="1" endrow="#maxOnEachRow#" >
                        		
                        		<!--- Merge Code --->
		                        <div class="form-group row">
		                            <label for="Document_Name" class="col-form-label col-lg-7">#q.MergeCode# *</label>
		                            <div class="col-lg-5">
		                                 <select name="strictCode" id="strictCode" class="form-control" required="" aria-required="true">
											<option value="#q.TemplateMergeCodeID#|Must Have" <cfif q.strictCode eq "Must Have">selected</cfif>>Must Have</option>
											<option value="#q.TemplateMergeCodeID#|Issue Warning"  <cfif q.strictCode eq "Issue Warning">selected</cfif>>Issue Warning</option>
											<option value="#q.TemplateMergeCodeID#|Ignore Missing"  <cfif q.strictCode eq "Ignore Missing">selected</cfif>>Ignore Missing</option>
										</select>
		                            </div>
		                        </div>
		                        
		                        </cfloop>
		                       
                        		
                        	</div>
                        	
                        	<div class="col-lg-2"></div>
                        	
                        	<!---2nd Col --->
                        	<div class="col-lg-5">
                        		
                        		<cfloop query="q" startrow="#maxOnEachRow + 1#"  >
                        		
                        		<!--- Merge Code --->
		                        <div class="form-group row">
		                            <label for="Document_Name" class="col-form-label col-lg-7">#q.MergeCode# *</label>
		                            <div class="col-lg-5">
		                                 <select name="strictCode" id="strictCode" class="form-control" required="" aria-required="true">
											<option value="#q.TemplateMergeCodeID#|Must Have" <cfif q.strictCode eq "Must Have">selected</cfif>>Must Have</option>
											<option value="#q.TemplateMergeCodeID#|Issue Warning"  <cfif q.strictCode eq "Issue Warning">selected</cfif>>Issue Warning</option>
											<option value="#q.TemplateMergeCodeID#|Ignore Missing"  <cfif q.strictCode eq "Ignore Missing">selected</cfif>>Ignore Missing</option>
										</select>
		                            </div>
		                        </div>
		                        
		                        </cfloop>
		                        
		                        
		                        <!---save buton --->
		                         <div class="form-group row text-right">
		                            <div class="col-lg-12 pull-right">
		                                <button class="btn btn-success waves-effect waves-light mr-1" type="submit">Save</button>
		                                <button class="btn btn-secondary waves-effect" type="button" onclick="window.history.back();">Cancel</button>
		                                <input type="hidden" name="templateID" id="templateID" value="#url.templateID#">
		                                
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





