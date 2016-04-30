# CoDCommands
CoCo for Call of Duty 1 v1.1 by Indy

How does it work? 

The custom version of CoDExtended communicates with the server through a callback. On say, a command will be triggered and hidden from other players if chat message begins with !.

# Updates
Update v2.2:
- Added CoDaM PowerServer Commands-> check list of commands for usage
- Custom bot name and message color cvars added -> check CoCo.cfg
- Fixed !suffix duplication and now clears previous suffix for player every time on use
- Added Custom/Default gametype support ( Non-CoDaM )
- Tidied up some code
- Added Cheese's permission flag system to Permissions.gsc

Update v2.1:
- Added !suffix <reset|custom> -> Toggle ( just !suffix ) or change your suffix ( only for Admins+ )
- Fixed major crash with CoDExtended
- Logins save over rounds, maps, and reconnects! 
- Better handling of missing passwords -> it will still hide messages starting with ! for password protection and security measures
- Other bug fixes

Update v2.0
- Permissions
- Groups ( Guest, VIP, Moderator, Admin, God )
- New Commands ( aliases, player mute, private messagin, poke, change map... and plenty more )
- Updated CoDExtended ( Stable v20 )
- Suffixes-> groups get suffixes at end of their message
- Bug fixes and other random stuff

# List of Commands

Guest Commands
- !login        
- !help        
- !alias      
- !tell      
- !reply      
- !name 

VIP Commands      
- !fuck       
- !poke       
- !trout       
- !rainbow 

Mod Commands
- !status
- !mute
- !unmute
- !warn

Admin Commands
- !say
- !shout       
- !slap        
- !spank          
- !kick      
- !kill            
- !endgame 
- !forcespec   
- !giveweap   
- !drop
- !blind
- !runover
- !squash
- !insult
- !rape
- !restart
- !map

God Commands 
- !resetlogins 
- !resetplayer 
- !resetgroup 

* Modders can add or edit more commands in pk3/_cmds.gsc
* Partial Name Matching is much faster way to execute id-required commands

# Instructions
1. Install Custom CodExtended -> Provided with download in CoDExtended/codextended.so
        Instructions: https://github.com/iindy/CoDExtended#usage
1. Put __CoDaM_CoDCommands.pk3 in main
2. Open Codam\modlist.gsc and register the mod:
	[[ register ]]( "CoCo - CodCommands - Indy", codam\coco::main);
3. Add exec CoCo.cfg in "dedicated.cfg" and CHANGE THE PASSWORDS!
4. Run server- distribute appropriate passwords to group members
5. Groups can now login with !login [groupPassword] and do !help for full list of commands

# Contact
All questions should be directed to the forum thread
					                OR
Contact me on Steam: http://steamcommunity.com/id/indyanz/

# Credits
Credit to php (http://cod1.eu) for the original CoDExtended and cheese (Steam: thecheeseman999) for his admin commands ;)
