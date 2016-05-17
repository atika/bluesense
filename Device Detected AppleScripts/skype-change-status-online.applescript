(*
BlueSense AppleScript
Examples of AppleScript script to control Mac OS X that can be used with BlueSense for Mac (Bluetooth device detection).
https://apps.inspira.io/bluesense/en/
*)

-- SKYPE APPLICATION APPLESCRIPT
-- Change the skype status to ONLINE if AWAY
------------------------------------------------------------------------
script SkypeStatusOnline
    try
        tell application "System Events"
            if (exists process "Skype") then
                tell application "Skype"
                    send command "GET USERSTATUS" script name "BlueSense"
                    set lestatut to the result
                    if lestatut is "USERSTATUS AWAY" then
                        send command "SET USERSTATUS ONLINE" script name "BlueSense"
                    end if
                end tell
            end if
        end tell
    on error errString number errorNumber
        log (errString)
    end try
end script
