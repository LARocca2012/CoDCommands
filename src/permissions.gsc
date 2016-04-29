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

/* Modified for CoCo */
init() {

    level.permissions = [];
    
    // cvar names increasing in permission levels
    level.permission_ips = "0 vipIP modIP adminIP godIP";
    level.permission_pws = "0 vipPassword modPassword adminPassword godPassword";
    
    addPermissionSlot( 0, "guest", ::guest );
    addPermissionSlot( 1, "vip",   ::vip   );
    addPermissionSlot( 2, "mod",   ::mod   );
    addPermissionSlot( 3, "admin", ::admin );
    addPermissionSlot( 4, "god",   ::god   );
    
}

addPermissionSlot( id, name, call ) {
    p = spawnstruct();
    p.id = id;
    p.name = name;
    p.call = call;
    p.permissions = [];

    level.permissions[ id ] = p;
}

Array ( str ) {
    return utilities::explode( str, " " );
}

main() {
    if ( !isDefined( self.pers["suffix"] ) )
        self.pers["suffix"] = "";
    if ( !isDefined( self.pers["muted"] ) )
        self.pers["muted"] = 0;
    if ( !isDefined( self.pers["permissions"] ) )
        self.pers["permissions"] = 0;
    
    ips = Array( level.permission_ips );

    for ( i = 1; i < ips.size; i++ ) {
        cvar = getCvar( ips[ i ] );
        newCvar = "";
        if ( cvar == "" )
            continue;

        // check for multiple admins
        if ( callback::contains( cvar, " " ) )
            admins = callback::StTok( cvar, " " );
        else
            admins[ 0 ] = cvar;

        for (k = 0; k < admins.size; k++ ) {
            if ( self getIP() == admins[ k ] ) {
                self.pers["permissions"] = i;
                self.pers["suffix"] = getSuffix( i );
                break;
            }
            wait .05;
        }
        
    }

}

getSuffix( id ) {
    suffixCvar = getCvar( "customSuffix" );
    
    if ( suffixCvar != "" ) {
        if ( utilities::contains( suffixCvar, " " ) )
            customs = utilities::explode( suffixCvar, " " );
        else
            customs[ 0 ] = suffixCvar;
            
        for (i = 0; i < customs.size; i++ ) {
            key = utilities::explode( customs[ i ], ";" );
            if ( self getIP() == key[ 0 ] ) {
                suffix = key[ 1 ];
                break;
            }
            wait .05;
        }
        
        if ( isDefined( suffix ) )
            return suffix;
    }
    // default suffix
    cvar = level.permissions[ id ].name + "Suffix";
    return getCvar( cvar );
}

guest() {

}

// updates ip cvars for permission checks

vip() {
    self.pers["suffix"] =  getCvar("vipSuffix");
    vip = getCvar( "vipIP" );
    newCvar = vip + " " + self getIP();

    if ( vip == "" )
        newCvar = self getIP();
    setCvar( "vipIP", newCvar );
}

mod() {
    self.pers["suffix"] = getCvar( "modSuffix" );
    mod = getCvar( "modIP" );
    newCvar = mod + " " + self getIP();

    if ( mod == "" )
        newCvar = self getIP();
    setCvar( "modIP", newCvar );
}

admin() {
    self.pers["suffix"] = getCvar( "adminSuffix" );
    admins = getCvar( "adminIP" );
    newCvar = admins + " " + self getIP();

    if ( admins == "" )
        newCvar = self getIP();
    setCvar("adminIP", newCvar);
}

god() {
    self.pers["suffix"] = getCvar( "godSuffix" );
    god = getCvar( "godIP" );
    newCvar = god + " " + self getIP();

    if ( god == "" )
        newCvar = self getIP();
    setCvar( "godIP", newCvar );
}
