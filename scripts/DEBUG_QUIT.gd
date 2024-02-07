extends Node


func _unhandled_input(event):
	if event.is_action_pressed("DEBUG_QUIT"):
		get_tree().quit()
