(*
BlueSense AppleScript
Examples of AppleScript script to control Mac OS X that can be used with BlueSense for Mac (Bluetooth device detection).
https://apps.inspira.io/bluesense/en/
*)
-- ENABLE MAC AUTOMATIC SESSION LOGIN APPLESCRIPT
-- Enable Mac OSX automatic session, auto login with your current account
-------------------------------------------------------------------------------------------------
script EnableAutomaticLogin
	try
		set my_password to getPassword(KeychainPasswordName)
		set my_username to getUsername()
		do shell script ("/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow.plist autoLoginUser " & quoted form of my_username) user name my_username password my_password with administrator privileges
	on error errString number errorNumber
		log (errString)
	end try
end script