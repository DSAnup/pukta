
			
<!--- Shouldn't need any of this but it shouldn't hurt either --->
<cfif IsDefined("URL") AND NOT StructIsEmpty(URL)>
	<cfloop collection="#url#" item="uItems">
		<cfif uItems eq "evaluate" or uItems eq "writeoutput" or uItems eq "creatobject" or uItems eq "FileRead" or uItems eq "FileWrite" or uItems eq "DirectoryList" or uItems eq "DirectoryExists" or uItems eq "OpenFile" or uItems eq "writedump" or uItems eq "invoke">
			

			<cfthrow type="any"	message="We are sorry, an error has occurred." detail="We are sorry, an error has occurred.">
			<cfabort>
		</cfif>
	</cfloop>
</cfif>


<cfif IsDefined("FORM") AND NOT StructIsEmpty(FORM)>		
	<cfloop collection="#FORM#" item="fItems">
		<cfif len(trim(FORM[fItems])) GT 0>
			<cfif NOT FindNoCase(GetTempdirectory(), form[fitems])><!--- Skip FILE upload fields --->
				<cfif fItems eq "evaluate" or fItems eq "writeoutput" or fItems eq "creatobject" or fItems eq "FileRead" or fItems eq "FileWrite" or fItems eq "DirectoryList" or fItems eq "DirectoryExists" or fItems eq "OpenFile" or fItems eq "writedump" or fItems eq "invoke">
					
					<cfthrow type="any"	message="We are sorry, an error has occurred." detail="We are sorry, an error has occurred.">
					<cfabort>
				</cfif>
			</cfif>
		</cfif>
	</cfloop>
</cfif>


<!--- START: Sanitize input --->
<!--- URL --->
<cfif IsDefined("URL") AND NOT StructIsEmpty(URL)>
	<cfloop collection="#url#" item="uItems">
		<cfif len(trim(url[uItems])) GT 0>
			<cfset url[uItems] = SafeText(url[uItems])>
		</cfif>
	</cfloop>
</cfif>


<!--- FORM --->
<cfif IsDefined("FORM") AND NOT StructIsEmpty(FORM)>			
	<cfloop collection="#FORM#" item="fItems">
		<cfif len(trim(FORM[fItems])) GT 0>
			<cfif NOT FindNoCase(GetTempdirectory(), form[fitems])><!--- Skip FILE upload fields --->
				<cfif fItems NEQ "fieldnames"><!--- skip the comma delimited list of fieldnames --->
					<cfset FORM[fItems] = SafeText(FORM[fItems])>
				</cfif>
			</cfif>
		</cfif>
	</cfloop>
</cfif>

<cfscript>
	function safetext(text) {
		//default mode is "escape"
		var mode = "";
		//the things to strip out (badTags are HTML tags to strip and badEvents are intra-tag stuff to kill)
		//you can change this list to suit your needs
		var badTags = "EVALUATE,CREATEOBJECT,WRITEOUTPUT,FileRead,FileWrite,DirectoryList,DirectoryExists,OpenFile,writedump,invoke,SCRIPT,OBJECT,APPLET,EMBED,FORM,LAYER,ILAYER,FRAME,IFRAME,FRAMESET,PARAM,META,STYLE,IMG,BODY";
		var badEvents = "onwheel,onClick,onError,onDblClick,onKeyDown,onKeyPress,onKeyUp,onMouseDown,onMouseOut,onMouseUp,onMouseOver,onBlur,onChange,onFocus,onSelect,onload,String.fromCharCode,javascript:,background:"; //added expression[(] on 07-10-12
		var stripperRE = "";
		
		//set up variable to parse and while we're at it trim white space 
		var theText = trim(text);
		//find the first open bracket to start parsing
		var obracket = find("<",theText);		
		//var for badTag
		var badTag = "";
		//var for the next start in the parse loop
		var nextStart = "";
		//if there is more than one argument and the second argument is boolean TRUE, we are stripping
		if(arraylen(arguments) GT 1 AND isBoolean(arguments[2]) AND arguments[2]) mode = "strip";
		if(arraylen(arguments) GT 2 and len(arguments[3])) badTags = arguments[3];
		if(arraylen(arguments) GT 3 and len(arguments[4])) badEvents = arguments[4];
		//the regular expression used to stip tags
		stripperRE = "</?(" & listChangeDelims(badTags,"|") & ")[^>]*>";	
		//Deal with "smart quotes" and other "special" chars from MS Word
		theText = replaceList(theText,chr(8216) & "," & chr(8217) & "," & chr(8220) & "," & chr(8221) & "," & chr(8212) & "," & chr(8213) & "," & chr(8230),"',',"","",--,--,...");
		//if escaping, run through the code bracket by bracket and escape the bad tags.
		if(mode is "escape"){
			//go until no more open brackets to find
			while(obracket){
				//find the next instance of one of the bad tags
				badTag = REFindNoCase(stripperRE,theText,obracket,1);
				//if a bad tag is found, escape it
				if(badTag.pos[1]){
					theText = replace(theText,mid(TheText,badtag.pos[1],badtag.len[1]),request.OutboundEncode(mid(TheText,badtag.pos[1],badtag.len[1])),"ALL");
					nextStart = badTag.pos[1] + badTag.len[1];
				}
				//if no bad tag is found, move on
				else{
					nextStart = obracket + 1;
				}
				//find the next open bracket
				obracket = find("<",theText,nextStart);
			}
		}
		//if using the blacklist approach and stripping JUST the badTag values
		else if (mode is "blacklist"){
			theText = REReplaceNoCase(theText,stripperRE,"","ALL");
		}
		//stripping everything between opening tags
		else{
			//theText = REReplace(theText,"<[^>]*>","","ALL");
			theText = REReplace(theText,"<[^>]*(?:>|$)","","ALL");
	
			//should I have been always running through xmlFormatOutput() this whole time? Yes I think so.... aye yai yai.
			theText = xmlFormatOutput(theText);
			
		}
		//now kill the bad "events" (intra tag text)
		theText = REReplaceNoCase(theText,'(#ListChangeDelims(badEvents,"|")#)[^ >]*',"","ALL");
		
		//CRLF for header
		//theText = REReplaceNoCase(theText,'[#CHR(13)##CHR(10)#]',"","ALL");
		//theText = REReplaceNoCase(theText,'[%0D%0A]',"","ALL");
		//theText = REReplaceNoCase(theText,'[\r\n]',"","ALL");
	
		
		//blockWrite(text,theText); //for debugging original and encoded values side-by-side
		
		//return theText
		return theText;
	}

	function OutboundEncode(element) {
		var theText = trim(element);
		var NewStr = "";
		var lEntities = "&,##,>,<,"",},{,],[,',',?,=,/,*,),(,%,\";
	   
		var lEntitiesChars = "&amp;,&##35;,&gt;,&lt;,&quot;,&##125;,&##123;,&##93;,&##91;,&##39;,&apos;,&##63;,&##61;,&##47;,&##42;,&##41;,&##40;,&##37;,&##92;";
		
			
		lEntities = lEntities;
		lEntitiesChars = lEntitiesChars;
	
		NewStr = ReplaceList(theText, lEntities, lEntitiesChars);
		
		
		return trim(NewStr);
	}
	// request.OutboundEncode = OutboundEncode;
</cfscript>

<cffunction name="xmlFormatOutput" access="public" returntype="any" output="no">
	<cfargument name="Data" type="any" required="yes">
	
	<cfset var NEWDATA=StructNew()>
	
	
	<cfset NEWDATA["data"] = xmlFormatOutputProcess(Data=arguments.data)>

	<cfreturn NEWDATA.data>
</cffunction>


<cffunction name="xmlFormatOutputProcess" access="public" returntype="any" output="no">
	<cfargument name="Data" type="any" required="yes">
	
	
	<cfset var Idx="">
	<cfset var Key="">
	
	
	
	<!----tests to see if this is an Array--->
	<cfif isArray(arguments.data)>
		<cfloop from="1" to="#ArrayLen(arguments.data)#" index="Idx">
			<cfset arguments.data[Idx] = xmlFormatOutputProcess(arguments.data[Idx])>
		</cfloop> 
	<!----tests to see if this is a Structure--->    
	<cfelseif isStruct(arguments.data)>
		<cfloop collection="#arguments.data#" item="Key">
			
			<!--- add any DMC struct key that might contain HTML formatting from FoxPro so that it DOESN'T get encoded --->
			<cfif NOT ListFindNoCase("errorMessage,displayMessage,description,label,preText,postText,Signature,SAML,SSO,sessionEnvUploadPath,sessionEnvGenericUploadPath,sessionEnvSWC_UploadPath,sessionEnvSWC_PublicImagePath,SignatureImg,WitnessSignatureImg,ClientGroup,Webgroup", key)>
				<cfset arguments.data[Key] =  xmlFormatOutputProcess(arguments.data[Key])>
			</cfif>
		</cfloop>	
	<!----tests to see if this is a Query--->  
	<!--- works in My Tasks but not Applicants.... why? --->  
	<!--- <cfelseif isQuery(arguments.data)>
		<cfloop from="1" to="#arguments.data.recordCount#" index="sourceRow">
			  <cfloop list="#arguments.data.columnList#" index="col">
					<cfset QuerySetCell(arguments.data, col, xmlFormatOutput(arguments.data[col][sourceRow]), sourceRow) />
			  </cfloop>
		</cfloop> --->
		
	<cfelse>
		<!----if we get here then we are at the simplest value thus set the simplest value and return it---->
		<cfif IsSimpleValue(arguments.data) AND len(trim(arguments.data)) GT 0>
			
			<!--- on occassion we pass the full XML response back as a string so we need to NOT process that --->
			<cfif NOT IsXml(arguments.data)>
				<!--- decode first before we encode so we do not double-encode;
						sometimes we get garbage characters from client data feeds.
						Test to see if there is an ampersand that may denote something is encoded. 
						This will save on performance. --->
				<cfif FindNoCase("&", arguments.data)>
					<cfset arguments.data = request.HtmlUnEditFormat(arguments.data)>
				</cfif>
				
				
				<!--- please note that if you need to send a URL value to XML you WILL need to encode the ampersands
						so you should wrap the URL variables in request.OutboundEncode(URL.XXXX).
					  <!--- ** Addendum ** I added an else to this and run XmlFormat() on the items that may contain ampersands
					  so we should NOT have to remember to encode them before sending to XML.
					 --->
				--->
				<!--- do not process url's or img tags or dates --->
				<cfif NOT FindNoCase("<a", arguments.data) AND NOT FindNoCase("http", arguments.data) AND NOT FindNoCase("<img", arguments.data) AND NOT LSIsDate(arguments.data)>
					<cfset arguments.data = outboundEncode(arguments.data)>
				<!--- <cfelse>
					<cfset arguments.data = Xmlformat(arguments.data)> ---><!--- added on 4/12/13 : may cause problems --->
				</cfif>
			</cfif>
			
		</cfif>
	</cfif>
	 
	
	<cfreturn arguments.data>
</cffunction>
