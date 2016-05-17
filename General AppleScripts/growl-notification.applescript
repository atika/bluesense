(*
BlueSense AppleScript
Examples of AppleScript script to control Mac OS X that can be used with BlueSense for Mac (Bluetooth device detection).
https://apps.inspira.io/bluesense/en/
*)

-- Send a notification with Growl
-- Download and install Growl Notify here : http://growl.info/downloads

on growl(title, message)
	try
		do shell script ("now=$(date +'%H:%M:%S'); /usr/local/bin/growlnotify --appIcon '/Applications/BlueSense.app' --name BlueSense --noteName '" & title & "' -s --message \"$now " & message & "\"")
	end try
end growl


growl("Device Detected", "BlueSense detected the device !")