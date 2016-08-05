/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */

"PostInit started..." call ExileServer_BigfootsShipwrecks_util_logCommand;

BS_debug_logCrateFill = ((getNumber(_config >> "BS_debug_logCrateFill")) isEqualTo 1);
BS_player_showCrateClaimMessage = ((getNumber(_config >> "BS_player_showCrateClaimMessage")) isEqualTo 1);
BS_player_showCrateClaimMessageRadius = getNumber(_config >> "BS_player_showCrateClaimMessageRadius");
BS_class_crate = getText(_config >> "BS_class_crate");
BS_class_wreckage = getText(_config >> "BS_class_wreckage");
BS_count_shipwrecks = getNumber(_config >> "BS_count_shipwrecks");
BS_locations_crateWreckOffset = getNumber(_config >> "BS_locations_crateWreckOffset")
BS_locations_center = getArray(_config >> "BS_locations_center")
BS_locations_distance_min = getNumber(_config >> "BS_locations_distance_min");
BS_locations_distance_max = getNumber(_config >> "BS_locations_distance_max");
BS_loot_enablePoptabs = ((getNumber(_config >> "BS_loot_enablePoptabs")) isEqualTo 1);
BS_loot_count_poptabs_seed = getArray(_config >> "BS_loot_count_poptabs_seed")
BS_loot_itemCargo = getArray(_config >> "BS_loot_itemCargo");

publicVariable "BS_debug_logCrateFill";
publicVariable "BS_player_showCrateClaimMessage";
publicVariable "BS_player_showCrateClaimMessageRadius";
publicVariable "BS_class_crate";
publicVariable "BS_class_wreckage";
publicVariable "BS_count_shipwrecks";
publicVariable "BS_locations_crateWreckOffset";
publicVariable "BS_locations_center";
publicVariable "BS_locations_distance_min";
publicVariable "BS_locations_distance_max";
publicVariable "BS_loot_enablePoptabs";
publicVariable "BS_loot_count_poptabs_seed";
publicVariable "BS_loot_itemCargo";

[] call ExileServer_BigfootsShipwrecks_initialize;

"PostInit finished" call ExileServer_BigfootsShipwrecks_util_logCommand;