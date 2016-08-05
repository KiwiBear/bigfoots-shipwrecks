if (!isServer) exitWith {};
params[["_countWrecks",0],["_crateClaimMessageRadius",0],["_showCrateClaimMessage",false],"_markerId","_coords","_message","_markerPosition"];
for "_i" from 1 to _countWrecks do
{
	_markerId = format ["BigfootsShipwrecks_wreck_%1", _i];
	_markerPosition = getMarkerPos _markerId;

	if(!isNil "_markerPosition") then 
	{
		_isPlayerInRange = [_markerPosition, _crateClaimMessageRadius] call ExileClient_util_world_isAlivePlayerInRange;

		if (_isPlayerInRange) then 
		{
			format["Crate found by players at [%1].", _markerPosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

			deleteMarker _markerId;

			if (_showCrateClaimMessage) then 
			{
				_coords = mapGridPosition _markerPosition;
				_message = format ["Players are escaping with the underwater loot crate from coordinates %1. Take it from them!", _coords];

				["Info", "Shipwreck loot found!", _message] call ExileServer_BigfootsShipwrecks_sendClientNotificationCommand;
				["systemChatRequest", [_message]] call ExileServer_system_network_send_broadcast;
			};	
		};
	};
};						