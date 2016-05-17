(*
BlueSense AppleScript
Examples of AppleScript script to control Mac OS X that can be used with BlueSense for Mac (Bluetooth device detection).
https://apps.inspira.io/bluesense/en/
*)
-- Get the short username (name of your home folder)
on getUsername()
	-- tell application "System Events" to return the name of current user
	short user name of (system info)
end getUsername