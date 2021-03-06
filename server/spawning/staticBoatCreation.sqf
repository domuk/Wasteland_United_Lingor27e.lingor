//	@file Version: 1.0
//	@file Name: staticboatCreation.sqf
//	@file Author: [404] Costlyy
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static boats
//	@file Args: [int (0 = not wreck | 1 = wreck), array (position)]

if(!X_Server) exitWith {};

private["_spawnPos", "_spawnType", "_currboat"];

_isWreck = _this select 0;
_spawnPos = _this select 1;

if (_isWreck == 0) then {
	//diag_log "Spawning boat complete...";
	_spawnType = staticBoatList select (random (count staticBoatList - 1));
	_currboat = createVehicle [_spawnType,_spawnPos,[], 50,"None"]; 
	
	_currboat setpos [getpos _currboat select 0,getpos _currboat select 1,0];
	
	clearMagazineCargoGlobal _currboat;
	clearWeaponCargoGlobal _currboat;
	
	//Set original status to stop ner-do-wells
	_currboat setVariable["original",1,true];
} else {
	//diag_log "Spawning boat wreck...";
	_spawnType = staticBoatList select (random (count staticBoatList - 1));
	_currboat = createVehicle [_spawnType,_spawnPos,[], 50,"None"]; 
	
	_currboat setpos [getpos _currboat select 0,getpos _currboat select 1,0];
	
	clearMagazineCargoGlobal _currboat;
	clearWeaponCargoGlobal _currboat;
	
	//Set original status to stop ner-do-wells
	_currboat setVariable["original",1,true];
    
    _currboat setDamage 1; // Destroy this boat on the spot so it looks like a realistic crash.
};