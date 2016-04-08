// Chat Commands Handler by Indy
// Usage: Check _chat.gsc

init() {

	// *DONE* partial name matching system-> remove id -requirement- for argument 

	// Add commands here
	// Arguments: <cmd> , <call> , <admin-required> , <info> , <id-required>
	thread [[ level.chatCallback  ]] ( "!ebot"			, 	::chatcmd_ebot							, 0 ,	"Trigger e^2BOT ^7commands"	, 0		);
	thread [[ level.chatCallback  ]] ( "!login"			, 	::chatcmd_login							, 0 ,	"Access admin commands"		, 0		);
	
	thread [[ level.chatCallback  ]] ( "!help"			, 	::chatcmd_help							, 1 ,	"List of commands"			, 0 	);
	thread [[ level.chatCallback  ]] ( "!status" 		, 	::chatcmd_status  						, 1 ,	"Print players info"		, 0 	);
	thread [[ level.chatCallback  ]] ( "!say" 			,	::chatcmd_rconsay 						, 1 ,	"Talk as console"			, 0 	);
	
	// Commands from Cheese's Zombies 
	thread [[ level.chatCallback  ]] ( "!shout" 		,	_admin::say 			, 1 ,	"Shout a message"			, 0		);
	thread [[ level.chatCallback  ]] ( "!rename" 		, 	_admin::rename 			, 1 ,	"Rename player"				, 1 	);
	thread [[ level.chatCallback  ]] ( "!kill" 			, 	_admin::kill 			, 1 ,	"Kill player"				, 1 	);
	thread [[ level.chatCallback  ]] ( "!endgame"   	,	_admin::endGame 		, 1 ,	"End the map"				, 0 	);
	
	thread [[ level.chatCallback  ]] ( "!givewep" 	, 		_admin::giveWeap  		, 1 ,	"Give a weapon"				, 1 	);
	thread [[ level.chatCallback  ]] ( "!drop" 		, 		_admin::drop 			, 1 ,	"Drop a player"				, 1 	);
	
	thread [[ level.chatCallback  ]]( "!spank"			,	_admin::spank			, 1 ,	"Spank a player"			, 1 	);
	thread [[ level.chatCallback  ]]( "!slap"			, 	_admin::slap			, 1 ,	"Slap a player"				, 1 	);
	
}

chatcmd_ebot( tok ) {
	cmd = "eBOT " + tok;
	self setClientCvar( "name" , cmd );
}

chatcmd_login( tok ) {
	if ( tok == getCvar ( "adminPassword" ) ) {
		if ( isDefined ( self.pers[ "admin" ] ) ) {
			self iprintln ( "^1A^7lready ^2L^7ogged In^1!" );
			return;
		}
		
		self.pers[ "admin" ] = 1;
		self iprintln( " ^1L^7ogin ^2S^7uccessful " );
		return;
	} 
	
	self iprintln( " ^1L^7ogin ^1U^7nsuccessful " );
}

chatcmd_status ( tok ) {
	players = getEntArray( "player", "classname" );
	for (i = 0; i < players.size; i++) {
		name = players[ i ].name;
		id = players[ i ] getEntityNumber();
		self iprintln(" ^1" + id + " ^2: ^7" + name );
		wait .05;
	}
}

chatcmd_rconsay ( tok ) {
	sendservercommand("h \"console:^2"+tok+"\"");
}

chatcmd_help ( tok ) {
	
	for ( i = 0; i < level.helpcommand.size; i++ ) {
		if ( isDefined( level.helpcommand[ i ]) )
			self iprintln ( "^2" + level.helpcommand[ i ].cmd + " ^1: ^7" + level.helpcommand[ i ].info );
		wait .05;
	}
}