/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */

"Starting initialization..." call ExileServer_BigfootsShipwrecks_util_logCommand;
_config = configFile >> "BigfootsShipwrecks_Config";
BS_debug_logCrateFill = ((getNumber(_config >> "BS_debug_logCrateFill")) isEqualTo 1);
BS_player_showCrateClaimMessage = ((getNumber(_config >> "BS_player_showCrateClaimMessage")) isEqualTo 1);
BS_player_showCrateClaimMessageRadius = getNumber(_config >> "BS_player_showCrateClaimMessageRadius");
BS_class_crate = getText(_config >> "BS_class_crate");
BS_class_wreckage = getText(_config >> "BS_class_wreckage");
BS_count_shipwrecks = getNumber(_config >> "BS_count_shipwrecks");
BS_locations_crateWreckOffset = getNumber(_config >> "BS_locations_crateWreckOffset");
BS_locations_center = getArray(_config >> "BS_locations_center");
BS_locations_distance_min = getNumber(_config >> "BS_locations_distance_min");
BS_locations_distance_max = getNumber(_config >> "BS_locations_distance_max");
BS_loot_enablePoptabs = ((getNumber(_config >> "BS_loot_enablePoptabs")) isEqualTo 1);
BS_loot_count_poptabs_seed = getArray(_config >> "BS_loot_count_poptabs_seed");
BS_loot_itemCargo = getArray(_config >> "BS_loot_itemCargo");

// Spawns shipwrecks with loot crates at server start
[
    BS_count_shipwrecks, // Wreck count
    [ // Positioning (center, min, max)
        BS_locations_center,
        BS_locations_distance_min,
        BS_locations_distance_max
    ], 
    BS_class_wreckage, // Wreckage class
    BS_class_crate, // Crate class
    BS_loot_itemCargo, // Crate cargo
    BS_loot_count_poptabs_seed, // Crate poptabs seed (generated random poptab amount)
    BS_debug_logCrateFill // Enable logging of items added to crate (true/false)
] call ExileServer_BigfootsShipwrecks_spawnShipwrecksCommand;

[
    10, 
    ExileServer_BigfootsShipwrecks_maintainShipwrecksCommand, 
    [
        BS_count_shipwrecks, 
        BS_player_showCrateClaimMessageRadius,
        BS_player_showCrateClaimMessage
    ], 
    true
] call ExileServer_system_thread_addTask;

"Finished initialization." call ExileServer_BigfootsShipwrecks_util_logCommand;

true