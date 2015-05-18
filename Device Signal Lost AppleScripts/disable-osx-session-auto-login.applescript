# Disable Mac OSX automatic session, disable auto login with your account at startup (Password Prompt)
script DisableAutoLogin
	set my_password to getPassword("PassKeychainName")
	set my_username to "YOURUSERNAME"
	try
		do shell script ("defaults delete /Library/Preferences/com.apple.loginwindow.plist autoLoginUser") user name my_username password my_password with administrator privileges
	end try
end script
