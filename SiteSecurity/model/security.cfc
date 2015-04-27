<cfcomponent output="false" displayname="a rolebased Loginn" hint="with just the buildIn <cfLogin />-Tag">

<cffunction name="init" access="public" returntype="security" output="false" displayname="contructor" hint="4 default values for the cf-Login-security">
	<cfargument name="directory"	type="string" required="true" displayname="Application-Path" hint="the Main-Path to be extented as needed" />
	<cfargument name="filename"		type="string" required="false" default="security.ini" displayname="Name of the INI-File" hint="which is defined in the config-DIR of the Application-Path" />
	
	<cfset variables.instance.directory		= arguments.directory &'config\' />	<!--- should be in somekind of a config-DIR --->
	<cfset variables.instance.filename		= arguments.filename />
	<cfset variables.instance.security		= getProfileSections(variables.instance.directory &variables.instance.filename) />

	<cfreturn this />
</cffunction>


<cffunction name="logIn" access="public" returntype="boolean" output="false" displayname="User-LogIn" hint="without the session.scope">
	<cfargument name="anwender" type="string" required="true" displayname="Username" hint="should come from the LogIn-Form" />
	<cfargument name="kennwort" type="string" required="true" displayname="Password" hint="should come from the LogIn-Form" />

	<cfset var myAnwender	= cleanStrValue(arguments.anwender) />
	<cfset var myKennwort	= cleanStrValue(arguments.kennwort) />
	<cfset var myINIFile	= variables.instance.directory &variables.instance.filename />

	<cfif len(myKennwort) AND myKennwort IS getProfileString(myINIFile,'User',myAnwender)>
		<cflogin>
			<cfloginuser name="#myAnwender#" password="#myKennwort#" roles="#getProfileString(myINIFile,'UserInRole',myAnwender)#" />
		</cflogin>
	<cfelse>
		<cflogout />
	</cfif>

	<cfreturn isUserLoggedIn() />
</cffunction>


<cffunction name="cleanStrValue" access="private" returntype="string" output="false" displayname="just to be shure" hint="it is a small and clean string LogIn-String">
	<cfargument name="myValue" type="string" required="true">

	<cfset var myCleanValue = left(trim(arguments.myValue),25) />

	<cfreturn myCleanValue />
</cffunction>


<cffunction name="logOut" access="remote" returntype="struct" output="false" displayname="UserlogOut" hint="could also called via AJAX">
	<cfset var logOutPath = getProfileString(variables.instance.directory &variables.instance.filename,'System','logout') />
	<cfset var logInFile = structNew() />

	<!--- docu:Reinhard.Jung/ 2008.05.23 8:28:11 AM  resolve appName from INI-File --->
	<cfset logOutPath = replace(logoutpath,'##application.applicationname##',application.applicationname) />

	<cfset LogInFile.absolute	= IIf(cgi.SERVER_PORT IS '80',DE('http://'),DE('https://')) &cgi.SERVER_NAME &LogOutPath />
	<cfset LogInFile.relative	= listRest(LogOutPath,'/') />

	<cfreturn LogInFile />
</cffunction>


<cffunction name="getHomePage" access="public" returntype="string" output="false" displayname="defined within the INI-File" hint="redirects (after LoggedIn) the User to the 'HomePage-'Page of his FIRST Role">
	<cfreturn getProfileString(variables.instance.directory &variables.instance.filename,'RoleHomePage',listFirst(getUserRoles())) />
</cffunction>

</cfcomponent>
