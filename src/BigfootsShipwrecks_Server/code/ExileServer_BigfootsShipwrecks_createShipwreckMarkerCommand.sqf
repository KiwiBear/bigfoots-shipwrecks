/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */
 
params [["_markerId",0],["_markerPosition",[]],["_markerText",""],"_marker"];

_marker = createMarker [_markerId, _markerPosition];
_marker setMarkerType "ExileBoatTraderIcon";