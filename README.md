# CoDCommands
**_CoCo_ for Call of Duty 1 v1.1**

_CoCo_ provides in-game commands to servers with a way to execute commands through chat. It further expands on user and group permissions allowing admins to have a greater and a safer control over their servers.

## Features
- In Game Commands: no more having to look through Rcontool to execute commands!
- Permissions for users
- Multiple Groups: Guest, VIP, Moderator, Admin, God
- Partial Name Matching: for commands that require ID input, admins can insert a part of target's name instead of ID!
- Safer servers: by seperating rcon and admin passwords, server owners can safely share their adminPassword to those they trust
- Updated CoDExtended ( Stable v20 )
- Suffixes for groups 
- CoDaM and custom gametype compatibility
- Customizable: Wide array of cvars to edit-> Modders can even add custom commands to fit their needs; possibilities are endless :smirk:

## Updates
**Update v2.3** ( 05-01-16 ):
- New way to login! If enabled, each group member will have a custom password that is set in config file: !login [user] [password].
- New cvars to disable command or change the permission of a command: set coco_disable_<command> and set coco_permission_<command>
- Now removes whitespace before chat commands to avoid accidental login leaks
- Fixed chat commands not executing during map/round intermission
- A better way to add custom commands: check instructions for more info!
- Modified !spectate to use CoDaM's spectator callback
- Fixed default suffix not carrying over to next map
- Cleaned up CoCo.cfg

**Update v2.2** ( 04-30-16 ):
- Added CoDaM PowerServer Commands-> check list of commands for usage
- Custom bot name and message color cvars added -> check CoCo.cfg
- Fixed !suffix duplication and now clears previous suffix for player every time on use
- Added Custom/Default gametype support ( Non-CoDaM )
- Tidied up some code
- Added Cheese's permission flag system to Permissions.gsc
- Added cvar for chat delay-> change how long before another command by same player is executed!

**Update v2.1** ( 04-29-16 ):
- Added !suffix <reset|custom> -> Toggle ( just !suffix ) or change your suffix ( only for Admins+ )
- Fixed major crash with CoDExtended
- Logins save over rounds, maps, and reconnects! 
- Better handling of missing passwords -> it will still hide messages starting with ! for password protection and security measures
- Other bug fixes

**Update v2.0** ( 04-27-16 ):
- Permissions
- Groups ( Guest, VIP, Moderator, Admin, God )
- New Commands ( aliases, player mute, private messagin, poke, change map... and plenty more )
- Updated CoDExtended ( Stable v20 )
- Suffixes-> groups get suffixes at end of their message
- Bug fixes and other random stuff

## Instructions for CoDaM
1. Install Custom CodExtended -> Provided with download in CoDExtended/codextended.so
        Instructions: [CoDExtended Usage](https://github.com/iindy/CoDExtended#usage)
2. Put __CoDaM_CoDCommands.pk3 in main
3. Open Codam\modlist.gsc and register the mod:
`
	[[ register ]]( "CoCo - CodCommands - Indy", codam\coco::main);
`
4. _[OPTIONAL]_ Adding new commands:
   * Follow instructions in `custom\commands.gsc`
5. Add `exec CoCo.cfg` in `dedicated.cfg` and modify the CoCo config file to your liking!
6. Run server- distribute appropriate passwords to group members
7. Groups and Members can now login with !login

## Instructions for custom gametypes
1. Install Custom CodExtended -> Provided with download in CoDExtended/codextended.so
        Instructions: [CoDExtended Usage](https://github.com/iindy/CoDExtended#usage)
2. Put __CoDaM_CoDCommands.pk3 in main
3. Registering:
   * Call on `custom\coco::init()` from gametype's `main()`
   * Call on `custom\coco::onConnect()` from gametype's `playerConnect()`
4. Adding new commands:
   * Follow instructions in custom\commands.gsc
5. Add exec CoCo.cfg in "dedicated.cfg" and modify the CoCo config file to your liking!
6. Run server- distribute appropriate passwords to group members
7. Groups and Members can now login with !login

## Contact
All questions should be directed to the forum thread
					                OR
Contact me on Steam: http://steamcommunity.com/id/indyanz/

## List of Commands

**Guest Commands**
- !login        
- !help        
- !alias      
- !tell      
- !reply      
- !name 

**VIP Commands**      
- !fuck       
- !poke       
- !trout       
- !rainbow 

**Mod Commands**
- !status
- !mute
- !unmute
- !warn

**Admin Commands**
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
- !noclan
- !swapteams
- !swapclans
- !axisclan
- !alliedclan
- !disarm
- !matrix
- !force
- !forcespec
- !burn
- !explode
- !mortar
- !cow
- !teamlock
- !teamunlock
- !matchsetup
- !matchstart
- !matchstop
- !forcevote

**God Commands** 
- !resetlogins 
- !resetplayer 
- !resetgroup 

## Credits
Credit to php (http://cod1.eu) for the original CoDExtended and cheese (Steam: thecheeseman999) for his admin commands ;)