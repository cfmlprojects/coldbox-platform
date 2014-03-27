<cfsilent>
<cfparam name="url.target" 		default="">
<cfparam name="url.recurse" default="true">
<cfparam name="url.labels"		default="">
<cfparam name="url.reporter"	default="ANTJunit">
<cfscript>
// create testbox
testBox = new coldbox.system.testing.TestBox();
// clean up
for( key in URL ){
	url[ key ] = xmlFormat( trim( url[ key ] ) );
}
// execute tests
if( len( url.target ) ){
	// directory or CFC, check by existence
	try {
		if( !directoryExists( expandPath( "/#replace( url.target, '.', '/', 'all' )#" ) ) ){
			results = testBox.run( bundles=url.target, reporter=url.reporter, labels=url.labels );
		} else {
			results = testBox.run( directory={ mapping=url.target, recurse=url.recurse }, reporter=url.reporter, labels=url.labels );
		}
		results = trim(results);
	} catch (any e) {
		results = '<testsuites><testsuite><testcase name="#url.target#" time="0.001" classname="#url.target#"><failure message="#e.message#"><![CDATA[#serializeJSON(e)#]]></failure></testcase></testsuite></testsuites>';
	}
} else {
	results = 'No tests selected for running!';
}
</cfscript></cfsilent><cfcontent type="text/xml" reset="true"><cfset writeOutput(results) />