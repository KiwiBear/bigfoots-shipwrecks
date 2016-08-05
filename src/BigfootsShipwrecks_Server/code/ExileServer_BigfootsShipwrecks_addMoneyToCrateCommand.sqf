/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */
 
if (!isServer) exitWith {};

params [["_wreckId",0],["_create",objNull],["_randomDistributionSeed",0],["_enableCrateFillDebug",false],"_countPoptabs"];

_countPoptabs = floor(random _randomDistributionSeed);
_crate setVariable ["ExileMoney", _countPoptabs, true];

if (_enableCrateFillDebug) then 
{
    format["Added [%1] poptabs to crate [%2].", _countPoptabs, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
};
