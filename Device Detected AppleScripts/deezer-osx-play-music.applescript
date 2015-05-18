
# Play music if Deezer for Mac is running.
script playDeezer
	tell application "System Events"
		set runningDeezer to processes whose bundle identifier is "com.deezer.Deezer"
	end tell
	
	if runningDeezer is not {} then
		tell application "Deezer" to play
	end if
end script