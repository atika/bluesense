# Close the current Mac OSX Session
# /!\ I don't recommand to use this script because if the signal of your device is lost by the app, you will be ejected from your session even If you are working on something...

script DisconnectSession
	try
		do shell script ("/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -suspend")
	end try
end script