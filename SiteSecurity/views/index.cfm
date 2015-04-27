<p>You are in Role/s: <cfdump var="#getUserRoles()#"></p>

<cfif isUserinRole('member')>
	<p>This Area is "ONLY" for Members</p>
</cfif>

<cfif isUserinRole('guest')>
	<p>This Area is "ONLY" for Guests</p>
</cfif>

<cfif isUserinRole('admin')>
	<p>This Area is "ONLY" for Admins</p>	
</cfif>