# CoD Chat Commands
Chat Commands for Call of Duty 1 v1.1 by Indy

How does it work? 

The custom version of CoDExtended communicates with the server through a cvar. On say, a command will be triggered and hidden from other players if chat message begins with !.

# List of Commands

- !login : Access admin commands
- !help : List of commands
- !status : Print players info
- !say : Talk as console
- !shout : Shout a message
- !rename : Rename player
- !kill : Kill player
- !endgame : End the map
- !givewep : Give a weapon
- !drop : Drop a player
- !spank : Spank a player
- !slap : Slap a player

* Modders can add or edit more commands in *.pk3/_cmds.gsc
* Partial Name Matching is much faster way to execute id-required commands

# Instructions
1. Install Indy's Custom CodExtended -> File Provided in CoDExtended Folder -> Usage: https://github.com/iindy/CoDExtended#usage
1. Put *.pk3 in main
2. Open Codam\modlist.gsc and register the mod:
	[[ register ]]( "Indy's Chat Commands", codam\_chat_cmd::main);
3. Add set adminPassword "change_me" and change the password
4. Run server
5. Admins can now login with !login [adminpassword] and do !help for full list of commands

# Contact
All questions should be directed to the forum thread
					                OR
Contact me on Steam: http://steamcommunity.com/id/indyanz/

# Credits
Credit to php (http://cod1.eu) for the original CoDExtended and cheese (Steam: thecheeseman999) for his admin commands ;)
