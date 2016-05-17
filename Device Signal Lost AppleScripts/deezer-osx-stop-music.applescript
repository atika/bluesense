(*
BlueSense AppleScript
Examples of AppleScript script to control Mac OS X that can be used with BlueSense for Mac (Bluetooth device detection).
https://apps.inspira.io/bluesense/en/
*)

-- DEEZER APPLICATION APPLESCRIPT
-- Pause the music if Deezer for Mac is running.
------------------------------------------------------------------------
script DeezerPlayPause
	try
		tell application "System Events"
			activate
			set runningApp to processes whose bundle identifier is "com.deezer.Deezer"
		end tell
		
		if runningApp is not {} then
			tell application "Deezer" to pause
		end if
	on error errString number errorNumber
		log (errString)
	end try
end script