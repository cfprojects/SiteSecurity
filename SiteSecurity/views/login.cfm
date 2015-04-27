<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 	<cfparam name="url.event"		type="string" default="">
	<cfparam name="actionPage"	type="string" default="#listFirst(application.security.logOut().absolute,'?')#">

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title>Site-Guards - [LogIn]</title>

	<cfif NOT structIsEmpty(form)>
		<cfset application.security.logIn(form.anwender,form.kennwort) />
		<cfif isUserLoggedIn()>
			<cflocation url="#application.security.getHomePage()#" />
		</cfif>
	</cfif>
</head>

<body>

<cfif url.event IS "logout"><cflogout /></cfif>

<h3>Systemanmeldung</h3>
<cfif cgi.REQUEST_METHOD IS "post" AND NOT isUserLoggedIn()>Fehler bei der Anmeldung</cfif>
<form name="login" method="post" action="<cfoutput>#actionPage#</cfoutput>">
	Anwender <input id="anwender" name="anwender" type="text"><br />
	Kennwort <input id="kennwort" name="kennwort" type="password"><br /><br />
	<input name="check" type="submit"><br />
</form>

<script type="text/javascript">document.forms[0].elements[0].focus();</script>

</body>
</html>