
<cfquery datasource="#request.dsname#" name="qMergeCodeSelect">
	
	select *
		from tblMergeCodes
	
</cfquery>

 <!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h4 class="page-title">Template Manager</h4>
            <div class="page-title-right">
                <ol class="breadcrumb p-0 m-0">
                    <li class="breadcrumb-item"><a href="/index.cfm?area=dashboard&action=index">Dashboard</a></li>
                    <li class="breadcrumb-item active">List of Existing Templates</li>
                </ol>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- end page title -->


<cfoutput>

 <div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
            	<div class="row">
            		<div class="col-md-8 col-sm-8 col-8"><h3 class="card-title">List of Existing Templates</h3></div>
            		<div class="col-md-4 col-sm-4 col-4 text-right"><a href="index.cfm?area=template&action=insert">Add New Template</a> </div>
            	</div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-12">
                        <table id="datatable" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                            <thead>
                                <tr>
                                    <th>Merge Code</th>  
                                    <th>Merge Code</th> 
                                    <th>Merge Code</th> 
                                    <th>Merge Code</th>
                                </tr>
                            </thead>

                            <tbody>
                            	
                            		 
                            		 	<cfloop query="qMergeCodeSelect">
	                                    	
	                                    	<cfif qMergeCodeSelect.CurrentRow Mod 4 eq 1>
	                                    		<tr>
	                                    	</cfif>
	                                    	<td>#qMergeCodeSelect.MergeCode#</td>
	                                    	<cfif qMergeCodeSelect.CurrentRow Mod 4 eq 0 or qMergeCodeSelect.RecordCount eq qMergeCodeSelect.CurrentRow>
	                                    		</tr>
	                                    	</cfif>
	                                    	
	                                    </cfloop>
	                                 
                            	
                                
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- End Row -->

</cfoutput>

   
