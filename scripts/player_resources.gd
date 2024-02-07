extends Node

var wood: int = 0 : set = _set_wood, get = _get_wood
var wood_update_callbacks = {}
var write_to_text_log = null

var player_has_axe: bool = false
var player_has_spear: bool = false
var player_has_club: bool = false

func _ready():
	pass

# func _set_has_axe(new_value: bool) -> void:
# 	player_has_axe = new_value
# 	if PLAYER_NODE:
# 		PLAYER_NODE.has_axe = player_has_axe
# 	else: # Error, we should have a valid reference to the player
# 		push_error("PLAYER REFFERENCE NULL")

# func _set_has_spear(new_value: bool) -> void:
# 	player_has_spear = new_value
# 	if PLAYER_NODE:
# 		PLAYER_NODE.has_spear = true
# 	else:
# 		push_error("PLAYER REFFERENCE NULL")

# func _set_has_club(new_value: bool) -> void:
# 	player_has_club = new_value
# 	if PLAYER_NODE:
# 		PLAYER_NODE.has_club = true
# 	else:
# 		push_error("PLAYER REFFERENCE NULL")

func _set_wood(new_value: int) -> void:
	wood = new_value
	# iterate over keys in callback dictonary
	var keys = wood_update_callbacks.keys()
	for key in keys:
		var value = wood_update_callbacks[key]
		value.call()

func _get_wood() -> int:
	return wood
