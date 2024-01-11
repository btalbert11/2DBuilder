extends Node

var wood: int = 0 : set = _set_wood, get = _get_wood
var wood_update_callbacks = []

func _set_wood(new_value):
	wood = new_value
	for function in wood_update_callbacks:
		function.call()
	print(wood)

func _get_wood() -> int:
	return wood
