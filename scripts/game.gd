extends Node2D

var is_menu_open: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	# Register global callbacks
	PlayerResources.wood_update_callbacks["wood_unlock"] = wood_unlock

	# Register global signals
	GlobalSignals.craft_spear.connect(_on_player_ui_craft_spear)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("player_menu_toggle"):
		if !$OverworldCamera/PlayerMenu.visible:
			$OverworldCamera/PlayerMenu.show()
			$OverworldCamera/PlayerMenu.focus_player_menu()
			$Player.ignore_movement = true
		else:
			$OverworldCamera/PlayerMenu.hide()
			$Player.ignore_movement = false

func wood_unlock():
	$OverworldCamera/TextLog.add_text("New Crafting unlocked: Press <TAB> to access", 10)
	PlayerResources.wood_update_callbacks.erase("wood_unlock")

func _on_player_got_axe():
	PlayerResources.player_has_axe = true
	$OverworldCamera/TextLog.add_text("You got an Axe!", 5)

func _on_player_ui_craft_spear():
	if PlayerResources.player_has_spear:
		$OverworldCamera/TextLog.add_text("You already have a spear", 2)
	if PlayerResources.wood >= 20:
		$Player.has_spear = true
		PlayerResources.player_has_spear = true
		$OverworldCamera/TextLog.add_text("You crafted a spear! Maybe try fishing?", 10)
		PlayerResources.wood -= 20
