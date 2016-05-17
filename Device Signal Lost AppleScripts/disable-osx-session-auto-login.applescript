(*
BlueSense AppleScript
Examples of AppleScript script to control Mac OS X that can be used with BlueSense for Mac (Bluetooth device detection).
https://apps.inspira.io/bluesense/en/
*)

-- DISABLE MAC OS X SESSION AUTOMATIC LOGIN
-- Disable Mac OSX automatic session, disable auto login with your account at startup
-- When the Mac starts, you have to enter your password to start the session
-------------------------------------------------------------------------------------------------
script DisableAutomaticLogin
	try
		set my_password to getPassword(KeychainPasswordName)
		set my_username to getUsername()
		do shell script ("/usr/bin/defaults delete /Library/Preferences/com.apple.loginwindow.plist autoLoginUser") user name my_username password my_password with administrator privileges
	on error errString number errorNumber
		log (errString)
	end try
end script