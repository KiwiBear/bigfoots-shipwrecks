/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */
 
if (!isServer) exitWith {};

params[["_wreckId",0],["_crate",objNull],["_cargoItems",[]],["_enableCrateFillDebug",false],"_actualCount", "_actualAdditionalCount","_cargoItems","_chance","_class","_count","_minCount","_possibleAdditionalCount"];

{
    _x params [["_class",""],["_minCount",0],["_possibleAdditionalCount",0],["_chance",0]];

    if (_chance > random 100) then 
    {
        if (typeName _class == "ARRAY") then
        {
            _class = selectRandom _class;
        };

        _actualAdditionalCount = floor(random (_possibleAdditionalCount + 1));
        _actualCount = _minCount + _actualAdditionalCount;
        _crate addItemCargoGlobal [_class, _actualCount];

        if (_enableCrateFillDebug) then 
        {
            format["Added [%1] [%2] to crate [%3].", _actualCount, _class, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
        };
    };
} foreach _cargoItems;  