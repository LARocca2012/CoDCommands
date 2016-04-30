
main( phase, register )
{
    codam\utils::debug( 0, "======== coco/main:: |", phase, "|", register, "|" );
    
    switch ( phase )
    {
      case "load":        _load();              break;
      case "init":        _init( register );    break;
      case "start":       _start();             break;
    }

    return;
}

_init( register )
{
    codam\utils::debug( 0, "======== coco/_init:: |", register, "|" );
    [[ register ]](       "PlayerConnect",  ::onConnect, "thread" );
    return;
}

_load()
{
    codam\utils::debug( 0, "======== coco/_load" );
    
    thread admin::init();
    level._effect[ "zombieExplo" ] = loadfx( "fx/explosions/pathfinder_explosion.efx" );
    
    return;
}

_start()
{
    codam\utils::debug( 0, "======== coco/_start" );
    
    thread chatInit();
    
    return;
}

onConnect ( a0, a1, a2, a3, a4, a5, a6, a7, a8, a9,
            b0, b1,    b2, b2,    b4, b5,    b6, b7,    b8, b9 )
{        
    wait 1;
    self thread permissions::main();
}

chatInit ( a0, a1, a2, a3, a4, a5, a6, a7, a8, a9,
            b0, b1,    b2, b2,    b4, b5,    b6, b7,    b8, b9 )
{
    wait 1;
    
    if ( getCvar( "godPassword" )== "" )
    {
        printconsole( "\n\n             -CoCo-\n -GOD PASSWORD NOT SET FOR CHAT COMMANDS-\n -MUST HAVE GOD PASSWORD SET: EXITING-\n\n" );
        level.disableCoCo = true;
        return;
    }
    
    thread callback::init();
    thread permissions::init();
}
//
///////////////////////////////////////////////////////////////////////////////