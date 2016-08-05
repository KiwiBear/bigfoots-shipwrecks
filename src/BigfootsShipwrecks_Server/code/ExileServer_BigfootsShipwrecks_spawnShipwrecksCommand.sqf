if (!isServer) exitWith {};
"Starting shipwreck spawns..." call ExileServer_BigfootsShipwrecks_util_logCommand;

params [["_wreckCount",0],["_positioning",[]],["_wreckageClass",""],["_crateClass",""],["_crateCargo",[]],["_crateCountPoptabsSeed",0],["_isDebugFillLogEnabled",false],"_crate","_wreckage","_wreckId","_wreckagePosition"];
_positioning params[["_spawnCenter",[]],["_minDistance",0],["_maxDistance",[]]];

for "_i" from 1 to _wreckCount do
{   
    // Find location
    _wreckagePosition = [_spawnCenter, _minDistance, _maxDistance, 1, 2, 800, 0] call BIS_fnc_findSafePos; 

    format["Found position at [%1] for wreck.", _wreckagePosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

    // Create ID for this wreck
    _wreckId = format ["BigfootsShipwrecks_wreck_%1", _i];

    // Create a marker
    [_wreckId, _wreckagePosition, "Shipwrecked loot crate"] call ExileServer_BigfootsShipwrecks_createShipwreckMarkerCommand;
    
    format["Spawning wreck and crate near [%1] with id [%2].", _wreckagePosition, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
    
    // Create wreck
    _wreckage = _wreckageClass createVehicle _wreckagePosition;
 
    // Create crate nearby
    _cratePosition = _wreckage getRelPos [10, 0];
    _crate = _crateClass createVehicle _cratePosition;    
    _crate call ExileServer_BigfootsShipwrecks_setupCrateCommand;

    // Put cargo in crate
    [_wreckId, _crate, _crateCargo, _isDebugFillLogEnabled] call ExileServer_BigfootsShipwrecks_addItemsToCrateCommand;

    // Put money in crate
    [_wreckId, _crate, _crateCountPoptabsSeed, _isDebugFillLogEnabled] call ExileServer_BigfootsShipwrecks_addMoneyToCrateCommand;
};

"Finished shipwreck spawns." call ExileServer_BigfootsShipwrecks_util_logCommand;   