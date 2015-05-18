# Disable ScreenSaver Password
# You have to compile and install SleepDisplay, a Mac OS X Program to manage the display sleep : https://github.com/kimhunter/SleepDisplay
# Don't deactivate the screensaver/session password without entered the password before, Mac OS X window will stay freezed and you will have to force reboot.
# Use the script to get the password from the keychain or put it in clear (not recommanded)
# 1. It wakes the display (the script does'nt work if the display is sleeping)
# 2. It hits a key (arrow down), if the screen saver is still open, it means that OSX prompts for the password.
# 3. If Yes, it enters the password on the screensaver prompt
# 4. It disables the screen saver password

script DisableScreenSaverPassword
	on ScreenSaverRunning()
		tell application "System Events" to return (count of (every process whose bundle identifier is "com.apple.ScreenSaver.Engine")) > 0
	end ScreenSaverRunning
	
	on ScreenIsLocked()
		# http://stackoverflow.com/questions/11505255/osx-check-if-the-screen-is-locked
		return (do shell script ("python -c 'import sys,Quartz; d=Quartz.CGSessionCopyCurrentDictionary(); print d.get(\"CGSSessionScreenIsLocked\", 0);'")) > 0
	end ScreenIsLocked
	
	# Put the password in clear or put in the keychain
	set my_password to getPassword("PassKeychainName")
	
	# Wake up the display
	# https://github.com/kimhunter/SleepDisplay
	do shell script ("/usr/local/bin/SleepDisplay -wake")
	delay 3
	
	# Enter Screensaver Password
	tell application "System Events" to key code 125 --key down
	delay 2
	
	if (my ScreenSaverRunning()) or (my ScreenIsLocked()) then
		# Screen Saver is running after key press or screen is locked ??? -> password prompt
		tell application "System Events"
			keystroke my_password --password
			delay 1
			key code 52 -- enter
		end tell
	end if
	
	delay 2
	
	if not (my ScreenSaverRunning()) then
		tell application "System Events"
			tell security preferences
				activate
				set properties to {require password to wake:false}
			end tell
		end tell
	end if
end script
