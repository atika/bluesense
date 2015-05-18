
# Enable password prompt when ScreenSaver is launched
# Tips: In System Preferences change so that the password is requested 5 seconds after the start of the screensaver, if for some reason the app loose the signal, you will have to enter the password every time...

script EnableScreenSaverPassword
	tell application "System Events"
		tell security preferences
			activate
			set properties to {require password to wake:true}
		end tell
		tell application id "com.apple.ScreenSaver.Engine" to launch
	end tell
end script
