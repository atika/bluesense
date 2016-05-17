(*
BlueSense AppleScript
Examples of AppleScript script to control Mac OS X that can be used with BlueSense for Mac (Bluetooth device detection).
https://apps.inspira.io/bluesense/en/
*)

-- MAC SCREENSAVER PASSWORD APPLESCRIPT
-- Enable password prompt when ScreenSaver is launched
-- Tips: In System Preferences change so that the password is requested 5 seconds after the start of the screensaver, 
-- if for some reason the app loose the signal, you will have to enter the password every time...

script EnableScreenSaverPassword
	try
		-- method 1
		(*
		tell application "System Events"
			tell security preferences
				activate
				set properties to {require password to wake:true}
			end tell
			tell application id "com.apple.ScreenSaver.Engine" to launch
		end tell
		*)
		-- method 2
		do shell script ("/usr/bin/defaults write com.apple.screensaver askForPassword -int 1")
		do shell script ("/usr/bin/defaults write com.apple.screensaver askForPasswordDelay -int 5")
		-- Launch the  ScreenSaver
		tell application id "com.apple.ScreenSaver.Engine" to launch
	on error errString number errorNumber
		log (errString)
	end try
end script
