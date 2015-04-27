<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Site-Security - [<cfoutput>#getAuthUser()#</cfoutput>]</title>
</head>

<body>

<p>This is the <strong>Master</strong>-Page to administrate the Application!</p> <cfoutput>#getAuthUser()#</cfoutput>: <a href="<cfoutput>#application.security.logOut().absolute#</cfoutput>">logout</a>

<cfinclude template="index.cfm">

</body>
</html>