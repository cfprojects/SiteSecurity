<cfapplication name="#listLast(getDirectoryFromPath(getCurrentTemplatePath()),'\')#">

<cfset application.security = createObject("component","#application.applicationname#.model.security").init(getDirectoryFromPath(getCurrentTemplatePath())) />

<cfif NOT isUserLoggedIn()>
	<cfinclude template="#ListFirst(application.security.logOut().relative,'?')#">
	<cfabort />
</cfif>
