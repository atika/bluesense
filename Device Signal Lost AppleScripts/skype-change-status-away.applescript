(*
BlueSense AppleScript
Examples of AppleScript script to control Mac OS X that can be used with BlueSense for Mac (Bluetooth device detection).
https://apps.inspira.io/bluesense/en/
*)
-- SKYPE APPLICATION APPLESCRIPT
-- Change the Skype status to AWAY if ONLINE
------------------------------------------------------------------------
script SkypeStatusAway
    try
        tell application "System Events"
            if (exists process "Skype") then
                tell application "Skype"
                    send command "GET USERSTATUS" script name "BlueSense"
                    set lestatut to the result
                    if lestatut is "USERSTATUS ONLINE" then
                        send command "SET USERSTATUS AWAY" script name "BlueSense"
                    end if
                end tell
            end if
        end tell
    on error errString number errorNumber
        log (errString)
    end try
end script