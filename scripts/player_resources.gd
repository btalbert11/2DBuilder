extends Node

var PLAYER_NODE: Node2D

var wood: int = 0 : set = _set_wood, get = _get_wood
var wood_update_callbacks = []

var player_has_axe: bool = false : set = _set_has_axe

func _set_has_axe(new_value: bool):
	player_has_axe = new_value
	if PLAYER_NODE:
		PLAYER_NODE.has_axe = player_has_axe
	else: # Error, we should have a valid reference to the player
		push_error("PLAYER REFFERENCE NULL")

func _set_wood(new_value: int):
	wood = new_value
	for function in wood_update_callbacks:
		function.call()
	print(wood)

func _get_wood() -> int:
	return wood
