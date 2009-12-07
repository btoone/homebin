-- AUTHOR:		Brandon Toone
-- DATE:		2009.11.22
-- DESCRIPTION:	Relaunches the Finder and Dock
-- 				Changing from cinema display to laptop causes problems with spaces and desktop icons.  Relaunching fixes

do shell script "killall Dock"
do shell script "killall Finder"

-- alternate way of relaunching.  Not sure if it's as effective as the kilall
(*
tell app "Dock"
	activate
end tell
*)

-- This could also be a shell script using:
-- killall Dock
-- killall Finder
-- Or ..
-- osascript -e "tell app "dock" to activate