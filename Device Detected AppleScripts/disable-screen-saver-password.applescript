(*
BlueSense AppleScript
Examples of AppleScript script to control Mac OS X that can be used with BlueSense for Mac (Bluetooth device detection).
https://apps.inspira.io/bluesense/en/
*)

-- MAC SCREENSAVER AND PASSWORD APPLESCRIPT
-- Disable ScreenSaver Password 
-- You have to compile and install SleepDisplay, a Mac OS X program to manage the display sleep : https://github.com/kimhunter/SleepDisplay
-- Don't deactivate the screensaver/session password without enter the password before, the windows of Mac OS X  will stay freezed and you will have to force reboot.
-- Use the script to get the password from the keychain or put it in clear in this script (not recommended) 
-- 1. It wakes the display (the script doesn't work if the display is sleeping)
-- 2. It hits a key, if the screensaver is still open, it means that OSX asks for the password.
-- 3. If Yes, it enters the password on the screensaver prompt -- 4. It disables the screensaver password only if it isn't running.

script DisableScreenSaverPassword
	try
		set my_password to getPassword(KeychainPasswordName)
		
		-- Wake up the display
		if ScreenIsLocked() then
			# do shell script ("/usr/local/bin/SleepDisplay -wake") -- method 1 with SleepDisplay https://github.com/kimhunter/SleepDisplay
			do shell script ("/usr/bin/caffeinate -u -t 1") -- method 2 with caffeinate
			delay 3
		end if
		
		-- Enter the Screensaver Password
		tell application "System Events" to key code 53 using command down
		delay 2
		
		if (my ScreenSaverRunning()) or (my ScreenIsLocked()) then
			tell application "System Events"
				keystroke "a" using command down -- select all
				keystroke my_password --enter password
				delay 1
				key code 52 -- enter
			end tell
		end if
		
		delay 2
		
		-- Disable the password for the Screen Saver
		if not (my ScreenSaverRunning()) then
			-- method 1
			tell application "System Events" to set properties of security preferences to {require password to wake:false}
			
			--method 2
			(*
			tell application "System Events"
				tell security preferences
					activate
					set properties to {require password to wake:false}
				end tell
			end tell
			*)
			
			-- method 3
			(*
			do shell script ("defaults write ~/Library/Preferences/com.apple.screensaver.plist askForPassword -int 0")
			do shell script ("defaults write ~/Library/Preferences/com.apple.screensaver.plist askForPasswordDelay -float 0")
			*)
		end if
		
		-- Reactivate the Screen Saver at night between 20 PM and 8 AM
		if RunLaunchScreenSaverAfter8PM as boolean then
			set hour to hours of (current date)
			if hour ≥ 20 and hour ≤ 23 or hour ≥ 0 and hour < 8 then
				tell application id "com.apple.ScreenSaver.Engine" to launch
			end if
		end if
		
	on error errString number errorNumber
		log (errString)
	end try
end script

