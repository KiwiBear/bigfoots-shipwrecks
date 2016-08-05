if (!isServer) exitWith {};

params [["_type",""],["_title",""],["_message",""],"_toastType"];
_toastType = format ["%1TitleAndText", _type];

["toastRequest", [_toastType, [_title,_message]]] call ExileServer_system_network_send_broadcast; 