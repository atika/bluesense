
# Enable Mac OS X to automatically open your account at startup (automatic session)
script EnableAutoLogin
	set my_password to getPassword("PassKeychainName")
	set my_username to "YOURUSERNAME"
	try
		do shell script ("defaults write /Library/Preferences/com.apple.loginwindow.plist autoLoginUser YOURUSERNAME") user name my_username password my_password with administrator privileges
	end try
end script