# CoDCommands
CoCo for Call of Duty 1 v1.1 by Indy

How does it work? 

The custom version of CoDExtended communicates with the server through a callback. On say, a command will be triggered and hidden from other players if chat message begins with !.

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
