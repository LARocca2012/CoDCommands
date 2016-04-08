/*
    Zombies, Version 5, Revision 13
    Copyright (C) 2016, DJ Hepburn

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


/*
	Edited for CoDaM and Chat Commands
	- Indy
*/

endGame( value )
{
	iprintln("^2Admin has ended map");
	wait 2;
	level notify( "end_map" );
}

kill( value )
{
	player = getPlayerByID( value );
	
	if ( isDefined( player ) )
	{
		player suicide();
		playFx( level._effect[ "zombieExplo" ], player.origin );
		
		iPrintLn( "^3The Admin killed ^7" + player.name + "^3!" );
	}
}

giveWeap( value )
{
	array = explode( value, " " );
	
	if ( !isDefined( array[ 0 ] ) || !isDefined( array[ 1 ] ) )
		return;
		
	player = getPlayerByID( array[ 0 ] );
	weapon = array[ 1 ];
	slot = "primaryb";
	
	if ( isDefined( array[ 2 ] ) )
		slot = array[ 2 ];
		
	player setWeaponSlotWeapon( slot, weapon );
	player setWeaponSlotAmmo( slot, 9999 );
	player switchToWeapon( weapon );
}

say( value )
{
	iPrintLnBold( value );
}

drop( value )
{
	array = explode( value, " " );
	height = 512;
	
	if ( !isDefined( array[ 0 ] ) )
		return;
		
	if ( isDefined( array[ 1 ] ) )
	{
		height = atoi( array[ 1 ] );
		if ( !isDefined ( height ) )
		{
			self iprintln( "^1I^7nvalid Height^1!" );
			return;
		}
	}
	
	player = getPlayerByID( array[ 0 ] );
	
	if ( isDefined( player ) )
	{
		player endon( "disconnect" );
		
		player.drop = spawn( "script_origin", player.origin );
		player linkto( player.drop );
		
		player.drop movez( height, 2 );
		wait 2;
		player unlink();
		player.drop delete();
		
		iPrintLn( "^3The admin DROPPED ^7" + player.name + "^3!" );
	}
}

spank( value )
{
	array = explode( value, " " );
	time = 30;
	
	if ( !isDefined( array[ 0 ] ) )
		return;
		
	if ( isDefined( array[ 1 ] ) )
	{
		time = atoi( array[ 1 ] );
		if ( !isDefined ( time ) )
		{
			self iprintln( "^1I^7nvalid Time^1!" );
			return;
		}
	}
		
	player = getPlayerByID( array[ 0 ] );

	if ( isDefined( player ) )
	{	
		iPrintLn( "^3The admin SPANKED ^7" + player.name + "^3!" );
			
		player shellshock( "default", time / 2 );
		for( i = 0; i < time; i++ )
		{
			player playSound( "melee_hit" );
			player setClientCvar( "cl_stance", 2 );
			wait randomFloat( 0.5 );
		}
		player shellshock( "default", 1 );
	}
}

slap( value )
{
	array = explode( value, " " );
	dmg = 10;
	
	if ( !isDefined( array[ 0 ] ) )
		return;
	
	if ( isDefined( array[ 1 ] ) )
	{
		dmg = atoi( array[ 1 ] );
		if ( !isDefined ( dmg ) )
		{
			self iprintln( "^1I^7nvalid Damage Value^1!" );
			return;
		}
	}
	
	player = getPlayerByID( array[ 0 ] );

	if ( isDefined( player ) )
	{
		eInflictor = player;
		eAttacker = player;
		iDamage = dmg;
		iDFlags = 0;
		sMeansOfDeath = "MOD_PROJECTILE";
		sWeapon = "panzerfaust_mp";
		vPoint = ( player.origin + ( 0, 0, -1 ) );
		vDir = vectorNormalize( player.origin - vPoint );
		sHitLoc = "none";
		psOffsetTime = 0;

		player playSound( "melee_hit" );
		player finishPlayerDamage( eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime );
		
		iPrintLn( "^3The admin SLAPPED ^7" + player.name + "^7!" );
	}
}

rename( value )
{
	array = explode( value, " " );

	if ( !isDefined( array[ 0 ] ) && !isDefined( array[ 1 ] ) )
		return;
		
	player = getPlayerByID( array[ 0 ] );
	
	if ( isDefined( player ) )
	{
		newname = "";
		for ( i = 1; i < 10; i++ )
		{
			if ( isDefined( array[ i ] ) )
			{
				newname += " ";
				newname += array[ i ];
			}
		}
		
		player setClientCvar( "name", newname );
	}
}

atoi( sString ) {
    sString = strreplacer( sString, "numeric" );
    if ( sString == "" )
        return undefined;
    return (int)sString;
}

strreplacer( sString, sType ) {
    switch ( sType ) {
        case "lower":
            out = "abcdefghijklmnopqrstuvwxyz";
            in = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            bIgnoreExtraChars = false;
            break;
        case "upper":
            in = "abcdefghijklmnopqrstuvwxyz";
            out = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            bIgnoreExtraChars = false;
            break;
        case "numeric":
            in = "0123456789.-";
            out = "0123456789.-";
            bIgnoreExtraChars = true;
            break;
        case "vector":
            in = "0123456789.-,()";
            out = "0123456789.-,()";
            bIgnoreExtraChars = true;
            break;
        default:
            return sString;
            break;
    }
        
    sOut = "";
    for ( i = 0; i < sString.size; i++ ) {
        bFound = false;
        cChar = sString[ i ];
        for ( j = 0; j < in.size; j++ ) {
            if ( in[ j ] == cChar ) {
                sOut += out[ j ];
                bFound = true;
                break;
            }
        }
        
        if ( !bFound && !bIgnoreExtraChars )
            sOut += cChar;
    }
    
    return sOut;
}


getPlayerByID( iID )
{
	eGuy = undefined;
	ePlayers = getEntArray( "player", "classname" );
	for ( i = 0; i < ePlayers.size; i++ )
	{
		if ( !isPlayer( ePlayers[ i ] ) )
			continue;

		if ( ePlayers[ i ] getEntityNumber() == iID )
		{
			eGuy = ePlayers[ i ];
			break;
		}
	}
			
	return eGuy;
}

explode( s, delimiter )
{
	j = 0;
	temparr[ j ] = "";	

	for ( i = 0; i < s.size; i++ )
	{
		if ( s[ i ] == delimiter )
		{
			j++;
			temparr[ j ] = "";
		}
		else
			temparr[ j ] += s[i];
	}
	return temparr;
}

monotone( str )
{
	if ( !isdefined( str ) || ( str == "" ) )
		return ( "" );

	_s = "";

	_colorCheck = false;
	for ( i = 0; i < str.size; i++ )
	{
		ch = str[ i ];
		if ( _colorCheck )
		{
			_colorCheck = false;

			switch ( ch )
			{
			  case "0":
			  case "1":
			  case "2":
			  case "3":
			  case "4":
			  case "5":
			  case "6":
			  case "7":
			  	break;
			  default:
			  	_s += ( "^" + ch );
			  	break;
			}
		}
		else
		if ( ch == "^" )
			_colorCheck = true;
		else
			_s += ch;
	}

	return ( _s );
}