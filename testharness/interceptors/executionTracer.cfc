<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2005-2008 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author     :	Luis Majano
Date        :	9/28/2007
Description :
	This methods just traces what plugin points it intercepted.
----------------------------------------------------------------------->
<cfcomponent hint="This is a simple tracer"
			 output="false"
			 extends="coldbox.system.Interceptor">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->

	<cffunction name="Configure" access="public" returntype="void" hint="Configuration" output="false" >
		<!--- Nothing --->
	</cffunction>

<!------------------------------------------- INTERCEPTION POINTS ------------------------------------------->

	<cffunction name="preProcess" access="public" returntype="void" output="false" eventPattern="^DONT">
		<!--- ************************************************************* --->
		<cfargument name="event" required="true" type="coldbox.system.beans.RequestContext" hint="The event object.">
		<cfargument name="interceptData" required="true" type="struct" hint="Metadata of intercepted info.">
		<!--- ************************************************************* --->
		 <cfset appendToBuffer('<h2>This should not show</h2>')>
	</cffunction>
	
	<cffunction name="preEvent" access="public" returntype="void" output="false" eventPattern="^eh">
		<!--- ************************************************************* --->
		<cfargument name="event" required="true" type="coldbox.system.beans.RequestContext" hint="The event object.">
		<cfargument name="interceptData" required="true" type="struct" hint="Metadata of intercepted info.">
		<!--- ************************************************************* --->
		 <cfset appendToBuffer('<h4>I love my buffer</h4>')>
	</cffunction>

</cfcomponent>