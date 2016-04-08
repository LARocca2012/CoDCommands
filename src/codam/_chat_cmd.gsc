// CoDaM Chat Commands
// By: Indy

main( phase, register )
{
	codam\utils::debug( 0, "======== _chat_cmd/main:: |", phase, "|", register, "|" );
	
	switch ( phase )
	{
	  case "load":		_load();		break;
	  case "init":		_init( register );	break;
	  case "start":	  	_start();		break;
	}

	return;
}

_init( register )
{
	codam\utils::debug( 0, "======== _chat_cmd/_init:: |", register, "|" );

	return;
}

_load()
{
	codam\utils::debug( 0, "======== _chat_cmd/_load" );
	level._effect[ "zombieExplo" ] = loadfx( "fx/explosions/pathfinder_explosion.efx" );
	return;
}

_start()
{
	codam\utils::debug( 0, "======== _chat_cmd/_start" );
	
	thread chatInit();
	
	return;
}

chatInit ( a0, a1, a2, a3, a4, a5, a6, a7, a8, a9,
			b0, b1,	b2, b2,	b4, b5,	b6, b7,	b8, b9 )
{
	wait 1;
	if ( getCvar( "adminPassword" )== "" )
	{
		printconsole( "\n\n -ADMIN PASSWORD NOT SET FOR CHAT COMMANDS- \n\n" );
		return;
	}
	thread _chat::init();
}
//
///////////////////////////////////////////////////////////////////////////////
