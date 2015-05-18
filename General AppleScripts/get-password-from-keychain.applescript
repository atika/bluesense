

on getPassword(keychainItemName)
	set my_password to do shell script ("security 2>&1 >/dev/null find-generic-password -gl " & quoted form of keychainItemName & " | cut -c 11-99 | sed 's/\"//g'")
end getPassword

set my_password to getPassword("PassKeychainName")