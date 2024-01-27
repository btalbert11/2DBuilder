extends Node2D

var is_menu_open: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("player_menu_toggle"):
		if !$OverworldCamera/PlayerMenu.visible:
			$OverworldCamera/PlayerMenu.set_process(true)
			$OverworldCamera/PlayerMenu.show()
			$Player.ignore_movement = true
		else:
			$OverworldCamera/PlayerMenu.set_process(false)
			$OverworldCamera/PlayerMenu.hide()
			$Player.ignore_movement = false

